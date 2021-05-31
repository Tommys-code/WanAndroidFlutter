import 'dart:async';

import 'package:floor/floor.dart';
import 'package:wan_android_flutter/db/db_data.dart';
import 'package:wan_android_flutter/db/my_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'my_db.g.dart';

@Database(version: 1, entities: [DbData])
abstract class MyDb extends FloorDatabase {
  MyDao get myDao;
}
