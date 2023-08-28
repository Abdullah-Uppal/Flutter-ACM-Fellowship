import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app_bloc/data/models/note.dart';
import 'package:notes_app_bloc/logic/notes_cubit/notes_cubit.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  // form key
  final formKey = GlobalKey<FormState>();
  // editing controllers
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Note"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
            ),
            TextFormField(
              maxLines: 5,
              controller: descriptionController,
            ),
            FilledButton(
                onPressed: () {
                  context.read<NotesCubit>().addNote(Note(
                        title: titleController.text,
                        description: descriptionController.text,
                        createdAt: DateTime.now().toString(),
                      ));
                  context.pop();
                },
                child: const Text("Add"))
          ],
        ),
      ),
    );
  }
}
