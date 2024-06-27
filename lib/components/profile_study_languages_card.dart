import 'package:flutter/material.dart';

// Components Imports
import 'package:langx_flutter/components/battery_svg.dart';

class StudyLanguagesCard extends StatelessWidget {
  final List<String> languages;

  const StudyLanguagesCard({
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
                      'Study Language(s)',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 3),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'The language(s) that you Practice & Learn',
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
                          const BatterySvg(),
                          const SizedBox(width: 10),
                          Text(
                            languages[index],
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            languages[index],
                            style: const TextStyle(
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
