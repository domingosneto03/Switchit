import 'package:realm/realm.dart';

part 'user_realm.g.dart';

@RealmModel()
class _UserRealm {
  int id = 1;
  late String name;
  late String surname;
  late String email;
  late String docId;
  bool isRememberedDetails = false;
  List<String> followedUserIds = [];
}
