import 'package:flutter/material.dart';
import 'package:stupid_ios/screens/home/models/app-link.dart';

class Folder {
  final String name;
  final List<AppLink> apps;
  final Image icon;

  const Folder({this.name, this.apps, this.icon});
}

final Folder frontendFolder = Folder(
  name: 'Frontend',
  icon: Image.asset('resource/image/frontend.png'),
  apps: [
    AppLink(
      name: 'HTML5',
      icon: Image.asset('resource/image/html5.png'),
    ),
    AppLink(
      name: 'CSS3',
      icon: Image.asset('resource/image/css.png'),
    ),
    AppLink(
      name: 'JavaScript',
      icon: Image.asset('resource/image/js.png'),
    ),
    AppLink(
      name: 'React',
      icon: Image.asset('resource/image/react.png'),
    ),
    AppLink(
      name: 'React Native',
      icon: Image.asset('resource/image/react_native.png'),
    ),
    AppLink(
      name: 'Angular',
      icon: Image.asset('resource/image/angular.png'),
    ),
    AppLink(
      name: 'Vue',
      icon: Image.asset('resource/image/vue.png'),
    ),
    AppLink(
      name: 'Svelt',
      icon: Image.asset('resource/image/svelt.png'),
    ),
    AppLink(
      name: 'Dart',
      icon: Image.asset('resource/image/dart.png'),
    ),
    AppLink(
      name: 'Flutter',
      icon: Image.asset('resource/image/flutter.png'),
    ),
  ],
);

final Folder backendFolder = Folder(
  name: 'Backend',
  icon: Image.asset('resource/image/backend.png'),
  apps: [
    AppLink(
      name: 'RESTful',
      icon: Image.asset('resource/image/rest.png'),
    ),
    AppLink(
      name: 'GraphQL',
      icon: Image.asset('resource/image/graphql.png'),
    ),
    AppLink(
      name: 'Serverless',
      icon: Image.asset('resource/image/serverless.png'),
    ),
    AppLink(
      name: 'Node',
      icon: Image.asset('resource/image/node.png'),
    ),
    AppLink(
      name: 'Python',
      icon: Image.asset('resource/image/python.png'),
    ),
    AppLink(
      name: 'Java',
      icon: Image.asset('resource/image/java.png'),
    ),
    AppLink(
      name: 'Spring',
      icon: Image.asset('resource/image/spring.png'),
    ),
    AppLink(
      name: 'Mongodb',
      icon: Image.asset('resource/image/mongo.png'),
    ),
    AppLink(
      name: 'PostgreSQL',
      icon: Image.asset('resource/image/postgres.png'),
    ),
    AppLink(
      name: 'SQL Server',
      icon: Image.asset('resource/image/mssql.png'),
    ),
    AppLink(
      name: 'MySql',
      icon: Image.asset('resource/image/mysql.png'),
    ),
    AppLink(
      name: 'Oracle',
      icon: Image.asset('resource/image/oracle.png'),
    ),
  ],
);

final Folder otherSkillFolder = Folder(
  name: 'Other',
  icon: Image.asset('resource/image/other.png'),
  apps: [
    AppLink(
      name: 'Git',
      icon: Image.asset('resource/image/git.png'),
    ),
    AppLink(
      name: 'Docker',
      icon: Image.asset('resource/image/docker.png'),
    ),
    AppLink(
      name: 'AWS',
      icon: Image.asset('resource/image/aws.png'),
    ),
    AppLink(
      name: 'Firebase',
      icon: Image.asset('resource/image/firebase.png'),
    ),
  ],
);

final Folder prizesFolder = Folder(
    name: 'Prizes',
    icon: Image.asset('resource/image/prize.png'),
    apps: [
      AppLink(
        name: '1st place\nPlansoft coding challenge 2021',
        icon: Image.asset('resource/image/plan.png'),
      ),
      AppLink(
        name: '1st place\nCodemotion Sailogy frontend challenge 2021',
        icon: Image.asset('resource/image/codemotion.png'),
      ),
      AppLink(
        name:
            '1st place\nCodemotion Lord of code Spanish edition - Frontend 2022',
        icon: Image.asset('resource/image/codemotion.png'),
      ),
    ]);
