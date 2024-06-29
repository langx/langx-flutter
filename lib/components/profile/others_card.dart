import 'package:flutter/material.dart';

// Components Imports
import 'package:langx/assets/svg/people_svg.dart';
import 'package:langx/assets/svg/eye_svg.dart';

class OthersCard extends StatelessWidget {
  const OthersCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
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
                      'Others',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 3),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Profile Management Features',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF737373),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    const PeopleSvg(
                      color: Color(0xFFFBC02D),
                      fill: 'none',
                      widht: 25,
                      height: 25,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Profile Visitors',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      iconSize: 30,
                      icon: const Icon(Icons.chevron_right),
                      onPressed: () {},
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    const EyeSvg(
                      color: Color(0xFFFBC02D),
                      fill: 'none',
                      widht: 25,
                      height: 25,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'View Profile as Public️',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      iconSize: 30,
                      icon: const Icon(Icons.chevron_right),
                      onPressed: () {},
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
