import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:zhihu_daily/model/story.dart';

class CollectionManager {
  static CollectionManager _instance;

  _CollectionDBHelper _dbHelper;

  CollectionManager._internal() {
    _dbHelper = _CollectionDBHelper();
  }

  factory CollectionManager() {
    if (_instance == null) {
      _instance = CollectionManager._internal();
    }
    return _instance;
  }

  destroy() {
    _dbHelper.close();
  }

  Future<List<StoryModel>> getAllCollections() async {
    return _dbHelper.getAllCollections();
  }

  Future<bool> collect(StoryModel story) {
    return _dbHelper.collect(story);
  }

  Future<bool> delete(StoryModel story) {
    return _dbHelper.delete(story);
  }

  Future<bool> hasCollected(StoryModel story) {
    return _dbHelper.hasCollected(story);
  }
}

class _CollectionDBHelper {
  static const String DB_NAME = 'ZHIHU_DAILY';
  static const int DB_VERSION = 1;

  static const String TABLE_NAME = 'COLLECTION';

  static const String COLUMN_ID = 'id';
  static const String COLUMN_TITLE = 'title';
  static const String COLUMN_IMAGE = 'image';

  static const String SQL_CREATE_TABLE = 'CREATE TABLE ' + TABLE_NAME + ' ('
      + COLUMN_ID + ' INTEGER PRIMARY KEY, '
      + COLUMN_TITLE + ' TEXT, '
      + COLUMN_IMAGE + ' TEXT)';

  static const String SQL_GET_ALL = 'SELECT * FROM ' + TABLE_NAME;

  static const String SQL_COLLECT = 'INSERT INTO ' + TABLE_NAME + ' ('
      + COLUMN_ID + ', '
      + COLUMN_TITLE + ', '
      + COLUMN_IMAGE + ') VALUES(?, ?, ?)';

  static const String SQL_DELETE = 'DELETE FROM ' + TABLE_NAME
      + ' WHERE ' + COLUMN_ID + ' = ?';

  static const String SQL_HAS_COLLECTED = 'SELECT COUNT(*) FROM ' + TABLE_NAME
      + ' WHERE ' + COLUMN_ID + ' = ?';

  Database database;

  createAndOpenDB() async {
    String basePath = await getDatabasesPath();
    String dbPath = join(basePath, DB_NAME);
    database = await openDatabase(
      dbPath,
      version: DB_VERSION,
      onCreate: onCreate,
    );
  }

  onCreate(Database db, int version) async {
    await db.execute(SQL_CREATE_TABLE);
  }

  close() async {
    await createAndOpenDB();
    await database.close();
  }

  Future<List<StoryModel>> getAllCollections() async {
    await createAndOpenDB();
    List<StoryModel> stories = [];
    List<Map<String, dynamic>> list = await database.rawQuery(SQL_GET_ALL);
    list.forEach((json) {
      stories.add(StoryModel.fromJson(json));
    });
    return stories;
  }

  Future<bool> collect(StoryModel story) async {
    await createAndOpenDB();
    return await database.rawInsert(
        SQL_COLLECT, [story.id, story.title, story.image]) > 0;
  }

  Future<bool> delete(StoryModel story) async {
    await createAndOpenDB();
    return await database.rawDelete(SQL_DELETE, [story.id]) > 0;
  }

  Future<bool> hasCollected(StoryModel story) async {
    await createAndOpenDB();
    return Sqflite.firstIntValue(await database.rawQuery(SQL_HAS_COLLECTED, [story.id])) > 0;
  }
}