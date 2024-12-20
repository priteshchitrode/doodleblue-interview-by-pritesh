
import 'package:doodleblue_interview_by_pritesh/data/response/result.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/model/todoModel.dart';

abstract class NoteState {}

class NoteLoading extends NoteState {}

class NoteSuccess extends NoteState {
  final List<NoteModel> todos;
  NoteSuccess(this.todos);
}

class NoteError extends NoteState {
  final ErrorType errorType;
  NoteError(this.errorType);
}
