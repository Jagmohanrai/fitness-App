import 'package:database/database.dart';

class AppDatabase {
  // static final AppDatabase database = ;
  // Database _database;
  static final database =
      MemoryDatabaseAdapter().database().collection('ustaad-app');

  get instance => database;
}

class SingletonTwo {
  SingletonTwo._privateConstructor();

  static final SingletonTwo _instance = SingletonTwo._privateConstructor();

  static SingletonTwo get instance => _instance;
}
