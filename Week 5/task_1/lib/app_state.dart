import 'package:flutter/material.dart';
import 'package:task_1/models/lesson.dart';
import 'package:task_1/models/program.dart';
import 'package:task_1/network/api_service.dart';

class AppState extends ChangeNotifier {
  late Future<List<Program>> programs;
  late Future<List<Lesson>> lessons;

  AppState() {
    init();
  }
  void init() async {
    ApiService apiService = ApiService();

    programs = apiService.getPrograms();
    programs.then((value) {
      notifyListeners();
    });

    lessons = apiService.getLessons();
    lessons.then((value) {
      notifyListeners();
    });

  }
}
