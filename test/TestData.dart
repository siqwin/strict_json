import 'package:strict_json/strict_json.dart';

const jsonMapIntKey = "int_key";
const jsonMapIntValue = 1;
const jsonMapDoubleKey = "double_key";
const jsonMapDoubleValue = 1.0;
const jsonMapBoolKey = "bool_key";
const jsonMapBoolValue = true;
const jsonMapStringKey = "string_key";
const jsonMapStringValue = "string";
const jsonMapMapKey = "map_key";
const jsonMapMapValueString = """{ "key": "value" }""";
const jsonMapMapValue = { "key": "value" };
const jsonMapListKey = "list_key";
const jsonMapListValueString = """[ "a", "b", "c" ]""";
const jsonMapListValue = [ "a", "b", "c" ];
const jsonMapMissKey = "empty";
const jsonMapNullKey = "null";

const stringJsonMap = """{
  "$jsonMapStringKey": "$jsonMapStringValue",
  "$jsonMapIntKey": "$jsonMapIntValue",
  "$jsonMapDoubleKey": "$jsonMapDoubleValue",
  "$jsonMapBoolKey": "$jsonMapBoolValue",
  "$jsonMapMapKey": $jsonMapMapValueString,
  "$jsonMapListKey": $jsonMapListValueString,
  "$jsonMapNullKey": null
}""";

const Map<String, dynamic> jsonMap = {
  jsonMapStringKey: jsonMapStringValue,
  jsonMapIntKey: jsonMapIntValue,
  jsonMapDoubleKey: jsonMapDoubleValue,
  jsonMapBoolKey: jsonMapBoolValue,
  jsonMapMapKey: jsonMapMapValue,
  jsonMapListKey: jsonMapListValue,
  jsonMapNullKey: null
};

const jsonOfStringJsonMap = Json(stringJsonMap);
const jsonOfJsonMap = Json(jsonMap);

const stringJsonList = """[ "a", "b", "c"]""";
const List<dynamic> jsonList = [ "a", "b", "c" ];

const jsonOfStringJsonList = Json(stringJsonList);
const jsonOfJsonList = Json(jsonList);