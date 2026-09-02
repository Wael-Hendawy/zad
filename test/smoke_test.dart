import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zad/main.dart';

void main() {
  test('ZAD application root is available', () {
    expect(const ZadApp(), isA<StatelessWidget>());
  });
}
