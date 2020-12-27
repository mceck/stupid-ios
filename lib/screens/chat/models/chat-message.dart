class ChatMessage {
  final bool fromYou;
  final String message;
  bool isSending;

  ChatMessage({this.fromYou = true, this.message, this.isSending = false});
}
