import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'Model/details_model.dart';



class DBHelper {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  static Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), 'students.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE students(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, address TEXT, mobile TEXT)',
        );
      },
    );
  }

  static Future<int> insertStudent(DetailsModel student) async {
    final db = await database;
    return await db.insert('students', student.toMap());
  }

  static Future<List<DetailsModel>> getStudents() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('students');
    return List.generate(maps.length, (i) => DetailsModel.fromMap(maps[i]));
  }

  static Future<int> deleteStudent(int id) async {
    final db = await database;
    return await db.delete('students', where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> updateStudent(DetailsModel student) async {
    final db = await database;
    return await db.update(
      'students',
      student.toMap(),
      where: 'id = ?',
      whereArgs: [student.id],
    );
  }

}
