// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
class Example extends _Example with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Example(
    String id,
    String value, {
    int? kilometers = 500,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Example>({
        'kilometers': 500,
      });
    }
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'value', value);
    RealmObjectBase.set(this, 'kilometers', kilometers);
  }

  Example._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get value => RealmObjectBase.get<String>(this, 'value') as String;
  @override
  set value(String value) => RealmObjectBase.set(this, 'value', value);

  @override
  int? get kilometers => RealmObjectBase.get<int>(this, 'kilometers') as int?;
  @override
  set kilometers(int? value) => RealmObjectBase.set(this, 'kilometers', value);

  @override
  Stream<RealmObjectChanges<Example>> get changes =>
      RealmObjectBase.getChanges<Example>(this);

  @override
  Stream<RealmObjectChanges<Example>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Example>(this, keyPaths);

  @override
  Example freeze() => RealmObjectBase.freezeObject<Example>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'value': value.toEJson(),
      'kilometers': kilometers.toEJson(),
    };
  }

  static EJsonValue _toEJson(Example value) => value.toEJson();
  static Example _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'value': EJsonValue value,
      } =>
        Example(
          fromEJson(id),
          fromEJson(value),
          kilometers: fromEJson(ejson['kilometers'], defaultValue: 500),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Example._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, Example, 'Example', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('value', RealmPropertyType.string),
      SchemaProperty('kilometers', RealmPropertyType.int, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
