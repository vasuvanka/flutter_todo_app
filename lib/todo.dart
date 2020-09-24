class Todo {
  String text;
  DateTime createdAt;
  DateTime completedAt;
  bool isDone;
  int id;

  Todo(this.text,this.createdAt,this.completedAt,this.isDone,this.id);

  Todo.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        id = json['id'],
        createdAt = json['createdAt'],
        completedAt = json['completedAt'],
        isDone = json['isDone'];

 Map<String,dynamic> toJson() => {
    "text":text,
    "id":id,
    "createdAt": createdAt,
    "completedAt":completedAt,
    "isDone": isDone,
  };
}