import 'package:strict_json/strict_json.dart';
import 'package:test/test.dart';

import 'TestData.dart';

void main() {

  test('Json(string)', () {
    const value = "invalid_json";
    const json = Json(value);
    expect(json.asMap, throwsJsonTypeException);
    expect(json.asMap(jsonMap).toMap(), jsonMap);
    expect(json.asMapOr(), null);
    expect(json.asMapOr(jsonMap)?.toMap(), jsonMap);
    expect(json.asObject(), value);
    expect(json.asString(), value);

    expect(json.asDouble, throwsJsonTypeException);
    expect(json.asInt, throwsJsonTypeException);
    expect(json.asList, throwsJsonTypeException);
    expect(json.asList(jsonList).toList(), jsonList);
    expect(json.asListOr(), null);
    expect(json.asListOr(jsonList)?.toList(), jsonList);
    expect(json.asBool, throwsJsonTypeException);
    expect(json.asNum, throwsJsonTypeException);
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

    expect(json.asString, throwsJsonTypeException);
    expect(json.asStringOr(), null);
    expect(json.asStringOr(jsonMapStringValue), jsonMapStringValue);
    expect(json.asBool, throwsJsonTypeException);
    expect(json.asMap, throwsJsonTypeException);
    expect(json.asMapOr(), null);
    expect(json.asMap(jsonMap).toMap(), jsonMap);
    expect(json.asList, throwsJsonTypeException);
    expect(json.asList(jsonList).toList(), jsonList);
    expect(json.asListOr(), null);
    expect(json.asListOr(jsonList)?.toList(), jsonList);
    expect(json.asDouble, throwsJsonTypeException);
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

    expect(json.asString, throwsJsonTypeException);
    expect(json.asMap, throwsJsonTypeException);
    expect(json.asList, throwsJsonTypeException);
    expect(json.asBool, throwsJsonTypeException);
    expect(json.asInt, throwsJsonTypeException);
  });

  test('Json(stringMap)', () {
    expect(jsonOfStringJsonMap.asMap(), isA<JsonMap>());
    expect(jsonOfStringJsonMap.asString(), stringJsonMap);
    expect(jsonOfStringJsonMap.asObject(), stringJsonMap);

    expect(jsonOfStringJsonMap.asDouble, throwsJsonTypeException);
    expect(jsonOfStringJsonMap.asInt, throwsJsonTypeException);
    expect(jsonOfStringJsonMap.asNum, throwsJsonTypeException);
    expect(jsonOfStringJsonMap.asBool, throwsJsonTypeException);
    expect(jsonOfStringJsonMap.asList, throwsJsonTypeException);
  });

  test('Json(map)', () {
    expect(jsonOfJsonMap.asMap(), isA<JsonMap>());
    expect(jsonOfJsonMap.asMap().toMap(), jsonMap);
    expect(jsonOfJsonMap.asObject(), jsonMap);

    expect(jsonOfJsonMap.asDouble, throwsJsonTypeException);
    expect(jsonOfJsonMap.asInt, throwsJsonTypeException);
    expect(jsonOfJsonMap.asNum, throwsJsonTypeException);
    expect(jsonOfJsonMap.asBool, throwsJsonTypeException);
    expect(jsonOfJsonMap.asList, throwsJsonTypeException);
  });

  test('Json(null)', () {
    const json = Json(null);
    expect(json.asMap, throwsJsonNullException);
    expect(json.asList, throwsJsonNullException);
    expect(json.asObject(), null);
    expect(json.asStringOr(), null);
    expect(json.asString(jsonMapStringValue), jsonMapStringValue);

    expect(json.asDouble, throwsJsonNullException);
    expect(json.asInt, throwsJsonNullException);
    expect(json.asNum, throwsJsonNullException);
    expect(json.asBool, throwsJsonNullException);
    expect(json.asString, throwsJsonNullException);
  });

  test('Json(bool)', () {
    const value = true;
    const json = Json(value);
    expect(json.asBool(), value);
    expect(json.asBool(false), value);
    expect(json.asBoolOr(), value);
    expect(json.asBoolOr(false), value);
    expect(json.asObject(), value);

    expect(json.asDouble, throwsJsonTypeException);
    expect(json.asInt, throwsJsonTypeException);
    expect(json.asNum, throwsJsonTypeException);
    expect(json.asList, throwsJsonTypeException);
    expect(json.asMap, throwsJsonTypeException);
    expect(json.asString, throwsJsonTypeException);
  });

  test('Json(list)', () {
    expect(jsonOfJsonList.asList(), isA<JsonList>());
    expect(jsonOfJsonList.asObject(), jsonList);
    expect(jsonOfJsonList.asList().toList(), jsonList);

    expect(jsonOfJsonList.asDouble, throwsJsonTypeException);
    expect(jsonOfJsonList.asInt, throwsJsonTypeException);
    expect(jsonOfJsonList.asNum, throwsJsonTypeException);
    expect(jsonOfJsonList.asMap, throwsJsonTypeException);
    expect(jsonOfJsonList.asString, throwsJsonTypeException);
    expect(jsonOfJsonList.asBool, throwsJsonTypeException);
  });

  test('Json(stringList)', () {
    expect(jsonOfStringJsonList.asList(), isA<JsonList>());
    expect(jsonOfStringJsonList.asObject(), stringJsonList);
    expect(jsonOfStringJsonList.asList().toList(), jsonList);
    expect(jsonOfStringJsonList.asString(), stringJsonList);

    expect(jsonOfStringJsonList.asDouble, throwsJsonTypeException);
    expect(jsonOfStringJsonList.asInt, throwsJsonTypeException);
    expect(jsonOfStringJsonList.asNum, throwsJsonTypeException);
    expect(jsonOfStringJsonList.asMap, throwsJsonTypeException);
    expect(jsonOfStringJsonList.asBool, throwsJsonTypeException);
  });

}
