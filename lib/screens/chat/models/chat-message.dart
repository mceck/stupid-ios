class ChatMessage {
  bool fromYou;
  String message;
  DateTime timestamp;
  bool isSending;

  ChatMessage({
    this.timestamp,
    this.fromYou = true,
    this.message,
    this.isSending = false,
  });
}
