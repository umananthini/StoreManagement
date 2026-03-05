// import 'package:flutter/material.dart';
// import 'package:flutter_tts/flutter_tts.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Text to Voice Demo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const TextToVoicePage(),
//     );
//   }
// }

// class TextToVoicePage extends StatefulWidget {
//   const TextToVoicePage({super.key});

//   @override
//   State<TextToVoicePage> createState() => _TextToVoicePageState();
// }

// class _TextToVoicePageState extends State<TextToVoicePage> {
//   final FlutterTts flutterTts = FlutterTts();
//   final TextEditingController controller = TextEditingController();

//   Future<void> _speak() async {
//     if (controller.text.isNotEmpty) {
//       await flutterTts.setLanguage("en-US");
//       await flutterTts.setPitch(1.0);   // normal pitch
//       await flutterTts.setSpeechRate(0.5); // speed (0.5 is slower, 1.0 is normal)
//       await flutterTts.speak(controller.text);
//     }
//   }

//   Future<void> _stop() async {
//     await flutterTts.stop();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Text to Voice")),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: controller,
//               decoration: const InputDecoration(
//                 labelText: "Enter text here",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: _speak,
//                   child: const Text("Speak"),
//                 ),
//                 const SizedBox(width: 20),
//                 ElevatedButton(
//                   onPressed: _stop,
//                   child: const Text("Stop"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
