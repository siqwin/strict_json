import 'package:strict_json/strict_json.dart';
import 'package:test/test.dart';

import 'TestData.dart';

void main() {

  test('Json(string)', () {
    const value = "invalid_json";
    const json = Json(value);
    expect(json.asMap, throwsFormatException);
    expect(json.asMap(jsonMap).toMap(), jsonMap);
    expect(json.asMapOr(), null);
    expect(json.asMapOr(jsonMap)?.toMap(), jsonMap);
    expect(json.asObject(), value);
    expect(json.asString(), value);

    expect(json.asDouble, throwsFormatException);
    expect(json.asInt, throwsFormatException);
    expect(json.asList, throwsFormatException);
    expect(json.asList(jsonList).toList(), jsonList);
    expect(json.asListOr(), null);
    expect(json.asListOr(jsonList)?.toList(), jsonList);
    expect(json.asBool, throwsFormatException);
    expect(json.asNum, throwsFormatException);
  });

  test('Json(int)', () {
    const value = 1;
    const json = Json(value);
    expect(json.asInt(), value);
    expect(json.asInt(2), value);
    expect(json.asIntOr(), value);
    expect(json.asIntOr(2), value);
    expect(json.asNum(), value);
    expect(json.asNumOr(), value);
    expect(json.asNumOr(3), value);
    expect(json.asObject(), value);

    expect(json.asString, throwsFormatException);
    expect(json.asStringOr(), null);
    expect(json.asStringOr(jsonMapStringValue), jsonMapStringValue);
    expect(json.asBool, throwsFormatException);
    expect(json.asMap, throwsFormatException);
    expect(json.asMapOr(), null);
    expect(json.asMap(jsonMap).toMap(), jsonMap);
    expect(json.asList, throwsFormatException);
    expect(json.asList(jsonList).toList(), jsonList);
    expect(json.asListOr(), null);
    expect(json.asListOr(jsonList)?.toList(), jsonList);
    expect(json.asDouble, throwsFormatException);
    expect(json.asDoubleOr(), null);
    expect(json.asDoubleOr(3.0), 3.0);
  });

  test('Json(double)', () {
    const value = 1.0;
    const json = Json(value);
    expect(json.asDouble(), value);
    expect(json.asDouble(2.0), value);
    expect(json.asDoubleOr(), value);
    expect(json.asDoubleOr(2.0), value);
    expect(json.asNum(), value);
    expect(json.asObject(), value);

    expect(json.asString, throwsFormatException);
    expect(json.asMap, throwsFormatException);
    expect(json.asList, throwsFormatException);
    expect(json.asBool, throwsFormatException);
    expect(json.asInt, throwsFormatException);
  });

  test('Json(stringMap)', () {
    expect(jsonOfStringJsonMap.asMap(), isA<JsonMap>());
    expect(jsonOfStringJsonMap.asString(), stringJsonMap);
    expect(jsonOfStringJsonMap.asObject(), stringJsonMap);

    expect(jsonOfStringJsonMap.asDouble, throwsFormatException);
    expect(jsonOfStringJsonMap.asInt, throwsFormatException);
    expect(jsonOfStringJsonMap.asNum, throwsFormatException);
    expect(jsonOfStringJsonMap.asBool, throwsFormatException);
    expect(jsonOfStringJsonMap.asList, throwsFormatException);
  });

  test('Json(map)', () {
    expect(jsonOfJsonMap.asMap(), isA<JsonMap>());
    expect(jsonOfJsonMap.asMap().toMap(), jsonMap);
    expect(jsonOfJsonMap.asObject(), jsonMap);

    expect(jsonOfJsonMap.asDouble, throwsFormatException);
    expect(jsonOfJsonMap.asInt, throwsFormatException);
    expect(jsonOfJsonMap.asNum, throwsFormatException);
    expect(jsonOfJsonMap.asBool, throwsFormatException);
    expect(jsonOfJsonMap.asList, throwsFormatException);
  });

  test('Json(null)', () {
    const json = Json(null);
    expect(json.asMap, throwsFormatException);
    expect(json.asList, throwsFormatException);
    expect(json.asObject(), null);
    expect(json.asStringOr(), null);
    expect(json.asString(jsonMapStringValue), jsonMapStringValue);

    expect(json.asDouble, throwsFormatException);
    expect(json.asInt, throwsFormatException);
    expect(json.asNum, throwsFormatException);
    expect(json.asBool, throwsFormatException);
    expect(json.asString, throwsFormatException);
  });

  test('Json(bool)', () {
    const value = true;
    const json = Json(value);
    expect(json.asBool(), value);
    expect(json.asBool(false), value);
    expect(json.asBoolOr(), value);
    expect(json.asBoolOr(false), value);
    expect(json.asObject(), value);

    expect(json.asDouble, throwsFormatException);
    expect(json.asInt, throwsFormatException);
    expect(json.asNum, throwsFormatException);
    expect(json.asList, throwsFormatException);
    expect(json.asMap, throwsFormatException);
    expect(json.asString, throwsFormatException);
  });

  test('Json(list)', () {
    expect(jsonOfJsonList.asList(), isA<JsonList>());
    expect(jsonOfJsonList.asObject(), jsonList);
    expect(jsonOfJsonList.asList().toList(), jsonList);

    expect(jsonOfJsonList.asDouble, throwsFormatException);
    expect(jsonOfJsonList.asInt, throwsFormatException);
    expect(jsonOfJsonList.asNum, throwsFormatException);
    expect(jsonOfJsonList.asMap, throwsFormatException);
    expect(jsonOfJsonList.asString, throwsFormatException);
    expect(jsonOfJsonList.asBool, throwsFormatException);
  });

  test('Json(stringList)', () {
    expect(jsonOfStringJsonList.asList(), isA<JsonList>());
    expect(jsonOfStringJsonList.asObject(), stringJsonList);
    expect(jsonOfStringJsonList.asList().toList(), jsonList);
    expect(jsonOfStringJsonList.asString(), stringJsonList);

    expect(jsonOfStringJsonList.asDouble, throwsFormatException);
    expect(jsonOfStringJsonList.asInt, throwsFormatException);
    expect(jsonOfStringJsonList.asNum, throwsFormatException);
    expect(jsonOfStringJsonList.asMap, throwsFormatException);
    expect(jsonOfStringJsonList.asBool, throwsFormatException);
  });

}
