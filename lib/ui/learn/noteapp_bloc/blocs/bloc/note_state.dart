
 import 'package:equatable/equatable.dart';

import '../../model/note.dart';

class NotesState extends Equatable {
  final List<Note> allNotes;
  const NotesState({
    this.allNotes = const <Note>[],
  });
  @override
   List<Object> get props => [allNotes];
}
