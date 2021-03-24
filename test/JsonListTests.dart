import 'package:strict_json/strict_json.dart';
import 'package:test/test.dart';

import 'TestData.dart';

void main() {

  const json = JsonList(jsonList);
  const jsonEmpty = JsonList([]);

  test('JsonList.length', () {
    expect(json.length, jsonList.length);
    expect(jsonEmpty.length, 0);
  });

  test('JsonList.first/Or', () {
    expect(json.first().asObject(), jsonList.first);
    expect(jsonEmpty.first, throwsFormatException);

    expect(json.firstOr()?.asObject(), jsonList.first);
    expect(jsonEmpty.firstOr(), null);
    expect(jsonEmpty.firstOr(jsonList.first)?.asObject(), jsonList.first);
  });

  test('JsonList.last/Or', () {
    expect(json.last().asObject(), jsonList.last);
    expect(jsonEmpty.last, throwsFormatException);

    expect(json.lastOr()?.asObject(), jsonList.last);
    expect(jsonEmpty.lastOr(), null);
    expect(jsonEmpty.lastOr(jsonList.last)?.asObject(), jsonList.last);
  });

  test('JsonList.elementAt/Or', () {
    expect(json.elementAt(0).asObject(), jsonList.first);
    expect(json.elementAt(jsonList.length - 1).asObject(), jsonList.last);
    expect(() => json.elementAt(jsonList.length), throwsFormatException);

    expect(json.elementAtOr(0)?.asObject(), jsonList.first);
    expect(json.elementAtOr(jsonList.length), null);

    expect(jsonEmpty.elementAtOr(0), null);
    expect(jsonEmpty.elementAtOr(1, jsonList.first)?.asObject(), jsonList.first);
  });

}