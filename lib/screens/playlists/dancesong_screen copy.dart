import 'package:flutter/material.dart';

class dancesongScreen extends StatefulWidget {
  const dancesongScreen({super.key});

  @override
  State<dancesongScreen> createState() => _dancesongScreenState();
}

class _dancesongScreenState extends State<dancesongScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/images/LogoBUS_0.png',
          height: 50,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/brother.png',
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
                  MaterialPageRoute(builder: (context) => SecondPage()),
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
                        'assets/images/brother.png',
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
                            color:
                                Colors.black,
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

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}


class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: const Center(
        child: Text('Welcome to the Second Page!'),
      ),
    );
  }
}
