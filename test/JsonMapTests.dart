import 'package:strict_json/strict_json.dart';
import 'package:test/test.dart';

import 'TestData.dart';

void main() {

  const json = JsonMap(jsonMap);

  test('JsonMap.getInt', () {
    expect(json.contains<int>(jsonMapIntKey), true);

    expect(json.getInt(jsonMapIntKey), jsonMapIntValue);
    expect(json.getNum(jsonMapIntKey), jsonMapIntValue);
    expect(json.getNumOr(jsonMapIntKey), jsonMapIntValue);
    expect(json.getIntOr(jsonMapIntKey), jsonMapIntValue);
    expect(json.getIntOr(jsonMapEmptyKey, jsonMapIntValue), jsonMapIntValue);
    expect(json.getIntOr(jsonMapEmptyKey), null);

    expect(() => json.getString(jsonMapIntKey), throwsFormatException);
    expect(json.getStringOr(jsonMapIntKey), null);
    expect(() => json.getBool(jsonMapIntKey), throwsFormatException);
    expect(json.getBoolOr(jsonMapIntKey), null);
    expect(() => json.getDouble(jsonMapIntKey), throwsFormatException);
    expect(json.getDoubleOr(jsonMapIntKey), null);
    expect(() => json.getMap(jsonMapIntKey), throwsFormatException);
    expect(json.getMapOr(jsonMapIntKey), null);
    expect(() => json.getList(jsonMapIntKey), throwsFormatException);
    expect(json.getListOr(jsonMapIntKey), null);
  });

  test('JsonMap.getDouble', () {
    expect(json.contains<double>(jsonMapDoubleKey), true);

    expect(json.getDouble(jsonMapDoubleKey), jsonMapDoubleValue);
    expect(json.getNum(jsonMapDoubleKey), jsonMapDoubleValue);
    expect(json.getNumOr(jsonMapDoubleKey), jsonMapDoubleValue);
    expect(json.getDoubleOr(jsonMapDoubleKey), jsonMapDoubleValue);
    expect(json.getDoubleOr(jsonMapEmptyKey, jsonMapDoubleValue), jsonMapDoubleValue);
    expect(json.getDoubleOr(jsonMapEmptyKey), null);

    expect(() => json.getInt(jsonMapDoubleKey), throwsFormatException);
    expect(json.getIntOr(jsonMapDoubleKey), null);
    expect(() => json.getBool(jsonMapDoubleKey), throwsFormatException);
    expect(json.getBoolOr(jsonMapDoubleKey), null);
    expect(() => json.getString(jsonMapDoubleKey), throwsFormatException);
    expect(json.getStringOr(jsonMapDoubleKey), null);
    expect(() => json.getMap(jsonMapDoubleKey), throwsFormatException);
    expect(json.getMapOr(jsonMapDoubleKey), null);
    expect(() => json.getList(jsonMapDoubleKey), throwsFormatException);
    expect(json.getListOr(jsonMapDoubleKey), null);
  });

  test('JsonMap.getString', () {
    expect(json.contains<String>(jsonMapStringKey), true);

    expect(json.getString(jsonMapStringKey), jsonMapStringValue);
    expect(json.getStringOr(jsonMapStringKey), jsonMapStringValue);
    expect(json.getStringOr(jsonMapEmptyKey, jsonMapStringValue), jsonMapStringValue);
    expect(json.getStringOr(jsonMapEmptyKey), null);

    expect(() => json.getInt(jsonMapStringKey), throwsFormatException);
    expect(json.getIntOr(jsonMapStringKey), null);
    expect(() => json.getBool(jsonMapStringKey), throwsFormatException);
    expect(json.getBoolOr(jsonMapStringKey), null);
    expect(() => json.getDouble(jsonMapStringKey), throwsFormatException);
    expect(json.getDoubleOr(jsonMapStringKey), null);
    expect(() => json.getMap(jsonMapStringKey), throwsFormatException);
    expect(json.getMapOr(jsonMapStringKey), null);
    expect(() => json.getList(jsonMapStringKey), throwsFormatException);
    expect(json.getListOr(jsonMapStringKey), null);
    expect(() => json.getNum(jsonMapStringKey), throwsFormatException);
    expect(json.getNumOr(jsonMapStringKey), null);
  });

  test('JsonMap.getBool', () {
    expect(json.contains<bool>(jsonMapBoolKey), true);

    expect(json.getBool(jsonMapBoolKey), jsonMapBoolValue);
    expect(json.getBoolOr(jsonMapBoolKey), jsonMapBoolValue);
    expect(json.getBoolOr(jsonMapEmptyKey, jsonMapBoolValue), jsonMapBoolValue);
    expect(json.getBoolOr(jsonMapEmptyKey), null);

    expect(() => json.getInt(jsonMapBoolKey), throwsFormatException);
    expect(json.getIntOr(jsonMapBoolKey), null);
    expect(() => json.getDouble(jsonMapBoolKey), throwsFormatException);
    expect(json.getDoubleOr(jsonMapBoolKey), null);
    expect(() => json.getString(jsonMapBoolKey), throwsFormatException);
    expect(json.getStringOr(jsonMapBoolKey), null);
    expect(() => json.getMap(jsonMapBoolKey), throwsFormatException);
    expect(json.getMapOr(jsonMapBoolKey), null);
    expect(() => json.getList(jsonMapBoolKey), throwsFormatException);
    expect(json.getListOr(jsonMapBoolKey), null);
    expect(() => json.getNum(jsonMapBoolKey), throwsFormatException);
    expect(json.getNumOr(jsonMapBoolKey), null);
  });

  test('JsonMap.getMap', () {
    expect(json.contains<Map>(jsonMapMapKey), true);

    expect(json.getMap(jsonMapMapKey), isA<JsonMap>());
    expect(json.getMap(jsonMapMapKey).toMap(), jsonMapMapValue);

    expect(json.getMapOr(jsonMapMapKey), isA<JsonMap>());
    expect(json.getMapOr(jsonMapMapKey)?.toMap(), jsonMapMapValue);

    expect(json.getMapOr(jsonMapEmptyKey, jsonMapMapValue), isA<JsonMap>());
    expect(json.getMapOr(jsonMapEmptyKey, jsonMapMapValue)?.toMap(), jsonMapMapValue);

    expect(json.getMapOr(jsonMapEmptyKey), null);

    expect(() => json.getInt(jsonMapMapKey), throwsFormatException);
    expect(json.getIntOr(jsonMapMapKey), null);
    expect(() => json.getDouble(jsonMapMapKey), throwsFormatException);
    expect(json.getDoubleOr(jsonMapMapKey), null);
    expect(() => json.getString(jsonMapMapKey), throwsFormatException);
    expect(json.getStringOr(jsonMapMapKey), null);
    expect(() => json.getBool(jsonMapMapKey), throwsFormatException);
    expect(json.getBoolOr(jsonMapMapKey), null);
    expect(() => json.getList(jsonMapMapKey), throwsFormatException);
    expect(json.getListOr(jsonMapMapKey), null);
    expect(() => json.getNum(jsonMapMapKey), throwsFormatException);
    expect(json.getNumOr(jsonMapMapKey), null);
  });

  test('JsonMap.getList', () {
    expect(json.contains<List>(jsonMapListKey), true);

    expect(json.getList(jsonMapListKey), isA<JsonList>());
    expect(json.getList(jsonMapListKey).toList(), jsonMapListValue);

    expect(json.getListOr(jsonMapListKey), isA<JsonList>());
    expect(json.getListOr(jsonMapListKey)?.toList(), jsonMapListValue);

    expect(json.getListOr(jsonMapEmptyKey, jsonMapListValue), isA<JsonList>());
    expect(json.getListOr(jsonMapEmptyKey, jsonMapListValue)?.toList(), jsonMapListValue);

    expect(json.getListOr(jsonMapEmptyKey), null);

    expect(() => json.getInt(jsonMapListKey), throwsFormatException);
    expect(json.getIntOr(jsonMapListKey), null);
    expect(() => json.getDouble(jsonMapListKey), throwsFormatException);
    expect(json.getDoubleOr(jsonMapListKey), null);
    expect(() => json.getString(jsonMapListKey), throwsFormatException);
    expect(json.getStringOr(jsonMapListKey), null);
    expect(() => json.getBool(jsonMapListKey), throwsFormatException);
    expect(json.getBoolOr(jsonMapListKey), null);
    expect(() => json.getMap(jsonMapListKey), throwsFormatException);
    expect(json.getMapOr(jsonMapListKey), null);
    expect(() => json.getNum(jsonMapListKey), throwsFormatException);
    expect(json.getNumOr(jsonMapListKey), null);
  });

  test('JsonMap.contains', () {
    expect(json.contains<Map>(jsonMapMapKey), true);
    expect(json.contains<dynamic>(jsonMapMapKey), true);

    expect(json.contains<double>(jsonMapDoubleKey), true);
    expect(json.contains<double>(jsonMapIntKey), false);

    expect(json.contains<Map>(jsonMapEmptyKey), false);
    expect(json.contains<String>(jsonMapEmptyKey), false);
    expect(json.contains<dynamic>(jsonMapEmptyKey), false);
  });

}