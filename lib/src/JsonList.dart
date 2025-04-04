part of strict_json;

class JsonList {

  final List<dynamic> _jsonList;
  final void Function(JsonException error)? _onError;

  /// Create JsonList from List<dynamic>
  const JsonList(List<dynamic>? list, [ this._onError ]) : _jsonList = list ?? const <dynamic>[];

  /// Returns first element from the list
  ///
  /// If the list is empty throw FormatException.
  Json first() {
    if (_jsonList.isNotEmpty) {
      return Json(_jsonList.first, _onError);
    } else {
      throw JsonValueException(Json(this), "Json list is empty but first item is required");
    }
  }

  /// Returns first element from the list or default value
  Json? firstOr([Object? defaultValue]) {
    return _jsonList.isNotEmpty ? Json(_jsonList.first, _onError) : (defaultValue != null ? Json(defaultValue, _onError) : null);
  }

  /// Returns last element from the list
  ///
  /// If the list is empty throw FormatException.
  Json last() {
    if (_jsonList.isNotEmpty) {
      return Json(_jsonList.last, _onError);
    } else {
      throw JsonValueException(Json(this), "Json list is empty but last item is required");
    }
  }

  /// Returns first element from the list or default value
  Json? lastOr([Object? defaultValue]) {
    return _jsonList.isNotEmpty ? Json(_jsonList.last, _onError) : (defaultValue != null ? Json(defaultValue, _onError) : null);
  }

  /// Returns [index]] element from the list
  ///
  /// If the index out of range throw FormatException.
  Json elementAt(int index) {
    if (_jsonList.length > index) {
      return Json(_jsonList[index], _onError);
    } else {
      throw JsonValueException(Json(this), "Index is out of range");
    }
  }

  /// Returns [index]] element from the list or default value
  Json? elementAtOr(int index, [Object? defaultValue]) {
    return _jsonList.length > index ? Json(_jsonList[index], _onError) : (defaultValue != null ? Json(defaultValue, _onError) : null);
  }

  /// Represents each element of the list as JsonMap and convert it with converter.
  ///
  /// Each element must be Map otherwise throw Exception
  Iterable<R> convertJsonMap<R>(R Function(JsonMap value) converter, [Map<String, dynamic>? defaultValue]) {
    return _jsonList.map((value) => converter(Json(value, _onError).asMap(defaultValue)));
  }

  /// Represents each element of the list as JsonList and convert it with converter.
  ///
  /// Each element must be List otherwise throw Exception
  Iterable<R> convertJsonList<R>(R Function(JsonList value) converter, [List<dynamic>? defaultValue]) {
    return _jsonList.map((value) => converter(Json(value, _onError).asList(defaultValue)));
  }

  /// Convert each element with converter.
  Iterable<R> convert<R>(R Function(dynamic value) converter) {
    return _jsonList.map(converter);
  }

  /// Cast source of the JsonList
  ///
  /// If the element is not of type [R] then throw Exception
  Iterable<R> cast<R>([R? defaultValue]) {
    return _jsonList.map((value) {
      if (value is R) {
        return value;
      } else {
        if (defaultValue != null) {
          return defaultValue;
        } else {
          throw JsonTypeException(Json(this), R.toString(), value.runtimeType.toString());
        }
      }
    });
  }

  /// Cast source of the JsonList
  ///
  /// If the element is not of type [R] then return default value
  Iterable<R?> castOr<R>([R? defaultValue]) {
    return _jsonList.map((value) {
      if (value is R) {
        return value;
      } else {
        return defaultValue;
      }
    });
  }

  /// Returns source of the JsonList
  List<dynamic> toList() => _jsonList;

  /// Returns the number of objects in this list.
  int get length => _jsonList.length;

  /// Returns string representation of the list
  String toJsonString() => jsonEncode(_jsonList);

  /// Returns string representation of the JsonList
  @override
  String toString() {
    return "JsonList<${_jsonList.runtimeType}>";
  }
}
