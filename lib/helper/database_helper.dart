import 'package:sqflite/sqflite.dart';
import 'package:tes/model/item.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;
  DatabaseHelper.internal();
  final String tableName = 'tes';
  final String id = "id";
  final String itemName = "itemName";

  Future<Database?> get _db async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDb();
    return _database;
  }

  Future<Database> _initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'tes.db');
    return openDatabase(path, version: 1, onCreate: onCreate);
  }

  Future<void> onCreate(Database db, int version) async {
    var sql = "CREATE TABLE $tableName($id INTEGER PRIMARY KEY, "
        "$itemName TEXT)";
    await db.execute(sql);
  }

  Future<int?> saveData(Item item) async {
    var dbClient = await _db;
    return await dbClient!.insert(tableName, item.toMap());
  }

  Future<List?> getData() async {
    var dbClient = await _db;
    var result = await dbClient!.query(tableName, columns: [id, itemName]);
    return result;
  }
}
