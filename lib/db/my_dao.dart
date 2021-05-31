import 'package:floor/floor.dart';
import 'package:wan_android_flutter/db/db_data.dart';

@dao
abstract class MyDao {
  @Query("SELECT * FROM DbData WHERE dataKey = :key")
  Future<DbData?> getDataByKey(String key);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertData(DbData person);

  Future<void> save(String dataKey,String value) async {
    insertData(DbData(dataKey, value));
  }
}
