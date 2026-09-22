// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:w04/main.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('th');
  });

  testWidgets('แสดงรายการ Dessert Collection', (WidgetTester tester) async {
    await tester.pumpWidget(const DessertApp());

    expect(find.text('Dessert Collection'), findsOneWidget);
    expect(find.text('บิงซูสตรอว์เบอร์รี'), findsOneWidget);
    expect(find.text('ชีสเค้กหน้าไหม้'), findsOneWidget);
  });

  testWidgets('เปิดหน้ารายละเอียดขนมและแสดงวันที่', (WidgetTester tester) async {
    await tester.pumpWidget(const DessertApp());
    await tester.tap(find.text('บิงซูสตรอว์เบอร์รี'));
    await tester.pumpAndSettle();

    expect(find.text('รายละเอียดขนม'), findsOneWidget);
    await tester.scrollUntilVisible(find.text('วันที่บันทึก'), 300);
    expect(find.text('วันที่บันทึก'), findsOneWidget);
  });
}
