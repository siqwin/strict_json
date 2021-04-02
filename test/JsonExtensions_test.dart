import 'package:strict_json/strict_json.dart';
import 'package:test/test.dart';

import 'TestData.dart';

void main() {

  test('JsonListExtensions.toJsonList', () {
    final _jsonList = jsonList.toJsonList();
    expect(_jsonList, isA<JsonList>());
    expect(_jsonList.toList(), jsonList);
  });

  test('JsonMapExtensions.toJsonMap', () {
    final _jsonMap = jsonMap.toJsonMap();
    expect(_jsonMap, isA<JsonMap>());
    expect(_jsonMap.toMap(), jsonMap);
  });

  test('JsonStringExtensions.toJsonList', () {
    final _jsonList = stringJsonList.toJsonList();
    expect(_jsonList, isA<JsonList>());
    expect(_jsonList.toList(), jsonList);

    expect(stringJsonList.toJsonMap, throwsFormatException);
  });

  test('JsonStringExtensions.toJsonMap', () {
    final _jsonMap = stringJsonMap.toJsonMap();
    expect(_jsonMap, isA<JsonMap>());
    expect(_jsonMap.toMap(), jsonMap);

    expect(stringJsonMap.toJsonList, throwsFormatException);
  });

}