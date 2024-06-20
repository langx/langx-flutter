import 'package:flutter/material.dart';
import 'package:langx_flutter/components/usercard.dart';

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
              style: TextStyle(color: iconColor, fontSize: 9),
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
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Community"),
            centerTitle: false,
            pinned: true,
            backgroundColor: Color(0xFFFBC02D),
            foregroundColor: Colors.black,
          ),
          SliverToBoxAdapter(
            child: Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 8.0,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: buildCategoryButton(
                          Icons.home, "FOR YOU", Colors.orange),
                    ),
                    Expanded(
                      child: buildCategoryButton(
                          Icons.check_box, "ENTHUSIASTS", Colors.green),
                    ),
                    Expanded(
                      child: buildCategoryButton(
                          Icons.person_add, "NEW USERS", Colors.red),
                    ),
                    Expanded(
                      child: buildCategoryButton(
                          Icons.people, "ACTIVE", Colors.green),
                    ),
                    Expanded(
                      child: buildCategoryButton(
                          Icons.visibility, "VISITORS", Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
          const SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Language Mates",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF262626),
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Align(
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
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return UserCard(
                    name: 'User ${index + 1}',
                    age: 18 + index,
                    studies: 'Studies info',
                    speaks: 'Speaks info',
                    imageUrl: 'assets/images/preview.png',
                    status: 'Active',
                  );
                },
                childCount: 12,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.75,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
