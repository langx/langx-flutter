import 'package:flutter/material.dart';
import 'package:langx_flutter/pages/home/filters.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Components Import
import 'package:langx_flutter/components/community/usercard.dart';
import 'package:langx_flutter/providers/user_provider.dart';

class Community extends ConsumerStatefulWidget {
  const Community({super.key});

  @override
  ConsumerState<Community> createState() => _CommunityState();
}

class _CommunityState extends ConsumerState<Community> {
  @override
  void initState() {
    super.initState();
    ref.read(userProvider.notifier).fetchUsers();
  }

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

  int _calculateCrossAxisCount(double width) {
    if (width < 600) {
      return 2;
    } else if (width < 900) {
      return 3;
    } else if (width < 1200) {
      return 4;
    } else if (width < 1800) {
      return 5;
    } else {
      return 6;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int crossAxisCount = _calculateCrossAxisCount(width);

    final users = ref.watch(userProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(31, 163, 163, 163),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.search, size: 30),
                  onPressed: () {},
                ),
                const SizedBox(width: 10.0),
                IconButton(
                  icon: const Icon(Icons.filter_list, size: 30),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FiltersPage()),
                    );
                  },
                ),
              ],
            ),
            centerTitle: false,
            pinned: true,
            backgroundColor: const Color(0xFFFBC02D),
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
          users.isEmpty
              ? const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                )
              : SliverPadding(
                  padding: const EdgeInsets.all(8.0),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        final user = users[index].data;
                        return UserCard(
                          name: user['name'].toString(),
                          age: user['age'] ?? 0,
                          studies: user['studyLanguages'].toString(),
                          speaks: user['motherLanguages'].toString(),
                          imageUrl:
                              user['imageUrl'] ?? 'assets/images/preview.png',
                          status: user['status'] ?? 'Active',
                        );
                      },
                      childCount: users.length,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 0.75,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
