import 'dart:convert';

import 'Json.dart';
import 'JsonList.dart';

class JsonMap {

  final Map<String, dynamic> _jsonMap;

  /// Create JsonMap from Map<String, dynamic>
  const JsonMap(Map<String, dynamic>? map) : _jsonMap = map ?? const <String, dynamic>{};

  /// Returns int value by [key] or defaultValue
  ///
  /// If map not contains [key] or the value has a different type and [defaultValue] is null then throw FormatException
  int getInt(String key, [int? defaultValue]) {
    return _value(key, defaultValue);
  }

  /// Returns int value by [key] or default value
  int? getIntOr(String key, [int? defaultValue]) {
    return _valueOr(key, defaultValue);
  }

  /// Returns string value by [key]
  ///
  /// If map not contains [key] or the value has a different type and [defaultValue] is null then throw FormatException
  String getString(String key, [String? defaultValue]) {
    return _value(key, defaultValue);
  }

  /// Returns string value by [key] or default value
  String? getStringOr(String key, [String? defaultValue]) {
    return _valueOr(key, defaultValue);
  }

  /// Returns bool value by [key]
  ///
  /// If map not contains [key] or the value has a different type and [defaultValue] is null then throw FormatException
  bool getBool(String key, [bool? defaultValue]) {
    return _value(key, defaultValue);
  }

  /// Returns bool value by [key] or default value
  bool? getBoolOr(String key, [bool? defaultValue]) {
    return _valueOr(key, defaultValue);
  }

  /// Returns double value by [key]
  ///
  /// If map not contains [key] or the value has a different type and [defaultValue] is null then throw FormatException
  double getDouble(String key, [double? defaultValue]) {
    return _value(key, defaultValue);
  }

  /// Returns double value by [key] or default value
  double? getDoubleOr(String key, [double? defaultValue]) {
    return _valueOr(key, defaultValue)?.toDouble();
  }

  /// Returns num value by [key]
  ///
  /// If map not contains [key] or the value has a different type and [defaultValue] is null then throw FormatException
  num getNum(String key, [num? defaultValue]) {
    return _value(key, defaultValue);
  }

  /// Returns num value by [key] or default value
  num? getNumOr(String key, [num? defaultValue]) {
    return _valueOr(key, defaultValue);
  }

  /// Returns JsonMap by [key]
  ///
  /// If map not contains [key] or the value has a different type and [defaultValue] is null then throw FormatException
  JsonMap getMap(String key, [Map<String, dynamic>? defaultValue]) {
    return JsonMap(_value<Map<String, dynamic>>(key, defaultValue));
  }

  /// Returns JsonMap by [key] or default value
  JsonMap? getMapOr(String key, [Map<String, dynamic>? defaultValue]) {
    final Map<String, dynamic>? value = _valueOr(key, defaultValue);
    return value != null ? JsonMap(value) : null;
  }

  /// Returns JsonList by [key]
  ///
  /// If map not contains [key] or the value is not a List and [defaultValue] is null then throw FormatException
  JsonList getList(String key, [List<dynamic>? defaultValue]) {
    return JsonList(_value<List<dynamic>>(key, defaultValue));
  }

  /// Returns JsonList by [key] or default value
  JsonList? getListOr(String key, [List<dynamic>? defaultValue]) {
    final List<dynamic>? value = _valueOr(key, defaultValue);
    return value != null ? JsonList(value) : null;
  }

  /// Returns Json by [key]
  ///
  /// If map not contains [key] or the value is not a Map and [defaultValue] is null then throw FormatException
  Json getJson(String key, [Object? defaultValue]) {
    return Json(_value(key, defaultValue));
  }

  /// Returns Json by [key] or default value
  Json? getJsonOr(String key, [Object? defaultValue]) {
    final value = _valueOr(key, defaultValue);
    return value != null ? Json(value) : null;
  }

  /// Returns true if map contains the given [key].
  /// If a generic parameter is specified, then the value is also checked against the type of the parameter.
  bool contains<T>(String key) {
    final result = _jsonMap.containsKey(key);
    return result && _jsonMap[key] is T;
  }

  /// Convert JsonMap with converter.
  T convert<T>(T Function(JsonMap jsonMap) converter) {
    return converter(this);
  }

  /// Iterate by keys and convert items
  Iterable<T> convertEach<T>(T Function(String key, Json value) converter) {
    return _jsonMap.keys.map((key) => converter(key, Json(_jsonMap[key])));
  }

  /// All keys of this map
  Iterable<String> get keys => _jsonMap.keys;

  /// Cast source of the JsonMap
  Map<RK, RV> cast<RK, RV>() {
    return _jsonMap.cast<RK, RV>();
  }

  /// Returns source of the JsonMap
  Map<String, dynamic> toMap() => _jsonMap;

  /// Returns string representation of the map
  String toJsonString() => jsonEncode(_jsonMap);

  T _value<T>(String key, T? defaultValue) {
    final value = _jsonMap[key];
    if (value == null) {
      if (defaultValue != null) {
        Json.onError(_fieldIsNullButRequired<T>(key));
        return defaultValue;
      }
      throw FormatException(_fieldIsNullButRequired<T>(key));
    } else if (value is T) {
      return value;
    } else {
      if (defaultValue != null) {
        Json.onError(_fieldHasWrongType<T>(key, value.runtimeType.toString()));
        return defaultValue;
      }
      throw FormatException(_fieldHasWrongType<T>(key, value.runtimeType.toString()), value?.toString());
    }
  }

  T _valueOr<T>(String key, T defaultValue) {
    final value = _jsonMap[key];
    if (value == null) {
      return defaultValue;
    } else if (value is T) {
      return value;
    } else {
      Json.onError(_fieldHasWrongType<T>(key, value.runtimeType.toString()));
      return defaultValue;
    }
  }

  String _fieldIsNullButRequired<T>(String key) => "strict_json: the field '$key' is null but required ('${T.toString()}' expected)";

  String _fieldHasWrongType<T>(String key, String dataType) => "strict_json: the field '$key' has wrong type ('${T.toString()}' expected but '$dataType' given)";

}
