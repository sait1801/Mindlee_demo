class Message {
  final String id;
  final String content;
  final bool liked;

  Message({
    required this.id,
    required this.content,
    required this.liked,
  });

  // fromJson constructor for firestore readings
  Message.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        content = json['content'] ?? '',
        liked = json['liked'] ?? false;

  // toJson method for writing to firestore
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'liked': liked,
    };
  }
}
