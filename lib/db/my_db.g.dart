// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorMyDb {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MyDbBuilder databaseBuilder(String name) => _$MyDbBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MyDbBuilder inMemoryDatabaseBuilder() => _$MyDbBuilder(null);
}

class _$MyDbBuilder {
  _$MyDbBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$MyDbBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$MyDbBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<MyDb> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$MyDb();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$MyDb extends MyDb {
  _$MyDb([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MyDao? _myDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `DbData` (`dataKey` TEXT NOT NULL, `data` TEXT NOT NULL, PRIMARY KEY (`dataKey`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MyDao get myDao {
    return _myDaoInstance ??= _$MyDao(database, changeListener);
  }
}

class _$MyDao extends MyDao {
  _$MyDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _dbDataInsertionAdapter = InsertionAdapter(
            database,
            'DbData',
            (DbData item) =>
                <String, Object?>{'dataKey': item.dataKey, 'data': item.data});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<DbData> _dbDataInsertionAdapter;

  @override
  Future<DbData?> getDataByKey(String key) async {
    return _queryAdapter.query('SELECT * FROM DbData WHERE dataKey = ?1',
        mapper: (Map<String, Object?> row) =>
            DbData(row['dataKey'] as String, row['data'] as String),
        arguments: [key]);
  }

  @override
  Future<void> insertData(DbData person) async {
    await _dbDataInsertionAdapter.insert(person, OnConflictStrategy.replace);
  }
}
