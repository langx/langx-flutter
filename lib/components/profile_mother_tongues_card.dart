import 'package:flutter/material.dart';
import 'package:langx_flutter/components/word_svg.dart';

class MotherTonguesCard extends StatelessWidget {
  final List<String> languages;

  const MotherTonguesCard({
    super.key,
    required this.languages,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
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
                      'Mother Tongue(s)',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 3),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'The language(s) you speak at home',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF737373),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: ListView.builder(
                  itemCount: languages.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          const WordSvg(),
                          const SizedBox(width: 10),
                          Text(
                            languages[index],
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            '中國人',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF737373),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
