import 'dart:convert';

import 'package:strict_json/strict_json.dart';
import 'package:test/test.dart';

import 'TestData.dart';

void main() {

  const json = JsonMap(jsonMap);

  test('JsonMap.getInt', () {
    expect(json.contains<int>(jsonMapIntKey), true);

    expect(json.getInt(jsonMapIntKey), jsonMapIntValue);
    expect(json.getInt(jsonMapBoolKey, jsonMapIntValue), jsonMapIntValue);
    expect(json.getInt(jsonMapMissKey, jsonMapIntValue), jsonMapIntValue);
    expect(json.getInt(jsonMapNullKey, jsonMapIntValue), jsonMapIntValue);

    expect(json.getNum(jsonMapIntKey), jsonMapIntValue);
    expect(json.getNumOr(jsonMapIntKey), jsonMapIntValue);

    expect(json.getIntOr(jsonMapIntKey), jsonMapIntValue);
    expect(json.getIntOr(jsonMapMissKey, jsonMapIntValue), jsonMapIntValue);
    expect(json.getIntOr(jsonMapMissKey), null);
    expect(json.getIntOr(jsonMapNullKey, jsonMapIntValue), jsonMapIntValue);
    expect(json.getIntOr(jsonMapNullKey), null);

    expect(() => json.getInt(jsonMapMissKey), throwsJsonFieldNullException);
    expect(() => json.getString(jsonMapIntKey), throwsJsonFieldTypeException);
    expect(json.getStringOr(jsonMapIntKey), null);
    expect(() => json.getBool(jsonMapIntKey), throwsJsonFieldTypeException);
    expect(json.getBoolOr(jsonMapIntKey), null);
    expect(() => json.getDouble(jsonMapIntKey), throwsJsonFieldTypeException);
    expect(json.getDoubleOr(jsonMapIntKey), null);
    expect(() => json.getMap(jsonMapIntKey), throwsJsonFieldTypeException);
    expect(json.getMapOr(jsonMapIntKey), null);
    expect(() => json.getList<dynamic>(jsonMapIntKey), throwsJsonFieldTypeException);
    expect(json.getListOr<dynamic>(jsonMapIntKey), null);
  });

  test('JsonMap.getDouble', () {
    expect(json.contains<double>(jsonMapDoubleKey), true);

    expect(json.getDouble(jsonMapDoubleKey), jsonMapDoubleValue);
    expect(json.getDouble(jsonMapBoolKey, jsonMapDoubleValue), jsonMapDoubleValue);
    expect(json.getDouble(jsonMapMissKey, jsonMapDoubleValue), jsonMapDoubleValue);
    expect(json.getDouble(jsonMapNullKey, jsonMapDoubleValue), jsonMapDoubleValue);

    expect(json.getNum(jsonMapDoubleKey), jsonMapDoubleValue);
    expect(json.getNumOr(jsonMapDoubleKey), jsonMapDoubleValue);

    expect(json.getDoubleOr(jsonMapDoubleKey), jsonMapDoubleValue);
    expect(json.getDoubleOr(jsonMapMissKey, jsonMapDoubleValue), jsonMapDoubleValue);
    expect(json.getDoubleOr(jsonMapMissKey), null);
    expect(json.getDoubleOr(jsonMapNullKey, jsonMapDoubleValue), jsonMapDoubleValue);
    expect(json.getDoubleOr(jsonMapNullKey), null);

    expect(() => json.getInt(jsonMapDoubleKey), throwsJsonFieldTypeException);
    expect(json.getIntOr(jsonMapDoubleKey), null);
    expect(() => json.getBool(jsonMapDoubleKey), throwsJsonFieldTypeException);
    expect(json.getBoolOr(jsonMapDoubleKey), null);
    expect(() => json.getString(jsonMapDoubleKey), throwsJsonFieldTypeException);
    expect(json.getStringOr(jsonMapDoubleKey), null);
    expect(() => json.getMap(jsonMapDoubleKey), throwsJsonFieldTypeException);
    expect(json.getMapOr(jsonMapDoubleKey), null);
    expect(() => json.getList<dynamic>(jsonMapDoubleKey), throwsJsonFieldTypeException);
    expect(json.getListOr<dynamic>(jsonMapDoubleKey), null);
  });

  test('JsonMap.getString', () {
    expect(json.contains<String>(jsonMapStringKey), true);

    expect(json.getString(jsonMapStringKey), jsonMapStringValue);
    expect(json.getString(jsonMapBoolKey, jsonMapStringValue), jsonMapStringValue);
    expect(json.getString(jsonMapMissKey, jsonMapStringValue), jsonMapStringValue);
    expect(json.getString(jsonMapNullKey, jsonMapStringValue), jsonMapStringValue);

    expect(json.getStringOr(jsonMapStringKey), jsonMapStringValue);
    expect(json.getStringOr(jsonMapMissKey, jsonMapStringValue), jsonMapStringValue);
    expect(json.getStringOr(jsonMapMissKey), null);
    expect(json.getStringOr(jsonMapNullKey, jsonMapStringValue), jsonMapStringValue);
    expect(json.getStringOr(jsonMapNullKey), null);

    expect(() => json.getInt(jsonMapStringKey), throwsJsonFieldTypeException);
    expect(json.getIntOr(jsonMapStringKey), null);
    expect(() => json.getBool(jsonMapStringKey), throwsJsonFieldTypeException);
    expect(json.getBoolOr(jsonMapStringKey), null);
    expect(() => json.getDouble(jsonMapStringKey), throwsJsonFieldTypeException);
    expect(json.getDoubleOr(jsonMapStringKey), null);
    expect(() => json.getMap(jsonMapStringKey), throwsJsonFieldTypeException);
    expect(json.getMapOr(jsonMapStringKey), null);
    expect(() => json.getList<dynamic>(jsonMapStringKey), throwsJsonFieldTypeException);
    expect(json.getListOr<dynamic>(jsonMapStringKey), null);
    expect(() => json.getNum(jsonMapStringKey), throwsJsonFieldTypeException);
    expect(json.getNumOr(jsonMapStringKey), null);
  });

  test('JsonMap.getBool', () {
    expect(json.contains<bool>(jsonMapBoolKey), true);

    expect(json.getBool(jsonMapBoolKey), jsonMapBoolValue);
    expect(json.getBool(jsonMapStringKey, jsonMapBoolValue), jsonMapBoolValue);
    expect(json.getBool(jsonMapMissKey, jsonMapBoolValue), jsonMapBoolValue);
    expect(json.getBool(jsonMapNullKey, jsonMapBoolValue), jsonMapBoolValue);

    expect(json.getBoolOr(jsonMapBoolKey), jsonMapBoolValue);
    expect(json.getBoolOr(jsonMapMissKey, jsonMapBoolValue), jsonMapBoolValue);
    expect(json.getBoolOr(jsonMapMissKey), null);
    expect(json.getBoolOr(jsonMapNullKey, jsonMapBoolValue), jsonMapBoolValue);
    expect(json.getBoolOr(jsonMapNullKey), null);

    expect(() => json.getInt(jsonMapBoolKey), throwsJsonFieldTypeException);
    expect(json.getIntOr(jsonMapBoolKey), null);
    expect(() => json.getDouble(jsonMapBoolKey), throwsJsonFieldTypeException);
    expect(json.getDoubleOr(jsonMapBoolKey), null);
    expect(() => json.getString(jsonMapBoolKey), throwsJsonFieldTypeException);
    expect(json.getStringOr(jsonMapBoolKey), null);
    expect(() => json.getMap(jsonMapBoolKey), throwsJsonFieldTypeException);
    expect(json.getMapOr(jsonMapBoolKey), null);
    expect(() => json.getList<dynamic>(jsonMapBoolKey), throwsJsonFieldTypeException);
    expect(json.getListOr<dynamic>(jsonMapBoolKey), null);
    expect(() => json.getNum(jsonMapBoolKey), throwsJsonFieldTypeException);
    expect(json.getNumOr(jsonMapBoolKey), null);
  });

  test('JsonMap.getMap', () {
    expect(json.contains<Map<dynamic, dynamic>>(jsonMapMapKey), true);

    expect(json.getMap(jsonMapMapKey), isA<JsonMap>());
    expect(json.getMap(jsonMapMapKey).toMap(), jsonMapMapValue);

    expect(json.getMap(jsonMapStringKey, jsonMapMapValue).toMap(), jsonMapMapValue);
    expect(json.getMap(jsonMapMissKey, jsonMapMapValue).toMap(), jsonMapMapValue);
    expect(json.getMap(jsonMapNullKey, jsonMapMapValue).toMap(), jsonMapMapValue);

    expect(json.getMapOr(jsonMapMapKey), isA<JsonMap>());
    expect(json.getMapOr(jsonMapMapKey)?.toMap(), jsonMapMapValue);

    expect(json.getMapOr(jsonMapMissKey, jsonMapMapValue), isA<JsonMap>());
    expect(json.getMapOr(jsonMapMissKey, jsonMapMapValue)?.toMap(), jsonMapMapValue);

    expect(json.getMapOr(jsonMapNullKey, jsonMapMapValue), isA<JsonMap>());
    expect(json.getMapOr(jsonMapNullKey, jsonMapMapValue)?.toMap(), jsonMapMapValue);

    expect(json.getMapOr(jsonMapMissKey), null);
    expect(json.getMapOr(jsonMapNullKey), null);

    expect(() => json.getInt(jsonMapMapKey), throwsJsonFieldTypeException);
    expect(json.getIntOr(jsonMapMapKey), null);
    expect(() => json.getDouble(jsonMapMapKey), throwsJsonFieldTypeException);
    expect(json.getDoubleOr(jsonMapMapKey), null);
    expect(() => json.getString(jsonMapMapKey), throwsJsonFieldTypeException);
    expect(json.getStringOr(jsonMapMapKey), null);
    expect(() => json.getBool(jsonMapMapKey), throwsJsonFieldTypeException);
    expect(json.getBoolOr(jsonMapMapKey), null);
    expect(() => json.getList<dynamic>(jsonMapMapKey), throwsJsonFieldTypeException);
    expect(json.getListOr<dynamic>(jsonMapMapKey), null);
    expect(() => json.getNum(jsonMapMapKey), throwsJsonFieldTypeException);
    expect(json.getNumOr(jsonMapMapKey), null);
  });

  test('JsonMap.getList', () {
    expect(json.contains<List<dynamic>>(jsonMapListKey), true);

    expect(json.getJsonList(jsonMapListKey), isA<JsonList>());
    expect(json.getJsonList(jsonMapListKey).toList(), jsonMapListValue);

    expect(json.getJsonList(jsonMapStringKey, jsonMapListValue).toList(), jsonMapListValue);
    expect(json.getJsonList(jsonMapMissKey, jsonMapListValue).toList(), jsonMapListValue);
    expect(json.getJsonList(jsonMapNullKey, jsonMapListValue).toList(), jsonMapListValue);

    expect(json.getJsonListOr(jsonMapListKey), isA<JsonList>());
    expect(json.getJsonListOr(jsonMapListKey)?.toList(), jsonMapListValue);

    expect(json.getJsonListOr(jsonMapMissKey, jsonMapListValue), isA<JsonList>());
    expect(json.getJsonListOr(jsonMapMissKey, jsonMapListValue)?.toList(), jsonMapListValue);

    expect(json.getJsonListOr(jsonMapNullKey, jsonMapListValue), isA<JsonList>());
    expect(json.getJsonListOr(jsonMapNullKey, jsonMapListValue)?.toList(), jsonMapListValue);

    expect(json.getJsonListOr(jsonMapMissKey), null);
    expect(json.getJsonListOr(jsonMapNullKey), null);

    expect(() => json.getInt(jsonMapListKey), throwsJsonFieldTypeException);
    expect(json.getIntOr(jsonMapListKey), null);
    expect(() => json.getDouble(jsonMapListKey), throwsJsonFieldTypeException);
    expect(json.getDoubleOr(jsonMapListKey), null);
    expect(() => json.getString(jsonMapListKey), throwsJsonFieldTypeException);
    expect(json.getStringOr(jsonMapListKey), null);
    expect(() => json.getBool(jsonMapListKey), throwsJsonFieldTypeException);
    expect(json.getBoolOr(jsonMapListKey), null);
    expect(() => json.getMap(jsonMapListKey), throwsJsonFieldTypeException);
    expect(json.getMapOr(jsonMapListKey), null);
    expect(() => json.getNum(jsonMapListKey), throwsJsonFieldTypeException);
    expect(json.getNumOr(jsonMapListKey), null);
  });

  test('JsonMap.getJson', () {
    expect(json.getJson(jsonMapListKey).asObject(), jsonMapListValue);
    expect(() => json.getJson(jsonMapMissKey), throwsJsonFieldNullException);
    expect(json.getJsonOr(jsonMapListKey)?.asObject(), jsonMapListValue);
    expect(json.getJsonOr(jsonMapMissKey), null);
    expect(json.getJsonOr(jsonMapMissKey, jsonMapListValue)?.asObject(), jsonMapListValue);
  });

  test('JsonMap.contains', () {
    expect(json.contains<Map<dynamic, dynamic>>(jsonMapMapKey), true);
    expect(json.contains<dynamic>(jsonMapMapKey), true);

    expect(json.contains<double>(jsonMapDoubleKey), true);
    expect(json.contains<double>(jsonMapIntKey), false);

    expect(json.contains<Map<dynamic, dynamic>>(jsonMapMissKey), false);
    expect(json.contains<String>(jsonMapMissKey), false);
    expect(json.contains<dynamic>(jsonMapMissKey), false);

    expect(json.contains<Map<dynamic, dynamic>>(jsonMapNullKey), false);
    expect(json.contains<String>(jsonMapNullKey), false);
    expect(json.contains<dynamic>(jsonMapNullKey), true);
  });

  test('JsonMap.toJsonString', () {
    expect(json.toJsonString(), jsonEncode(json.toMap()));
  });

  test('JsonMap.keys', () {
    expect(json.keys, jsonMap.keys);
  });

}