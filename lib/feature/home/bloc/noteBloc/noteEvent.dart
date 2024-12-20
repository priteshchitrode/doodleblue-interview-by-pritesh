import 'package:doodleblue_interview_by_pritesh/feature/home/model/todoModel.dart';

abstract class NoteEvent {}

class LoadNotes extends NoteEvent {}

class AddNote extends NoteEvent {
  final NoteModel todo;
  AddNote(this.todo);
}

class UpdateNote extends NoteEvent {
  final NoteModel todo;
  UpdateNote(this.todo);
}

class DeleteNote extends NoteEvent {
  final int id;
  DeleteNote(this.id);
}

class UpdateFilter extends NoteEvent {
  final String filter;
  UpdateFilter(this.filter);
}
