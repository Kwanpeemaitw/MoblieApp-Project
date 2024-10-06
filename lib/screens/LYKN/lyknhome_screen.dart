import 'dart:async';
import 'package:flutter/material.dart';

class LyknhomeScreen extends StatefulWidget {
  const LyknhomeScreen({super.key});

  @override
  State<LyknhomeScreen> createState() => _LyknhomeScreenState();
}

class _LyknhomeScreenState extends State<LyknhomeScreen> {
  final List<String> imagePaths = [
    'assets/images/LYKN/SLDSHOW1.JPG',
    'assets/images/LYKN/SLDSHOW2.JPG',
    'assets/images/LYKN/SLDSHOW3.JPG',
  ];

  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: _currentPage,
    );

    _timer = Timer.periodic(const Duration(seconds: 15), (Timer timer) {
      if (_currentPage < imagePaths.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/images/LYKN/LogoLYKN.png',
          height: 60,
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white, // Ensures the background is white
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 209,
                  child: PageView.builder(
                    itemCount: imagePaths.length,
                    controller: _pageController,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            imagePaths[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Mood Playlists',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 185,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 2, 2, 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  'assets/images/LYKN/IMG_7628.JPG',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Joyful',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  '4 songs',
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
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 185,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 2, 2, 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  'assets/images/LYKN/IMG_7621.JPG',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Relaxing',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  '3 songs',
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
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 10.0), // Left padding
                child: Align(
                  alignment: Alignment.centerLeft, // Align to the left
                  child: Text(
                    'All Songs',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
