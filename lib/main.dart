// ignore_for_file: prefer_const_constructors
import 'package:provider/provider.dart';
import 'package:tenth_note_app/models/note_database.dart';
import 'package:flutter/material.dart';
import 'package:tenth_note_app/pages/notes_pages.dart';

void main() async {
  //INITIALIZE NOTE ISAR DB
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();

  runApp(ChangeNotifierProvider(
    create: (context) => NoteDatabase(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesPage(),
    );
  }
}
