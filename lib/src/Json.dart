part of strict_json;

class Json {

  final Object? _jsonObject;
  final void Function(JsonException error)? _onError;

  /// Create Json from the Object
  const Json(Object? jsonObject, [ this._onError ]):
    _jsonObject = jsonObject;

  /// Convert Json to the JsonMap or create JsonMap from [defaultValue]
  ///
  /// The [jsonObject] must be Map<String, dynamic>, String or JsonMap otherwise throw FormatException
  JsonMap asMap([Map<String, dynamic>? defaultValue]) {
    if (_jsonObject == null) {
      throw JsonNullException(this, "Map<String, dynamic>");
    }
    final jsonMap = asMapOr(defaultValue);
    if (jsonMap != null) {
      return jsonMap;
    }
    throw JsonTypeException(this, "Map<String, dynamic>", _jsonObject.runtimeType.toString());
  }

  /// Convert Json to the JsonMap or create JsonMap from [defaultValue]
  JsonMap? asMapOr([Map<String, dynamic>? defaultValue]) {
    final json = _jsonObject;
    if (json is Map<String, dynamic>) {
      return JsonMap(json, _onError);
    } else if (json is JsonMap) {
      return json;
    } else if (json is String) {
      final parsedJson = _parseJsonObjectString(json);
      if (parsedJson != null) {
        return parsedJson.asMapOr(defaultValue);
      }
    }
    if (json != null && json is! String) {
      (_onError ?? onError).call(JsonTypeException(this, "Map<String, dynamic>, JsonMap, String", json.runtimeType.toString()));
    }
    return defaultValue != null ? JsonMap(defaultValue, _onError) : null;
  }

  /// Convert Json to the JsonList or create JsonList from [defaultValue]
  ///
  /// The [jsonObject] must be Map<String, dynamic>, String or JsonList otherwise throw FormatException
  JsonList asList([List<dynamic>? defaultValue]) {
    if (_jsonObject == null) {
      throw JsonNullException(this, "List<dynamic>");
    }
    final jsonList = asListOr(defaultValue);
    if (jsonList != null) {
      return jsonList;
    }
    throw JsonTypeException(this, "List<dynamic>", _jsonObject.runtimeType.toString());
  }

  /// Convert Json to the JsonList or create JsonList from [defaultValue]
  JsonList? asListOr([List<dynamic>? defaultValue]) {
    final json = _jsonObject;
    if (json is List<dynamic>) {
      return JsonList(json, _onError);
    } else if (json is JsonList) {
      return json;
    } else if (json is String) {
      final parsedJson = _parseJsonObjectString(json);
      if (parsedJson != null) {
        return parsedJson.asListOr(defaultValue);
      }
    }
    if (json != null) {
      (_onError ?? onError).call(JsonTypeException(this, "List<dynamic>, JsonList, String", json.runtimeType.toString()));
    }
    return defaultValue != null ? JsonList(defaultValue, _onError) : null;
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

  /// Returns string representation of the Json
  @override
  String toString() {
    return "Json<${_jsonObject.runtimeType}>";
  }

  T _getValue<T>(T? defaultValue) {
    final dynamic value = _jsonObject;
    if (value == null) {
      if (defaultValue != null) {
        return defaultValue;
      }
      throw JsonNullException(this, T.toString());
    } else if (value is T) {
      return value;
    } else {
      final exception = JsonTypeException(this, T.toString(), value.runtimeType.toString());
      if (defaultValue == null) {
        throw exception;
      }
      (_onError ?? onError).call(exception);
      return defaultValue;
    }
  }

  T? _getValueOr<T>(T? defaultValue) {
    final dynamic value = _jsonObject;
    if (value == null) {
      return defaultValue;
    } else if (value is T) {
      return value;
    } else {
      (_onError ?? onError).call(JsonTypeException(this, T.toString(), value.runtimeType.toString()));
      return defaultValue;
    }
  }

  Json? _parseJsonObjectString(String json) {
    try {
      final decode = jsonDecode(json);
      return Json(decode, _onError);
    } catch (error) {
      (_onError ?? onError).call(JsonDecodeException(this, error));
    }
    return null;
  }

  static void Function(JsonException error) onError = _defaultErrorHandler;

  // ignore: avoid_print
  static void _defaultErrorHandler(JsonException error) => print(error);

}
