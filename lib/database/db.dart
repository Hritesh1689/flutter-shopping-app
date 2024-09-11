
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class ShopDb {
  Database? _db;

  // Singleton instance
  static final ShopDb _singleton = ShopDb._internal();

  factory ShopDb() {
    return _singleton;
  }

  ShopDb._internal();

  Future<Database> get db async {
    _db ??= await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final appDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDir.path, 'sport_wiz.db');
    final database = await databaseFactoryIo.openDatabase(dbPath);
    return database;
  }
}