import 'dart:convert';

import 'JsonList.dart';
import 'JsonMap.dart';

class Json {

  final Object? _jsonObject;

  /// Create Json from the Object
  const Json(Object? jsonObject) : _jsonObject = jsonObject;

  /// Convert Json to the JsonMap or create JsonMap from [defaultValue]
  ///
  /// The [jsonObject] must be Map<String, dynamic>, String or JsonMap otherwise throw FormatException
  JsonMap asMap([Map<String, dynamic>? defaultValue]) {
    final jsonMap = asMapOr(defaultValue);
    if (jsonMap != null) {
      return jsonMap;
    }
    throw const FormatException("Json object is not map");
  }

  /// Convert Json to the JsonMap or create JsonMap from [defaultValue]
  JsonMap? asMapOr([Map<String, dynamic>? defaultValue]) {
    final json = _jsonObject;
    if (json is Map<String, dynamic>) {
      return JsonMap(json);
    } else if (json is JsonMap) {
      return json;
    } else if (json is String) {
      final parsedJson = _parseJsonObjectString(json);
      if (parsedJson != null) {
        return parsedJson.asMapOr(defaultValue);
      }
    }
    if (json != null) {
      print(_jsonHasUnsupportedType(json.runtimeType.toString()));
    }
    return defaultValue != null ? JsonMap(defaultValue) : null;
  }

  /// Convert Json to the JsonList or create JsonList from [defaultValue]
  ///
  /// The [jsonObject] must be Map<String, dynamic>, String or JsonList otherwise throw FormatException
  JsonList asList([List<dynamic>? defaultValue]) {
    final jsonList = asListOr(defaultValue);
    if (jsonList != null) {
      return jsonList;
    }
    throw const FormatException("Json object is not list");
  }

  /// Convert Json to the JsonList or create JsonList from [defaultValue]
  JsonList? asListOr([List<dynamic>? defaultValue]) {
    final json = _jsonObject;
    if (json is List<dynamic>) {
      return JsonList(json);
    } else if (json is JsonList) {
      return json;
    } else if (json is String) {
      final parsedJson = _parseJsonObjectString(json);
      if (parsedJson != null) {
        return parsedJson.asListOr(defaultValue);
      }
    }
    if (json != null) {
      print(_jsonHasUnsupportedType(json.runtimeType.toString()));
    }
    return defaultValue != null ? JsonList(defaultValue) : null;
  }

  /// If object is [string] then return it otherwise throw FormatException
  String asString([String? defaultValue]) {
    return _getValue<String>(defaultValue);
  }

  /// If object is [String] then return it otherwise default value
  String? asStringOr([String? defaultValue]) {
    return _getValueOr<String>(defaultValue);
  }

  /// If object is [int] then return it otherwise throw FormatException
  int asInt([int? defaultValue]) {
    return _getValue<int>(defaultValue);
  }

  /// If object is [int] then return it otherwise default value
  int? asIntOr([int? defaultValue]) {
    return _getValueOr<int>(defaultValue);
  }

  /// If object is [double] then return it otherwise throw FormatException
  double asDouble([double? defaultValue]) {
    return _getValue<double>(defaultValue);
  }

  /// If object is [double] then return it otherwise default value
  double? asDoubleOr([double? defaultValue]) {
    return _getValueOr<double>(defaultValue);
  }

  /// If object is [bool] then return it otherwise throw FormatException
  bool asBool([bool? defaultValue]) {
    return _getValue<bool>(defaultValue);
  }

  /// If object is [bool] then return it otherwise default value
  bool? asBoolOr([bool? defaultValue]) {
    return _getValueOr<bool>(defaultValue);
  }

  /// If object is [num] then return it otherwise throw FormatException
  num asNum([num? defaultValue]) {
    return _getValue<num>(defaultValue);
  }

  /// If object is [num] then return it otherwise default value
  num? asNumOr([num? defaultValue]) {
    return _getValueOr<num>(defaultValue);
  }

  /// Return Json source object
  Object? asObject() {
    return _jsonObject;
  }

  T? _getValueOr<T>(T? defaultValue) {
    final value = _jsonObject;
    if (value is T) {
      return value;
    } else {
      if (value != null) {
        print(_jsonHasWrongType<T>(value.runtimeType.toString()));
      }
      return defaultValue;
    }
  }

  T _getValue<T>(T? defaultValue) {
    final value = _jsonObject;
    if (value is T) {
      return value;
    } else if (defaultValue != null) {
      print(_jsonHasWrongType<T>(value.runtimeType.toString()));
      return defaultValue;
    } else {
      throw FormatException(_jsonHasWrongType<T>(value.runtimeType.toString()));
    }
  }

  Json? _parseJsonObjectString(String json) {
    try {
      final decode = jsonDecode(json);
      return Json(decode);
    } catch (error) {
      print(_jsonStringFailedDecode(error));
    }
    return null;
  }

  String _jsonHasWrongType<T>(String dataType) => "strict_json: the json object has wrong type ('${T.toString()}' expected but '$dataType' given)";

  Object? _jsonStringFailedDecode(Object error) => "strict_json: the json object failed to decode ($error)";

  Object? _jsonHasUnsupportedType(String dataType) => "strict_json: the json object has unsupported type ('Map', 'String', 'JsonMap' expected but '$dataType' given)";
}
