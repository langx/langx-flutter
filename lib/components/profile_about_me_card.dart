import 'package:flutter/material.dart';
import 'package:langx_flutter/components/info_svg.dart';
import 'package:langx_flutter/components/country_svg.dart';
import 'package:langx_flutter/components/gender_svg.dart';
import 'package:langx_flutter/components/calendar_svg.dart';
import 'package:langx_flutter/components/clock_svg.dart';
import 'package:langx_flutter/components/at_sign_svg.dart';
import 'package:langx_flutter/components/shield_svg.dart';

class ProfileAboutMeCard extends StatelessWidget {
  final String country;
  final String gender;
  final String age;
  final String registeredNum;
  final String userID;
  final bool verifiedemail;
  final String? aboutMe;

  const ProfileAboutMeCard({
    super.key,
    required this.country,
    required this.gender,
    required this.age,
    required this.registeredNum,
    required this.userID,
    required this.verifiedemail,
    this.aboutMe,
  });

  @override
  Widget build(BuildContext context) {
    String aboutMeText = (aboutMe?.isEmpty ?? true)
        ? "No 'About Me' text provided yet. 💬"
        : aboutMe!;
    String verifiedText =
        (verifiedemail) ? "Verified Email" : "Unverified Email";
    Color verifiedColor =
        (verifiedemail) ? const Color(0xFF2DD55B) : Colors.red;

    return LayoutBuilder(
      builder: (context, constraints) {
        double cardHeight =
            constraints.maxHeight > 550 ? 550 : constraints.maxHeight;
        return SizedBox(
          height: cardHeight,
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
                          'About Me',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Personal Information',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF737373),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      physics:
                          const NeverScrollableScrollPhysics(), // disable scrolling
                      children: [
                        ListTile(
                          leading: const InfoSvg(
                            color: Color(0xFFFBC02D),
                            fill: 'none',
                            widht: 20,
                            height: 20,
                          ),
                          title: Text(
                            aboutMeText,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color(0xFF737373),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: const CountrySvg(
                            color: Color(0xFFFBC02D),
                            fill: 'none',
                            widht: 20,
                            height: 20,
                          ),
                          title: Text(
                            country,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                        ListTile(
                          leading: const GenderSvg(
                            color: Color(0xFFFBC02D),
                            fill: 'none',
                            widht: 20,
                            height: 20,
                          ),
                          title: Text(
                            gender,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                        ListTile(
                          leading: const CalendarSvg(
                            color: Color(0xFFFBC02D),
                            fill: 'none',
                            widht: 20,
                            height: 20,
                          ),
                          title: Text(
                            "$age years old",
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                        ListTile(
                          leading: const ClockSvg(
                            color: Color(0xFFFBC02D),
                            fill: 'none',
                            widht: 20,
                            height: 20,
                          ),
                          title: Text(
                            "Registered $registeredNum months ago",
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                        ListTile(
                          leading: const AtSignSvg(
                            color: Color(0xFFFBC02D),
                            fill: 'none',
                            widht: 20,
                            height: 20,
                          ),
                          title: Text(
                            userID,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                        ListTile(
                          leading: ShieldSvg(
                            color: verifiedColor,
                            fill: 'none',
                            widht: 20,
                            height: 20,
                          ),
                          title: Text(
                            verifiedText,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
