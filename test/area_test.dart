import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multi_split_view_next/src/area.dart';

void main() {
  group('Area', () {
    group('Constructor', () {
      test('negative size', () {
        expect(() {
          Area(size: -1);
        }, throwsA(isA<ArgumentError>().having((e) => e.name, '', 'size')));
      });
      test('negative flex', () {
        expect(() {
          Area(flex: -1);
        }, throwsA(isA<ArgumentError>().having((e) => e.name, '', 'flex')));
      });
      test('negative min', () {
        expect(() {
          Area(min: -1);
        }, throwsA(isA<ArgumentError>().having((e) => e.name, '', 'min')));
      });
      test('negative max', () {
        expect(() {
          Area(max: -1);
        }, throwsA(isA<ArgumentError>().having((e) => e.name, '', 'max')));
      });
      test('default flex', () {
        Area area = Area();
        expect(area.flex, 1);
      });
      test('size', () {
        Area area = Area(size: 2);
        expect(area.size, 2);
      });
      test('flex', () {
        Area area = Area(flex: 2);
        expect(area.flex, 2);
      });
      test('flex - min', () {
        Area area = Area(flex: 2, min: 3);
        expect(area.flex, 3);
        expect(area.min, 3);

        area = Area(flex: 5, min: 3);
        expect(area.flex, 5);
        expect(area.min, 3);
      });
      test('flex - max', () {
        Area area = Area(flex: 2, max: 1);
        expect(area.flex, 1);
        expect(area.max, 1);

        area = Area(flex: 5, max: 10);
        expect(area.flex, 5);
        expect(area.max, 10);
      });
      test('size - min', () {
        Area area = Area(size: 2, min: 3);
        expect(area.size, 3);
        expect(area.min, 3);

        area = Area(size: 5, min: 3);
        expect(area.size, 5);
        expect(area.min, 3);
      });
      test('size - max', () {
        Area area = Area(size: 2, max: 1);
        expect(area.size, 1);
        expect(area.max, 1);

        area = Area(size: 5, max: 10);
        expect(area.size, 5);
        expect(area.max, 10);
      });
      test('copyWith success', () {
        final builder = (BuildContext context, Area area) => Container();
        final area = Area(
          id: '1',
          size: 200,
          min: 100,
          max: 300,
          data: 'data',
          builder: builder,
        );
        expect(area.id, '1');
        expect(area.size, 200);
        expect(area.flex, null);
        expect(area.min, 100);
        expect(area.max, 300);
        expect(area.data, 'data');
        expect(area.builder, builder);

        final area2 = area.copyWith(
          id: '2',
          min: 150,
          max: 650,
          data: 'data2',
        );
        expect(area2.id, '2');
        expect(area2.size, 200);
        expect(area2.flex, null);
        expect(area2.min, 150);
        expect(area2.max, 650);
        expect(area2.data, 'data2');
        expect(area2.builder, builder);

        final area3 = area2.copyWith(
          flex: 200,
        );
        expect(area3.id, '2');
        expect(area3.size, null);
        expect(area3.flex, 200);
        expect(area3.min, 150);
        expect(area3.max, 650);
        expect(area3.data, 'data2');
        expect(area3.builder, builder);
      });
      test('copyWith failed', () {
        final area = Area(
          id: '1',
          size: 200,
          min: 100,
          max: 300,
          data: 'data',
        );
        expect(() {
          area.copyWith(
            id: '2',
            size: 200,
            flex: 200,
          );
        },
            throwsA(isA<ArgumentError>().having((e) => e.message, '',
                'Cannot provide both a size and a flex.')));
      });
    });
  });
}
