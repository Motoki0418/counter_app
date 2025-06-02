import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('カウンターが増減する', (WidgetTester tester) async {
    // 画面を表示
    await tester.pumpWidget(const MyApp());

    // 初期値は0
    expect(find.text('0'), findsOneWidget);

    // ＋ボタンを1回タップ
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);

    // −ボタンを2回タップ
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();
    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();
    expect(find.text('-1'), findsOneWidget);
  });
} 