import 'package:flutter/material.dart';

class BadgesCard extends StatelessWidget {
  final List<Map<String, String>> badges;

  const BadgesCard({
    super.key,
    required this.badges,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Badges',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 3),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "The badges you've earned.",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF737373),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: badges.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(
                        badges[index]['image']!,
                        width: 60,
                        height: 60,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        badges[index]['label']!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF737373),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
