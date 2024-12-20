import 'package:doodleblue_interview_by_pritesh/data/response/result.dart';
import 'package:doodleblue_interview_by_pritesh/feature/dataBase/databaseHelper.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/bloc/noteBloc/noteEvent.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/bloc/noteBloc/noteState.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/model/todoModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  NoteBloc() : super(NoteLoading()) {
    on<LoadNotes>(_onLoadTodos);
    on<AddNote>(_onAddTodo);
    on<UpdateNote>(_onUpdateTodo);
    on<DeleteNote>(_onDeleteTodo);
    on<UpdateFilter>(_onUpdateFilter);
  }

  Future<void> _onLoadTodos(LoadNotes event, Emitter<NoteState> emit) async {
    try {
      final todos = await dbHelper.fetchTodos();
      emit(NoteSuccess(todos.map((e) => NoteModel.fromMap(e)).toList()));
    } catch (e) {
      emit(NoteError(ErrorWithMessage( message: '$e' )));
    }
  }

  Future<void> _onAddTodo(AddNote event, Emitter<NoteState> emit) async {
    try {
      await dbHelper.insertTodo(event.todo.toMap());
      add(LoadNotes());
    } catch (e) {
      emit(NoteError(ErrorWithMessage( message: '$e' )));
    }
  }

  Future<void> _onUpdateTodo(UpdateNote event, Emitter<NoteState> emit) async {
    try {
      await dbHelper.updateTodo(event.todo.toMap());
      add(LoadNotes());
    } catch (e) {
      emit(NoteError(ErrorWithMessage( message: '$e' )));
    }
  }

  Future<void> _onDeleteTodo(DeleteNote event, Emitter<NoteState> emit) async {
    try {
      await dbHelper.deleteTodo(event.id);
      add(LoadNotes());
    } catch (e) {
      emit(NoteError(ErrorWithMessage( message: '$e' )));
    }
  }

  void _onUpdateFilter(UpdateFilter event, Emitter<NoteState> emit) {
    if (state is NoteSuccess) {
      final currentState = state as NoteSuccess;
      emit(NoteSuccess(currentState.todos, filter: event.filter));
    }
  }



}
