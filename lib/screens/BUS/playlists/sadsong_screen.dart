import 'dart:async';
import 'package:flutter/material.dart';
import 'package:musicapp_final/screens/BUS/bushome_screen.dart';
import 'package:musicapp_final/screens/BUS/musicplayer/brotherzone_music.dart';
import 'package:musicapp_final/screens/BUS/musicplayer/liar.dart';
import 'package:musicapp_final/screens/BUS/musicplayer/nomatterwhat_music.dart';

class SadsongScreen extends StatefulWidget {
  const SadsongScreen({super.key});

  @override
  State<SadsongScreen> createState() => _SadsongScreenState();
}

class _SadsongScreenState extends State<SadsongScreen> {
  final List<String> imagePaths = [
    'assets/images/BUS/brother.png',
    'assets/images/BUS/nomatterwhat.png',
    'assets/images/BUS/liar.png',
  ];

  late int _currentImageIndex;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _currentImageIndex = 0;

    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        _currentImageIndex = (_currentImageIndex + 1) % imagePaths.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton( // Add this IconButton for back navigation
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const BushomeScreen()),
            );
          },
        ),
        title: Image.asset(
          'assets/images/BUS/LogoBUS_0.png',
          height: 50,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePaths[_currentImageIndex], 
                width: 270,
                height: 270,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'SAD SONG',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'PLAYLIST',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              '3 Songs',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BrotherZoneMusic()),
                );
              },
              child: Container(
                width: 270,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'assets/images/BUS/brother.png',
                        width: 41,
                        height: 41,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'แค่น้องชาย (Brother Zone)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'BUS',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NoMatterWhatMusic()),
                );
              },
              child: Container(
                width: 270,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'assets/images/BUS/nomatterwhat.png',
                        width: 41,
                        height: 41,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'แค่ไหนแค่นั้น',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'BUS',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LiarMusic()),
                );
              },
              child: Container(
                width: 270,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'assets/images/BUS/liar.png',
                        width: 41,
                        height: 41,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'LIAR',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'BUS',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

