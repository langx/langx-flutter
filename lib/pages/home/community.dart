import 'package:flutter/material.dart';
import 'package:langx_flutter/components/usercard.dart';
import 'package:langx_flutter/components/headappbar.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  Widget buildCategoryButton(IconData icon, String label, Color iconColor) {
    return GestureDetector(
      onTap: () {},
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
      backgroundColor: const Color.fromARGB(31, 163, 163, 163),
      appBar: const HeadAppBar(
        title: "Commnunity",
        centerTile: false,
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
                    onTap: () {},
                    child: Ink(
                      color: const Color.fromARGB(255, 255, 251, 239),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildCategoryButton(
                            Icons.home, "For You", Colors.orange),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Ink(
                      color: const Color.fromARGB(255, 255, 251, 239),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildCategoryButton(
                            Icons.check_box, "Enthusiasts", Colors.green),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Ink(
                      color: const Color.fromARGB(255, 255, 251, 239),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildCategoryButton(
                            Icons.person_add, "New Users", Colors.red),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Ink(
                      color: const Color.fromARGB(255, 255, 251, 239),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildCategoryButton(
                            Icons.people, "Active", Colors.green),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Ink(
                      color: const Color.fromARGB(255, 255, 251, 239),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildCategoryButton(
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
                SizedBox(width: 8),
                Text(
                  "Language Mates",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF262626),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "🎯 Recommended For You",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF737373),
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
    );
  }
}
