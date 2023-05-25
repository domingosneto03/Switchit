import 'package:realm/realm.dart';
import 'package:switchit/database/user_realm.dart';


class DatabaseRealm {
  static final DatabaseRealm _singleton = DatabaseRealm._internal();
  late Realm realm;

  factory DatabaseRealm() {
    return _singleton;
  }

  // User

  Future setUser(
      String name, String surname, String email, String docId) async {
    var user = UserRealm(name, surname, email, docId);

    realm.write(() {
      realm.add(user);
    });
  }


  Future<String?> getUserEmail() async {
    var data = realm.all<UserRealm>();
    UserRealm user = data[0];
    return user.email;
  }

  Future<String?> getUserSurname() async {
    var data = realm.all<UserRealm>();
    UserRealm user = data[0];
    return user.surname;
  }

  Future<String?> getUserDocId() async {
    var data = realm.all<UserRealm>();
    UserRealm user = data[0];
    return user.docId;
  }

  Future<String?> getUserName() async {
    var data = realm.all<UserRealm>();
    UserRealm user = data[0];
    return user.name;
  }

  Future setIsRememberedUserDetails(bool isRememberedUserDetails) async {
    var data = realm.all<UserRealm>();
    UserRealm user = data[0];

    user.isRememberedDetails = isRememberedUserDetails;

    realm.write(() {
      realm.add(user);
    });
  }

  Future<bool?> getIsRememberedUserDetails() async {
    var data = realm.all<UserRealm>();
    UserRealm user = data[0];
    return user.isRememberedDetails;
  }

  void clearDatabase() async {
    realm.write(() {
      realm.deleteAll<UserRealm>();
    });
  }

  DatabaseRealm._internal() {
    var config = Configuration.local([UserRealm.schema]);
    realm = Realm(config);
  }

  String getUserDocIds()  {
    var data = realm.all<UserRealm>();
    UserRealm user = data[0];
    return user.docId;
  }
}
