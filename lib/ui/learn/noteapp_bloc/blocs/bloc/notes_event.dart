import 'package:equatable/equatable.dart';

import '../../model/note.dart';

abstract class NotesEvent extends Equatable {
  const NotesEvent();

  @override
  List<Object> get props => [];
}

class AddNote extends NotesEvent {
  final Note note;

  const AddNote({
    required this.note,
  });

  @override
  List<Object> get props => [];
}
class UpdateNote extends NotesEvent {
  final Note note;

  const UpdateNote({
    required this.note,
  });

  @override
  List<Object> get props => [];
}
class DeleteNote extends NotesEvent {
  final Note note;

  const DeleteNote({
    required this.note,
  });

  @override
  List<Object> get props => [];
}
