import 'dart:async';
import 'package:flutter/material.dart';
import 'package:musicapp_final/screens/BUS/bushome_screen.dart';
import 'package:musicapp_final/screens/LYKN/lyknhome_screen.dart';


class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animationController;
  int _currentPage = 0;
  TextEditingController _searchController = TextEditingController();
  List<String> _suggestions = [];
  List<String> _allOptions = ['Bus', 'LYKN'];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat();

    Timer.periodic(Duration(seconds: 15), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });

    _searchController.addListener(_updateSuggestions);
  }

  void _updateSuggestions() {
    String query = _searchController.text;
    setState(() {
      if (query.isNotEmpty) {
        _suggestions = _allOptions
            .where(
                (option) => option.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        _suggestions = [];
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset(
            'assets/images/logoapp.png',
            height: 60,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Search',
                      hintText: 'Enter keywords...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'New Album',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 360,
                    child: PageView(
                      controller: _pageController,
                      children: [
                        AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: _animationController.value * 2 * 3.14159,
                              child: Image.asset(
                                'assets/images/D1.png',
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                        AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: _animationController.value * 2 * 3.14159,
                              child: Image.asset(
                                'assets/images/D1.png',
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                        AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: _animationController.value * 2 * 3.14159,
                              child: Image.asset(
                                'assets/images/D1.png',
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Artists',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LyknhomeScreen()),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 4.0,
                                    style: BorderStyle.solid,
                                  )
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/images/BUS/love.png', 
                                    fit: BoxFit.cover,
                                    width: 60, 
                                    height: 60,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text('LYKN',
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                        SizedBox(width: 16),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BushomeScreen()),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 4.0,
                                    style: BorderStyle.solid,
                                  )
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/images/BUS/liar.png',
                                    fit: BoxFit.cover,
                                    width: 60,
                                    height: 60,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text('BUS',
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (_suggestions.isNotEmpty)
                Positioned(
                  top: 70,
                  left: 16,
                  right: 16,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _suggestions.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (_suggestions[index] == 'Bus') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BushomeScreen()),
                              );
                            } else if (_suggestions[index] == 'LYKN') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LyknhomeScreen()),
                              );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Text(
                              _suggestions[index],
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                        );
                      },
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

