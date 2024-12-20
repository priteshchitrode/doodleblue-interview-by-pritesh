
import 'package:doodleblue_interview_by_pritesh/data/response/result.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/model/todoModel.dart';
import 'package:doodleblue_interview_by_pritesh/utils/constant/constantGlobalVariables.dart';

abstract class NoteState {}

class NoteLoading extends NoteState {}

class NoteSuccess extends NoteState {
  final List<NoteModel> todos;
  final String filter;
  final List<NoteModel> filteredTodos;

  NoteSuccess(this.todos, {this.filter = ALL}) : filteredTodos = _applyFilter(todos, filter);

  static List<NoteModel> _applyFilter(List<NoteModel> todos, String filter) {
    if (filter == ALL) {
      return todos;
    }
    return todos.where((todo) => todo.isCompleted == (filter == COMPLETE)).toList();
  }
}

class NoteError extends NoteState {
  final ErrorType errorType;
  NoteError(this.errorType);
}
