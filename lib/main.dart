import 'package:flutter/material.dart';

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
  int _maxLimit = 10; // 最大値の制限
  int _minLimit = -10; // 最小値の制限

  // 7. 「＋」ボタンが押されたときに数字を1増やす関数
  void _increment() {
    setState(() {
      if (_count < _maxLimit) { // 最大値未満の場合のみ増加
        _count++;
      }
    });
  }

  // 8. 「−」ボタンが押されたときに数字を1減らす関数
  void _decrement() {
    setState(() {
      if (_count > _minLimit) { // 最小値より大きい場合のみ減少
        _count--;
      }
    });
  }

  // 9. リセットボタンが押されたときに数字を0に戻す関数
  void _reset() {
    setState(() {
      _count = 0;
    });
  }

  // 10. 画面の見た目を作る関数
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 10. 上のバー（タイトル）
      appBar: AppBar(title: const Text('カウンターアプリ')),
      // 11. 画面の真ん中に数字を大きく表示
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_count', // 今の数字を表示
              style: const TextStyle(fontSize: 48),
            ),
            const SizedBox(height: 20),
            Text(
              '制限: $_minLimit 〜 $_maxLimit',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
      // 12. 右下に「＋」「−」「リセット」ボタンを縦に並べて表示
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
          const SizedBox(height: 12), // ボタン同士の間隔
          FloatingActionButton(
            onPressed: _reset, // ボタンが押されたら_resetを実行
            backgroundColor: Colors.red, // リセットボタンは赤色に
            child: const Icon(Icons.refresh), // リフレッシュアイコン
          ),
        ],
      ),
    );
  }
}
