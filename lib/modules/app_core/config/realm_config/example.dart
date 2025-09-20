import 'package:realm/realm.dart';
part 'example.realm.dart';

@RealmModel()
class _Example {
  @PrimaryKey()
  late String id;

  late String value;

  int? kilometers = 500;
}
