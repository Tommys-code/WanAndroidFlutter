import 'package:floor/floor.dart';

@entity
class DbData {
  @primaryKey
  final String dataKey;
  final String data;

  DbData(this.dataKey, this.data);
}
