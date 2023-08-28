import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_app_bloc/data/models/note.dart';
import 'package:notes_app_bloc/repositories/notes_repository.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  final INotesRepository repository;

  NotesCubit(this.repository) : super(NotesInitial()) {
    getNotes();
  }

  void getNotes() async {
    if (state is! NotesLoaded) {
      emit(NotesLoading());
    }
    // emit(NotesLoading());
    final List<Note> notes = await repository.getNotes();
    emit(NotesLoaded(notes));
  }

  void addNote(Note note) async {
    await repository.addNote(
      title: note.title,
      description: note.description,
    );
    getNotes();
  }
}
