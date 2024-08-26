import 'package:strict_json/strict_json.dart';
import 'package:test/test.dart';

import 'TestData.dart';

void main() {

  test('JsonListExtensions.toJsonList', () {
    final innerJsonList = jsonList.toJsonList();
    expect(innerJsonList, isA<JsonList>());
    expect(innerJsonList.toList(), jsonList);
  });

  test('JsonMapExtensions.toJsonMap', () {
    final innerJsonMap = jsonMap.toJsonMap();
    expect(innerJsonMap, isA<JsonMap>());
    expect(innerJsonMap.toMap(), jsonMap);
  });

  test('JsonStringExtensions.toJsonList', () {
    final innerJsonList = stringJsonList.toJsonList();
    expect(innerJsonList, isA<JsonList>());
    expect(innerJsonList.toList(), jsonList);

    expect(stringJsonList.toJsonMap, throwsJsonTypeException);
  });

  test('JsonStringExtensions.toJsonMap', () {
    final innerJsonMap = stringJsonMap.toJsonMap();
    expect(innerJsonMap, isA<JsonMap>());
    expect(innerJsonMap.toMap(), jsonMap);

    expect(stringJsonMap.toJsonList, throwsJsonTypeException);
  });

}