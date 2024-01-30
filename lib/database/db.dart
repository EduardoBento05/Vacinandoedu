import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

import '../models/questions_model.dart';
import '../repositories/perguntas_repository.dart';

class DB {
  // Construtor privado
  DB._();

  // Instância única de DB
  static final DB instance = DB._();

  // Instância do SQLite
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    return await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'questions.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE questions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nivel INTEGER NOT NULL,
        fase INTEGER NOT NULL,
        title TEXT NOT NULL,
        options TEXT NOT NULL
      )
    ''');

    await _incluirPerguntasnoBanco(db);
  }

  _incluirPerguntasnoBanco(Database db) async {
    List<Question> lista = PerguntasRepository().perguntas;

    for (Question pergunta in lista) {
      await db.insert('questions', pergunta.toMap());
    }
  }
}
