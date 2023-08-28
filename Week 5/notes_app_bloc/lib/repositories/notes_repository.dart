// create interface for NotesRepository with few functions
// Path: lib/repositories/notes_repository.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app_bloc/data/models/note.dart';

abstract class INotesRepository {
  Future<List<Note>> getNotes();
  Future<void> addNote({
    required String title,
    required String description,
  });
}

class NotesRepository implements INotesRepository {
  // firestore database
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference _notesCollection;
  NotesRepository() {
    _notesCollection = _firestore.collection("notes");
  }
  @override
  Future<void> addNote({required String title, required String description}) {
    return _notesCollection.doc().set({
      "title": title,
      "description": description,
      "createdAt": DateTime.now(),
    });
  }

  @override
  Future<List<Note>> getNotes() async {
    var x = await _notesCollection.get();
    final List<Note> notes = [];
    // return the list of notes
    for (var element in x.docs) {
      notes.add(
        Note(
          title: element["title"],
          description: element["description"],
          createdAt: element["createdAt"].toString(),
        ),
      );
    }
    return notes;
  }
}
