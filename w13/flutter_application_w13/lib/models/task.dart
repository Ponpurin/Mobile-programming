class Task {
  static const String kTableName = 'tasks';
  static const String kColumnID = '_id';
  static const String kColumnTitle = '_title';
  static const String kColumnIsDone = '_isdone';

  int? id;
  final String title;
  bool isDone;

  Task({required this.title, this.isDone = false});
  Task.fromMap(Map<dynamic, dynamic> map)
      : id = map[kColumnID],
        title = map[kColumnTitle],
        isDone = map[kColumnIsDone] == 1 ? true : false;

  void toggle() {
    isDone = !isDone;
  }

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      kColumnTitle: title,
      kColumnIsDone: isDone == true ? 1 : 0
    };
    if (id != null) {
      map[kColumnID] = id;
    }
    return map;
  }
}
