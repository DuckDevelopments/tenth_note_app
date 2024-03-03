import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tenth_note_app/models/note.dart';

class NoteDatabse {
  static late Isar isar;

  //INITIALIZE DATABASE
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [NoteSchema],
      directory: dir.path,
    );
  }

  //list of notes
  final List<Note> currentNotes = [];

  //CREATE
  Future<void> addNote(String textFromUser) async {
    //create new note
    final newNote = Note()..text = textFromUser;

    //save to db
    await isar.writeTxn(() => isar.notes.put(newNote));

    //re-read from db
    fetchNotes();
  }

  //READ
  Future<void> fetchNotes() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNotes);
  }

  //DELETE
}
