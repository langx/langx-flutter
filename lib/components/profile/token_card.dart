import 'package:flutter/material.dart';

// Components Imports
import 'package:langx_flutter/assets/svg/trophy_svg.dart';
import 'package:langx_flutter/assets/svg/info_svg.dart';

class ProfileTokenCard extends StatelessWidget {
  final String imgUrl;
  final String amount;

  const ProfileTokenCard(
      {super.key, required this.imgUrl, required this.amount});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Expanded(
                    child: Text(
                      'LangX Token',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      width: 40,
                      height: 27,
                      child: Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Colors.yellow[700],
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: const InfoSvg(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 3),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your LangX Token Balance',
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        imgUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      amount,
                      style: const TextStyle(
                        fontSize: 30,
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
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          const TrophySvg(),
                          const SizedBox(width: 10),
                          const Text(
                            'Leaderboard',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
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
                    Container(
                      height: 1,
                      color: Colors.grey[300],
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
