import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:musicapp_final/screens/BUS/musicplayer/brotherzone_music.dart';
// import 'package:musicapp_final/screens/BUS/musicplayer/bus_music.dart';
// import 'package:musicapp_final/screens/BUS/musicplayer/liar.dart';
// import 'package:musicapp_final/screens/BUS/musicplayer/nomatterwhat_music.dart';
// import 'package:musicapp_final/screens/BUS/musicplayer/picture_music.dart';
import 'package:musicapp_final/screens/BUS/playlists/dancesong_screen.dart';
import 'package:musicapp_final/screens/BUS/playlists/lovesong_screen.dart';
import 'package:musicapp_final/screens/BUS/playlists/goodtimesong_screen.dart';
import 'package:musicapp_final/screens/BUS/playlists/sadsong_screen.dart';

class BushomeScreen extends StatefulWidget {
  const BushomeScreen({super.key});

  @override
  State<BushomeScreen> createState() => _BushomeScreenState();
}

class _BushomeScreenState extends State<BushomeScreen> {
  final List<String> imagePaths = [
    'assets/images/BUS/SLIDESHOW_5.png',
    'assets/images/BUS/SLIDESHOW_4.png',
    'assets/images/BUS/SLIDESHOW_3.png',
    'assets/images/BUS/SLIDESHOW_1.png',
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/images/BUS/LogoBUS_0.png',
          height: 50,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
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
                  style: const TextStyle(
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LovesongScreen()),
                    );
                  },
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
                                'assets/images/BUS/love.png',
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
                                'Love',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                '2 songs',
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SadsongScreen()),
                    );
                  },
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
                                'assets/images/BUS/brother.png',
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
                                'Sad',
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
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DancesongScreen()),
                    );
                  },
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
                                'assets/images/BUS/ooh.png',
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
                                'Dance',
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
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GoodtimesongScreen()),
                    );
                  },
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
                                'assets/images/BUS/bussing.png',
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
                                'GoodTime',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                '2 songs',
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

            // aomsin
            // const SizedBox(height: 10), // Add vertical spacing

            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => BusMusic()),
            //     );
            //   },
            //   child: Container(
            //     width: 270,
            //     height: 50,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         ClipRRect(
            //           borderRadius: BorderRadius.circular(5),
            //           child: Image.asset(
            //             'assets/images/BUS/love.png',
            //             width: 41,
            //             height: 41,
            //           ),
            //         ),
            //         const SizedBox(width: 10),
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: const [
            //             Text(
            //               'Because of You, I Shine',
            //               style: TextStyle(
            //                 color: Colors.black,
            //                 fontSize: 18,
            //               ),
            //             ),
            //             Text(
            //               'BUS', // ข้อความย่อย
            //               style: TextStyle(
            //                 color: Colors.grey,
            //                 fontSize: 14,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) =>
            //               LiarMusic()), // เปลี่ยนไปยัง SecondPage
            //     );
            //   },
            //   child: Container(
            //     width: 270,
            //     height: 50,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         ClipRRect(
            //           borderRadius: BorderRadius.circular(5),
            //           child: Image.asset(
            //             'assets/images/BUS/liar.png', // รูปที่จะแสดง
            //             width: 41,
            //             height: 41,
            //           ),
            //         ),
            //         const SizedBox(width: 10),
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: const [
            //             Text(
            //               'LIAR', // ข้อความหลัก
            //               style: TextStyle(
            //                 color: Colors.black,
            //                 fontSize: 18,
            //               ),
            //             ),
            //             Text(
            //               'BUS', // ข้อความย่อย
            //               style: TextStyle(
            //                 color: Colors.grey,
            //                 fontSize: 14,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => NoMatterWhatMusic()),
            //     );
            //   },
            //   child: Container(
            //     width: 270,
            //     height: 50,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         ClipRRect(
            //           borderRadius: BorderRadius.circular(5),
            //           child: Image.asset(
            //             'assets/images/BUS/nomatterwhat.png',
            //             width: 41,
            //             height: 41,
            //           ),
            //         ),
            //         const SizedBox(width: 10),
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: const [
            //             Text(
            //               'แค่ไหนแค่นั้น (์NO MATTER WHAT)',
            //               style: TextStyle(
            //                 color: Colors.black,
            //                 fontSize: 18,
            //               ),
            //             ),
            //             Text(
            //               'BUS',
            //               style: TextStyle(
            //                 color: Colors.grey,
            //                 fontSize: 14,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => SadsongScreen()),
            //     );
            //   },
            //   child: Container(
            //     width: 270,
            //     height: 50,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         ClipRRect(
            //           borderRadius: BorderRadius.circular(5),
            //           child: Image.asset(
            //             'assets/images/BUS/tranformer.png',
            //             width: 41,
            //             height: 41,
            //           ),
            //         ),
            //         const SizedBox(width: 10),
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: const [
            //             Text(
            //               'TRANSFORMER (ไม่มีเพลง)',
            //               style: TextStyle(
            //                 color: Colors.black,
            //                 fontSize: 18,
            //               ),
            //             ),
            //             Text(
            //               'BUS',
            //               style: TextStyle(
            //                 color: Colors.grey,
            //                 fontSize: 14,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => BrotherZoneMusic()),
            //     );
            //   },
            //   child: Container(
            //     width: 270,
            //     height: 50,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         ClipRRect(
            //           borderRadius: BorderRadius.circular(5),
            //           child: Image.asset(
            //             'assets/images/BUS/SLIDESHOW_1.png',
            //             width: 41,
            //             height: 41,
            //           ),
            //         ),
            //         const SizedBox(width: 10),
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: const [
            //             Text(
            //               'แค่น้องชาย (brother zone)',
            //               style: TextStyle(
            //                 color: Colors.black,
            //                 fontSize: 18,
            //               ),
            //             ),
            //             Text(
            //               'BUS',
            //               style: TextStyle(
            //                 color: Colors.grey,
            //                 fontSize: 14,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) =>
            //               SadsongScreen()),
            //     );
            //   },
            //   child: Container(
            //     width: 270,
            //     height: 50,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         ClipRRect(
            //           borderRadius: BorderRadius.circular(5),
            //           child: Image.asset(
            //             'assets/images/BUS/ooh.png',
            //             width: 41,
            //             height: 41,
            //           ),
            //         ),
            //         const SizedBox(width: 10),
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: const [
            //             Text(
            //               'ฟีลลิ่งแบบว่าอู้ว! (ไม่มีเพลง)',
            //               style: TextStyle(
            //                 color: Colors.black,
            //                 fontSize: 18,
            //               ),
            //             ),
            //             Text(
            //               'BUS',
            //               style: TextStyle(
            //                 color: Colors.grey,
            //                 fontSize: 14,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => SadsongScreen()),
            //     );
            //   },
            //   child: Container(
            //     width: 270,
            //     height: 50,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         ClipRRect(
            //           borderRadius: BorderRadius.circular(5),
            //           child: Image.asset(
            //             'assets/images/BUS/step.png',
            //             width: 41,
            //             height: 41,
            //           ),
            //         ),
            //         const SizedBox(width: 10),
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: const [
            //             Text(
            //               'WATCH YOUR STEP (ไม่มีเพลง)',
            //               style: TextStyle(
            //                 color: Colors.black,
            //                 fontSize: 18,
            //               ),
            //             ),
            //             Text(
            //               'BUS', // ข้อความย่อย
            //               style: TextStyle(
            //                 color: Colors.grey,
            //                 fontSize: 14,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) =>
            //               PictureMusic()), // เปลี่ยนไปยัง SecondPage
            //     );
            //   },
            //   child: Container(
            //     width: 270,
            //     height: 50,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         ClipRRect(
            //           borderRadius: BorderRadius.circular(5),
            //           child: Image.asset(
            //             'assets/images/BUS/we.png',
            //             width: 41,
            //             height: 41,
            //           ),
            //         ),
            //         const SizedBox(width: 10),
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: const [
            //             Text(
            //               'ภาพเรา (Good Quality Picture)',
            //               style: TextStyle(
            //                 color: Colors.black,
            //                 fontSize: 18,
            //               ),
            //             ),
            //             Text(
            //               'BUS',
            //               style: TextStyle(
            //                 color: Colors.grey,
            //                 fontSize: 14,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
