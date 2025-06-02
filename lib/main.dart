import 'package:flutter/material.dart';
import 'dart:math';
// import 'dart:io';

// 1. アプリのスタート地点（main関数）
// ここからアプリが始まる
void main() => runApp(const MyApp());

// 2. アプリ全体の見た目やテーマを決めるクラス
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 3. アプリの画面や色などを設定する
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'カウンターアプリ', // アプリのタイトル
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo), // 色のテーマ
        useMaterial3: true,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      home: const CounterPage(), // 最初に表示する画面を指定
    );
  }
}

// 4. カウンター画面のクラス（数字を数える画面）
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  // 5. この画面の状態（数字がいくつかなど）を管理するクラスを作る
  @override
  State<CounterPage> createState() => _CounterPageState();
}

// 6. カウンター画面の「状態」を持つクラス
class _CounterPageState extends State<CounterPage> {
  int _count = 0; // カウントする数字（最初は0）

  // 7. 「＋」ボタンが押されたときに数字を1増やす関数
  void _increment() {
    setState(() {
      _count++; // 数字を1増やす
    });
  }

  // 追加：8. 「−」ボタンが押されたときに数字を1減らす関数
  void _decrement() {
    setState(() {
      _count--; // 数字を1減らす
    });
  }

  // 8. 画面の見た目を作る関数
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 9. 上のバー（タイトル）
      appBar: AppBar(title: const Text('カウンターアプリ')),
      // 10. 画面の真ん中に数字を大きく表示
      body: Center(
        child: Text(
          '$_count', // 今の数字を表示
          style: const TextStyle(fontSize: 48),
        ),
      ),
      // 11. 右下に「＋」ボタンと「−」ボタンを縦に並べて表示
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: _increment, // ボタンが押されたら_incrementを実行
            child: const Icon(Icons.add), // プラスのアイコン
          ),
          const SizedBox(height: 12), // ボタン同士の間隔
          FloatingActionButton(
            onPressed: _decrement, // ボタンが押されたら_decrementを実行
            child: const Icon(Icons.remove), // マイナスのアイコン
          ),
        ],
      ),
    );
  }
}
