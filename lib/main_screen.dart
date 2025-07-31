import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController controller=TextEditingController();
  FlutterTts flutterTts =FlutterTts();


  double volume =1.0;
  double pitch =1.0;
  double speachRate =0.5;
  List<String> ? languages;
  String lanCode ="en-US";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }
  void init() async {
    languages = List<String>.from(await flutterTts.getLanguages);
    if (!languages!.contains(lanCode)) {
      lanCode = languages!.isNotEmpty ? languages!.first : "";
    }
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(title: Center(child: Text("TTS APP")),),
      body: Column (
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Languages"),
              languages == null
                  ? CircularProgressIndicator()
                  : DropdownButton<String>(
                value: lanCode,
                items: languages!.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    lanCode = value!;
                  });
                },
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Enter your Text"
              ),
            ),
          ),
          ElevatedButton(

              onPressed: () {
            setState(() {
              speak();
            });
          }, child: Text("Start")),
          ElevatedButton(onPressed: () {
            setState(() {
              stop();
            });
          }, child: Text("Stop")),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Volume"),
                Slider(
                  min: 0.0,
                  max: 1.0,
                  divisions: 10,
                  value: volume, onChanged: (value) {
            setState(() {
              volume=value;
            });
                },)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Pitch"),
                Slider(
                  min: 0.5,
                  max: 2.0,
                  divisions: 15,
                  value: pitch, onChanged: (value) {
            setState(() {
              pitch=value;
            });
                },)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("SpechRate"),
                Slider(
                  min: 0.0,
                  max: 1.0,
                  divisions: 10,
                  value: speachRate, onChanged: (value) {
            setState(() {
              speachRate=value;
            });
                },)
              ],
            ),
          ),

        ],
      ),
    );
  }
  void initSettings() async{
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(speachRate);
    await flutterTts.setPitch(pitch);
    await  flutterTts.setLanguage(lanCode);
  }

 void speak()async{
    initSettings();

    await flutterTts.speak(controller.text);
 }
 void stop() async{
    await flutterTts.stop();
 }
}
