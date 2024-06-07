import 'package:flutter/material.dart';
import 'package:langx_flutter/pages/chat/home/bottom_navigation_bar.dart';
import 'package:langx_flutter/pages/chat/home/head_bar.dart';
import 'package:go_router/go_router.dart';


class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    switch (index) {
      case 1:

        break;
      
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildCategoryButton(IconData icon, String label, Color iconColor) {
    return GestureDetector(
      onTap: () {
        print('$label button tapped');
      },
      child: Container(
        color: const Color.fromARGB(255, 255, 251, 239),
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(color: iconColor, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeadAppBar(
        title: 'Community',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      print('For You button tapped');
                    },
                    child: Ink(
                      color: const Color.fromARGB(255, 255, 251, 239),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildCategoryButton(
                            Icons.home, "For You", Colors.orange),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('Enthusiasts button tapped');
                    },
                    child: Ink(
                      color: const Color.fromARGB(255, 255, 251, 239),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildCategoryButton(
                            Icons.check_box, "Enthusiasts", Colors.green),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('New Users button tapped');
                    },
                    child: Ink(
                      color: const Color.fromARGB(255, 255, 251, 239),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildCategoryButton(
                            Icons.person_add, "New Users", Colors.red),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('Active button tapped');
                    },
                    child: Ink(
                      color: const Color.fromARGB(255, 255, 251, 239),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildCategoryButton(
                            Icons.people, "Active", Colors.green),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('Visitors button tapped');
                    },
                    child: Ink(
                      color: const Color.fromARGB(255, 255, 251, 239),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildCategoryButton(
                            Icons.visibility, "Visitors", Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.handshake, color: Colors.orange),
                SizedBox(width: 8),
                Text(
                  "Welcome to the Community",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "New Users",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(6, (index) {
                  return UserCard(
                    name: 'User ${index + 1}',
                    age: 18 + index,
                    studies: 'Studies info',
                    speaks: 'Speaks info',
                    imageUrl: 'assets/images/preview.png',
                    status: 'Active',
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final String name;
  final int age;
  final String studies;
  final String speaks;
  final String imageUrl;
  final String status;

  const UserCard({
    Key? key,
    required this.name,
    required this.age,
    required this.studies,
    required this.speaks,
    required this.imageUrl,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(imageUrl,
                    width: double.infinity, fit: BoxFit.cover),
              ),
              const Positioned(
                top: 8,
                left: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 8,
                  child: Text(''),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    '$age',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                bottom: 3,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.white)),
                    Text(
                      studies,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: Colors.white),
                    ),
                    Text(
                      speaks,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
