// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_realm.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class UserRealm extends _UserRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  UserRealm(
    String name,
    String surname,
    String email,
    String docId, {
    int id = 1,
    bool isRememberedDetails = false,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<UserRealm>({
        'id': 1,
        'isRememberedDetails': false,
      });
    }
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'surname', surname);
    RealmObjectBase.set(this, 'email', email);
    RealmObjectBase.set(this, 'docId', docId);
    RealmObjectBase.set(this, 'isRememberedDetails', isRememberedDetails);
  }

  UserRealm._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get surname => RealmObjectBase.get<String>(this, 'surname') as String;
  @override
  set surname(String value) => RealmObjectBase.set(this, 'surname', value);

  @override
  String get email => RealmObjectBase.get<String>(this, 'email') as String;
  @override
  set email(String value) => RealmObjectBase.set(this, 'email', value);

  @override
  String get docId => RealmObjectBase.get<String>(this, 'docId') as String;
  @override
  set docId(String value) => RealmObjectBase.set(this, 'docId', value);

  @override
  bool get isRememberedDetails =>
      RealmObjectBase.get<bool>(this, 'isRememberedDetails') as bool;
  @override
  set isRememberedDetails(bool value) =>
      RealmObjectBase.set(this, 'isRememberedDetails', value);

  @override
  Stream<RealmObjectChanges<UserRealm>> get changes =>
      RealmObjectBase.getChanges<UserRealm>(this);

  @override
  UserRealm freeze() => RealmObjectBase.freezeObject<UserRealm>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(UserRealm._);
    return const SchemaObject(ObjectType.realmObject, UserRealm, 'UserRealm', [
      SchemaProperty('id', RealmPropertyType.int),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('surname', RealmPropertyType.string),
      SchemaProperty('email', RealmPropertyType.string),
      SchemaProperty('docId', RealmPropertyType.string),
      SchemaProperty('isRememberedDetails', RealmPropertyType.bool),
    ]);
  }
}
