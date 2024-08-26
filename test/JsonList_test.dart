import 'dart:convert';

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
    expect(jsonEmpty.first, throwsJsonValueException);

    expect(json.firstOr()?.asObject(), jsonList.first);
    expect(jsonEmpty.firstOr(), null);
    expect(jsonEmpty.firstOr(jsonList.first)?.asObject(), jsonList.first);
  });

  test('JsonList.last/Or', () {
    expect(json.last().asObject(), jsonList.last);
    expect(jsonEmpty.last, throwsJsonValueException);

    expect(json.lastOr()?.asObject(), jsonList.last);
    expect(jsonEmpty.lastOr(), null);
    expect(jsonEmpty.lastOr(jsonList.last)?.asObject(), jsonList.last);
  });

  test('JsonList.elementAt/Or', () {
    expect(json.elementAt(0).asObject(), jsonList.first);
    expect(json.elementAt(jsonList.length - 1).asObject(), jsonList.last);
    expect(() => json.elementAt(jsonList.length), throwsJsonValueException);

    expect(json.elementAtOr(0)?.asObject(), jsonList.first);
    expect(json.elementAtOr(jsonList.length), null);

    expect(jsonEmpty.elementAtOr(0), null);
    expect(jsonEmpty.elementAtOr(1, jsonList.first)?.asObject(), jsonList.first);
  });

  test('JsonList.toJsonString', () {
    expect(json.toJsonString(), jsonEncode(json.toList()));
  });

  test('JsonList.cast', () {
    final List<double> doubleList = [1.0, 2.0, 3.0];
    final List<num> numList = doubleList;
    expect(JsonList(numList).cast<double>(), doubleList);
    expect(JsonList(numList).cast<double>().toList(), isA<List<double>>());
  });

  test('JsonList.convert', () {
    expect(json.convert((value) => value).toList(), jsonList);
  });

}