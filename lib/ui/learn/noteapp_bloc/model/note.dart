class Note {
  final String title;
  bool? isDone;
  bool? isDeleted;

  Note({
    required this.title,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Note note({
    String? title,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Note(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
        title: map['title'] ?? '',
        isDone: map['isDone'],
        isDeleted: map['isDeleted']);
  }

  @override
  List<Object?> get props => [
        title,
        isDone,
        isDeleted,
      ];
}
