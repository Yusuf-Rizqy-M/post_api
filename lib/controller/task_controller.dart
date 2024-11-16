import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/model_favorite.dart';

class TaskController extends GetxController {
  static Database? _db;

  var tasks = <ModelFavorite>[].obs;
  var favorites = <ModelFavorite>[].obs;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
    }
    return _db;
  }

  Future<Database> initDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'task_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tasks(
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            album TEXT,
            artist TEXT,
            albumImage TEXT,
            description TEXT,
            genre TEXT
          )
        ''');
      },
    );
  }

  Future<int> addTask(ModelFavorite task) async {
    var dbClient = await db;
    int result = await dbClient!.insert('tasks', task.toMap());
    loadTasks();
    return result;
  }

  Future<void> loadTasks() async {
    var dbClient = await db;
    List<Map<String, dynamic>> queryResult = await dbClient!.query('tasks');
    tasks.assignAll(
      queryResult.map((data) => ModelFavorite.fromMap(data)).toList(),
    );
  }

  Future<void> confirmDeleteTask(int id) async {
    Get.defaultDialog(
      title: "Delete Task",
      middleText: "Are you sure you want to delete this task?",
      textCancel: "No",
      textConfirm: "Yes",
      onConfirm: () async {
        await deleteTask(id); // Panggil fungsi deleteTask yang sebenarnya
        Get.back(); // Tutup dialog setelah konfirmasi
      },
      onCancel: () {
        Get.back(); // Tutup dialog tanpa menghapus
      },
    );
  }

  Future<void> deleteTask(int id) async {
    var dbClient = await db;
    await dbClient!.delete('tasks', where: 'id = ?', whereArgs: [id]);
    loadTasks();
  }

  void addFavorite(ModelFavorite task) {
    if (!favorites.contains(task)) {
      favorites.add(task);
    }
  }

  void removeFavorite(ModelFavorite task) {
    favorites.remove(task);
  }

  bool isFavorite(ModelFavorite task) {
    return favorites.any((element) =>
        element.album == task.album &&
        element.artist == task.artist &&
        element.albumImage == task.albumImage);
  }
}
