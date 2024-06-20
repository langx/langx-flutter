import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileTokenCard extends StatelessWidget {
  const ProfileTokenCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const String trophySvg = '''
   <svg xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 512 512">
   <path d="M176 464h160M256 464V336M384 224c0-50.64-.08-134.63-.12-160a16 16 0 00-16-16l-223.79.26a16 16 0 00-16 15.95c0 30.58-.13 129.17-.13 159.79 0 64.28 83 112 128 112S384 288.28 384 224z" stroke="currentColor" stroke-width="20"  fill="none"   ></path>
   <path d="M128 96H48v16c0 55.22 33.55 112 80 112M384 96h80v16c0 55.22-33.55 112-80 112" stroke="currentColor" stroke-width="20" fill="none" ></path>
   </svg>
  ''';

    const String infoSvg = '''
  <svg xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 512 512">
  <path d="M248 64C146.39 64 64 146.39 64 248s82.39 184 184 184 184-82.39 184-184S349.61 64 248 64z" stroke="currentColor" stroke-width="30" fill="none"></path>
  <path  d="M220 220h32v116" stroke="currentColor" stroke-width="30" fill="none"></path>
  <path  d="M208 340h88" stroke="currentColor" stroke-width="30" fill="none" ></path>
  <path d="M248 130a26 26 0 1026 26 26 26 0 00-26-26z" stroke="currentColor" stroke-width="30" fill="none"></path>
  </svg>
  ''';

    return SizedBox(
      height: 320,
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
                    onTap: () {
                    },
                    child: SizedBox(
                      width: 40,
                      height: 27,
                      child: Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Colors.yellow[700],
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: SvgPicture.string(
                          infoSvg,
                          width: 17,
                          height: 17,
                          color: Colors.black,
                        ),
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
                        'assets/images/token.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      '435',
                      style: TextStyle(
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
                    Container(
                      child: Row(
                        children: [
                          SvgPicture.string(
                            trophySvg,
                            width: 20,
                            height: 30,
                            color: Colors.yellow[700],
                          ),
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
