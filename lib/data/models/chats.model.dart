class Chat {
  final String id;
  final String senderId;
  final String receiverId;
  final String message;
  final DateTime timeStamp;
  final bool readStatus;
  Chat({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.timeStamp,
    required this.readStatus,
  });
}
