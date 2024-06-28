import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Components Import
import 'package:langx_flutter/components/community/usercard.dart';
import 'package:langx_flutter/providers/user_provider.dart';

// Pages Import
import 'package:langx_flutter/pages/home/filters.dart';

class Community extends ConsumerStatefulWidget {
  const Community({super.key});

  @override
  ConsumerState<Community> createState() => _CommunityState();
}

class _CommunityState extends ConsumerState<Community>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    ref.read(userProvider.notifier).fetchUsers();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildCategoryTab(IconData icon, Color iconColor) {
    return Tab(
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: iconColor),
        ],
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
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Community"),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.search, size: 30),
                  onPressed: () {},
                ),
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
          ],
        ),
        centerTitle: false,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            buildCategoryTab(Icons.home_outlined, Colors.black),
            buildCategoryTab(Icons.check_box_outlined, Colors.green),
            buildCategoryTab(Icons.back_hand_outlined,
                Theme.of(context).colorScheme.secondary),
            buildCategoryTab(
                Icons.battery_charging_full_outlined, Colors.green),
            buildCategoryTab(Icons.visibility_outlined,
                Theme.of(context).colorScheme.onSurface),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CustomScrollView(
            slivers: [
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
                              imageUrl: user['imageUrl'] ??
                                  'assets/images/preview.png',
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
          const Center(child: Text('ENTHUSIASTS Content')),
          const Center(child: Text('NEW USERS Content')),
          const Center(child: Text('ACTIVE Content')),
          const Center(child: Text('VISITORS Content')),
        ],
      ),
    );
  }
}
