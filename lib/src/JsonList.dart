part of strict_json;

class JsonList {

  final List<dynamic> _jsonList;

  /// Create JsonList from List<dynamic>
  const JsonList(List<dynamic>? list):
    _jsonList = list ?? const <dynamic>[];

  /// Returns first element from the list
  ///
  /// If the list is empty throw FormatException.
  Json first() {
    if (_jsonList.isNotEmpty) {
      return Json(_jsonList.first);
    } else {
      throw const FormatException("Json list is empty but first item is required");
    }
  }

  /// Returns first element from the list or default value
  Json? firstOr([Object? defaultValue]) {
    return _jsonList.isNotEmpty ? Json(_jsonList.first) : (defaultValue != null ? Json(defaultValue) : null);
  }

  /// Returns last element from the list
  ///
  /// If the list is empty throw FormatException.
  Json last() {
    if (_jsonList.isNotEmpty) {
      return Json(_jsonList.last);
    } else {
      throw const FormatException("Json list is empty but last item is required");
    }
  }

  /// Returns first element from the list or default value
  Json? lastOr([Object? defaultValue]) {
    return _jsonList.isNotEmpty ? Json(_jsonList.last) : (defaultValue != null ? Json(defaultValue) : null);
  }

  /// Returns [index]] element from the list
  ///
  /// If the index out of range throw FormatException.
  Json elementAt(int index) {
    if (_jsonList.length > index) {
      return Json(_jsonList[index]);
    } else {
      throw const FormatException("Index is out of range");
    }
  }

  /// Returns [index]] element from the list or default value
  Json? elementAtOr(int index, [Object? defaultValue]) {
    return _jsonList.length > index ? Json(_jsonList[index]) : (defaultValue != null ? Json(defaultValue) : null);
  }

  /// Represents each element of the list as JsonMap and convert it with converter.
  ///
  /// Each element must be Map otherwise throw Exception
  Iterable<R> convertJsonMap<R>(R Function(JsonMap value) converter) {
    return _jsonList.map((value) => converter(Json(value).asMap()));
  }

  /// Represents each element of the list as JsonList and convert it with converter.
  ///
  /// Each element must be List otherwise throw Exception
  Iterable<R> convertJsonList<R>(R Function(JsonList value) converter) {
    return _jsonList.map((value) => converter(Json(value).asList()));
  }

  /// Convert each element with converter.
  Iterable<R> convert<T, R>(R Function(T value) converter) {
    return cast<T>().map(converter);
  }

  /// Cast source of the JsonList
  List<R> cast<R>() {
    return _jsonList.cast<R>();
  }

  /// Returns source of the JsonList
  List<dynamic> toList() => _jsonList;

  /// Returns the number of objects in this list.
  int get length => _jsonList.length;

  /// Returns string representation of the list
  String toJsonString() => jsonEncode(_jsonList);

}