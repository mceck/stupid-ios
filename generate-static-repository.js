const { exec } = require('child_process');
const fs = require('fs');

exec('git ls-tree -r master --name-only', (error, stdout, stderr) => {
  if (error) {
    console.log(`error: ${error.message}`);
    return;
  }
  if (stderr) {
    console.log(`stderr: ${stderr}`);
    return;
  }
  const fileList = stdout.split('\n').filter((f) => !f.includes('.vscode'));
  fileList.sort((a, b) => {
    const deepDiff = b.split('/').length - a.split('/').length;
    if (deepDiff) {
      return deepDiff;
    }
    if (a === b) return 0;
    return a > b ? 1 : -1;
  });
  const json = {
    path: '/',
    id: 'root',
    type: 'tree',
    children: [],
  };

  let children, fullPath;
  for (let file of fileList) {
    if (!file) continue;
    const tree = file.split('/');
    children = json.children;
    fullPath = '';
    for (let i = 0; i < tree.length; i++) {
      const p = tree[i];
      fullPath += `/${p}`;
      const elem = children.find((c) => c.path === p);
      if (elem) {
        children = elem.children || [];
      } else {
        //create element
        if (i < tree.length - 1) {
          const child = {
            id: fullPath.slice(1),
            path: p,
            type: 'tree',
            children: [],
          };
          children.push(child);
          children = child.children;
        } else {
          children.push({
            id: fullPath.slice(1),
            path: p,
            type: 'blob',
            url:
              'https://raw.githubusercontent.com/mceck/stupid-shell/master/' +
              file,
          });
        }
      }
    }
  }
  fs.writeFileSync(
    'lib/screens/vscode/repo.dart',
    `const Map<String, dynamic> STATIC_REPO = ${JSON.stringify(json)};`
  );
});
