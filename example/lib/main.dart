import 'package:flutter/material.dart';
import 'package:ai_glow/ai_glow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AiGlow Widgets Demo',
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> _colorsIOS = [
      Color(0xFFD166D3),
      Color(0xFFF7BF69),
      Color(0xFFE2A0CB),
      Color(0xFFC982F7),
      Color(0xFFC580F3),
      Color(0xFFF1BFEB),
      Color(0xFF939AF9),
      Color(0xFFA97DF5),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('AI Glow Demo')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Top row of Inner Glow widgets
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InnerAiGlowing(
                  width: 300,
                  height: 180,
                  borderRadius: 32,
                  glowWidth: 5,
                  blure: 7,
                  colors: const [Colors.blue, Colors.transparent],
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 11, 11, 11),
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(
                          color: const Color.fromARGB(60, 84, 23, 169)),
                    ),
                    child: const Text(
                      "InnerAiGlow 1",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
                InnerAiGlowing(
                  width: 300,
                  height: 180,
                  borderRadius: 32,
                  glowWidth: 5,
                  blure: 7,
                  colors: _colorsIOS,
                  child: Container(
                    width: 300,
                    height: 180,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 11, 11, 11),
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(
                          color: const Color.fromARGB(60, 84, 23, 169)),
                    ),
                    child: const Text(
                      "InnerAiGlow 2",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Bottom row of Outer Glow widgets
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OuterAiGlow(
                  width: 300,
                  height: 180,
                  borderRadius: 32,
                  glowWidth: 5,
                  blure: 7,
                  colors: const [Colors.blue, Colors.transparent],
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 11, 11, 11),
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(
                          color: const Color.fromARGB(60, 84, 23, 169)),
                    ),
                    child: const Text(
                      "OuterAiGlow 1",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
                OuterAiGlow(
                  width: 300,
                  height: 180,
                  borderRadius: 32,
                  glowWidth: 5,
                  blure: 7,
                  colors: _colorsIOS,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 11, 11, 11),
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(
                          color: const Color.fromARGB(60, 84, 23, 169)),
                    ),
                    child: const Text(
                      "OuterAiGlow 2",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
