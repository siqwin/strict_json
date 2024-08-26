part of strict_json;

class JsonException implements Exception {
  final Json json;
  final String message;

  JsonException({
    required this.json,
    required this.message,
  });

  @override
  String toString() {
    return '$runtimeType(message: $message, json: $json)';
  }
}

class JsonNullException extends JsonException {
  JsonNullException(Json json, String type) : super(
    json: json,
    message: "The json is null but required ('$type' expected)",
  );
}

class JsonTypeException extends JsonException {
  JsonTypeException(Json json, String targetType, String dataType) : super(
    json: json,
    message: "The json object has wrong type ('$targetType' expected but '$dataType' given)",
  );
}

class JsonDecodeException extends JsonException {
  JsonDecodeException(Json json, Object error) : super(
    json: json,
    message: "The json object failed to decode ($error)",
  );
}

class JsonFieldNullException extends JsonException {
  JsonFieldNullException(Json json, String key, String targetType) : super(
    json: json,
    message: "The field '$key' is null but required ('$targetType' expected)",
  );
}

class JsonFieldTypeException extends JsonException {
  JsonFieldTypeException(Json json, String key, String targetType, String dataType) : super(
    json: json,
    message: "The field '$key' has wrong type ('$targetType' expected but '$dataType' given)",
  );
}


class JsonValueException extends JsonException {
  JsonValueException(Json json, String message) : super(
    json: json,
    message: message,
  );
}
