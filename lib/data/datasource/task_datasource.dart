import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:notbook_todo/data/data.dart';

import '../../utils/utils.dart';

class TaskDataSource {
  static final TaskDataSource _instance = TaskDataSource._();
  factory TaskDataSource() => _instance;

  TaskDataSource._() {
    _initDB();
  }

  static Database? _database;

  Future<Database> get getDatabase async {
    _database ??= await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    try {
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, DBKeys.dbName);
      final database = await openDatabase(
        path,
        version: 1,
        onCreate: _onCreate,
      );
      return database;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE ${DBKeys.dbTable}(
    ${DBKeys.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${DBKeys.titleColumn} TEXT,
    ${DBKeys.noteColumn} TEXT,
    ${DBKeys.dateColumn} TEXT,
    ${DBKeys.timeColumn} TEXT,
    ${DBKeys.categoryColumn} TEXT,
    ${DBKeys.isCompletedColumn} INTEGER
    )
''');
  }

  Future<List<Task>> getAllTask() async {
    final db = await getDatabase;
    final List<Map<String, dynamic>> data =
        await db.query(DBKeys.dbTable, orderBy: "id DESC");
    return List.generate(
      data.length,
      (index) => Task.fromJson(data[index]),
    );
  }

  Future<int> createTask(Task task) async {
    final db = await getDatabase;
    return db.insert(
      DBKeys.dbTable,
      task.toJson(),
      // Eğer belirli bir anahtar değeri ile mevcut bir satır varsa
      //ve bu satırı yeni verilerle güncellemek istiyorsanız bu algoritmayı kullanabilirsiniz.
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updateTask(Task task) async {
    final db = await getDatabase;
    return db.update(
      DBKeys.dbTable,
      task.toJson(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> deleteTask(Task task) async {
    final db = await getDatabase;
    return db.delete(
      DBKeys.dbTable,
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }
}
