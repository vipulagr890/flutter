class Task {
  int id;
  String title;
  String priority;
  DateTime date;
  int status; //0 if task is incomplete & 1 if task is complete

  Task.withid(
      {required this.id,
      required this.title,
      required this.priority,
      required this.date,
      required this.status});

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['priority'] = priority;
    map['date'] = date.toIso8601String();
    map['status'] = status;
    return map;
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task.withid(
        id: map['id'],
        title: map['title'],
        priority: map['priority'],
        date: DateTime.parse(map['date']),
        status: map['status']);
  }
}
