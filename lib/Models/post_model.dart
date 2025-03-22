class Posts {
  int? id;
  String? title;
  String? body;

  Posts({
    required this.id,
    required this.title,
    required this.body,
  });

  factory Posts.fromJSON(Map<String, dynamic> map) {
    return Posts(
      id: map['id'] ,
      title: map['title'],
      body: map['body'],
    );
  }
}
