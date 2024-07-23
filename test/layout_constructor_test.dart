import 'package:flutter_test/flutter_test.dart';
import 'package:multi_split_view_next/multi_split_view_next.dart';
import 'package:multi_split_view_next/src/internal/layout_constraints.dart';

void main() {
  group('LayoutConstraints', () {
    group('Constructor', () {
      MultiSplitViewController controller = MultiSplitViewController(areas: []);

      test('negative dividerThickness', () {
        expect(() {
          LayoutConstraints(
              controller: controller, containerSize: 100, dividerThickness: -5);
        },
            throwsA(isA<ArgumentError>()
                .having((e) => e.name, '', 'dividerThickness')));
      });
      test('negative containerSize', () {
        expect(() {
          MultiSplitViewController controller =
              MultiSplitViewController(areas: [Area()]);
          LayoutConstraints(
              controller: controller, containerSize: -10, dividerThickness: 5);
        },
            throwsA(isA<ArgumentError>()
                .having((e) => e.name, '', 'containerSize')));
      });
      test('totalDividerSize', () {
        MultiSplitViewController controller =
            MultiSplitViewController(areas: []);
        expect(
            LayoutConstraints(
                    controller: controller,
                    containerSize: 100,
                    dividerThickness: 5)
                .totalDividerSize,
            0);
        controller = MultiSplitViewController(areas: [Area()]);
        expect(
            LayoutConstraints(
                    controller: controller,
                    containerSize: 100,
                    dividerThickness: 5)
                .totalDividerSize,
            0);
        controller = MultiSplitViewController(areas: [Area(), Area()]);
        expect(
            LayoutConstraints(
                    controller: controller,
                    containerSize: 100,
                    dividerThickness: 5)
                .totalDividerSize,
            5);
        controller = MultiSplitViewController(areas: [Area(), Area(), Area()]);
        expect(
            LayoutConstraints(
                    controller: controller,
                    containerSize: 100,
                    dividerThickness: 5)
                .totalDividerSize,
            10);
        controller = MultiSplitViewController(areas: [
          Area(),
          Area(),
          Area(),
          Area(),
          Area(),
          Area(),
          Area(),
          Area(),
          Area(),
          Area()
        ]);
        expect(
            LayoutConstraints(
                    controller: controller,
                    containerSize: 100,
                    dividerThickness: 0)
                .totalDividerSize,
            0);
      });
      test('availableSpace', () {
        MultiSplitViewController controller =
            MultiSplitViewController(areas: []);
        expect(
            LayoutConstraints(
                    controller: controller,
                    containerSize: 100,
                    dividerThickness: 5)
                .spaceForAreas,
            100);
        controller = MultiSplitViewController(areas: [Area()]);
        expect(
            LayoutConstraints(
                    controller: controller,
                    containerSize: 100,
                    dividerThickness: 5)
                .spaceForAreas,
            100);
        controller = MultiSplitViewController(areas: [Area(), Area()]);
        expect(
            LayoutConstraints(
                    controller: controller,
                    containerSize: 100,
                    dividerThickness: 5)
                .spaceForAreas,
            95);
        controller = MultiSplitViewController(areas: [Area(), Area(), Area()]);
        expect(
            LayoutConstraints(
                    controller: controller,
                    containerSize: 100,
                    dividerThickness: 5)
                .spaceForAreas,
            90);
        controller = MultiSplitViewController(areas: [
          Area(),
          Area(),
          Area(),
          Area(),
          Area(),
          Area(),
          Area(),
          Area(),
          Area(),
          Area()
        ]);
        expect(
            LayoutConstraints(
                    controller: controller,
                    containerSize: 100,
                    dividerThickness: 0)
                .spaceForAreas,
            100);
        controller = MultiSplitViewController(areas: [Area(), Area()]);
        expect(
            LayoutConstraints(
                    controller: controller,
                    containerSize: 100,
                    dividerThickness: 100)
                .spaceForAreas,
            0);
        expect(
            LayoutConstraints(
                    controller: controller,
                    containerSize: 100,
                    dividerThickness: 200)
                .spaceForAreas,
            0);
      });
    });
  });
}
