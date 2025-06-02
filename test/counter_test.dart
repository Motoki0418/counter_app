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

  testWidgets('リセットボタンが機能する', (WidgetTester tester) async {
    // 画面を表示
    await tester.pumpWidget(const MyApp());

    // 初期値は0
    expect(find.text('0'), findsOneWidget);

    // ＋ボタンを3回タップして3にする
    for (int i = 0; i < 3; i++) {
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
    }
    expect(find.text('3'), findsOneWidget);

    // リセットボタンをタップ
    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();
    
    // 値が0に戻ることを確認
    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('制限値が機能する', (WidgetTester tester) async {
    // 画面を表示
    await tester.pumpWidget(const MyApp());

    // 制限値が表示されていることを確認
    expect(find.text('制限: -10 〜 10'), findsOneWidget);

    // 最大値まで増やす
    for (int i = 0; i < 15; i++) {
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
    }
    // 10以上には増えないことを確認
    expect(find.text('10'), findsOneWidget);

    // 最小値まで減らす
    for (int i = 0; i < 25; i++) {
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();
    }
    // -10以下には減らないことを確認
    expect(find.text('-10'), findsOneWidget);
  });
} 