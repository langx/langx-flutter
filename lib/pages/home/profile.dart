import 'package:flutter/material.dart';

import 'package:langx_flutter/components/profile_user_card.dart';
import 'package:langx_flutter/components/profile_token_card.dart';
import 'package:langx_flutter/components/profile_day_streaks_card.dart';
import 'package:langx_flutter/components/profile_about_me_card.dart';
import 'package:langx_flutter/components/profile_study_languages_card.dart';
import 'package:langx_flutter/components/profile_mother_tongues_card.dart';
import 'package:langx_flutter/components/profile_badges_card.dart';
import 'package:langx_flutter/components/profile_others_card.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Profile"),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    debugPrint('Logout button clicked');
                  },
                  child: const Icon(Icons.exit_to_app_outlined, size: 30),
                ),
                const SizedBox(width: 10.0),
              ],
            ),
          ],
        ),
        centerTitle: false,
        backgroundColor: Colors.yellow[700],
      ),
      backgroundColor: const Color.fromARGB(31, 163, 163, 163),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: ListView(
          children: const [
            //Afterwards, it should be modified to take an ID as input and retrieve data based on that ID.
            //Alternatively, the outer layer retrieves all the data for the cards and inserts them individually.
            ProfileUserCard(
              name: 'Addison',
              age: 18,
              gender: 'Male',
              location: 'TW',
              imageUrl: 'assets/images/preview.png',
              status: 'Online',
            ),
            ProfileTokenCard(
              imgUrl: 'assets/images/token.png',
              amount: '435',
            ),
            ProfileDayStreaksCard(
              imgUrl: 'assets/images/chain.png',
              days: '27',
            ),
            ProfileAboutMeCard(
                country: 'CN',
                gender: 'Male',
                age: '18',
                registeredNum: '1',
                userID: '@langx_9049',
                verifiedemail: true,
                aboutMe: ''),
            StudyLanguagesCard(languages: ["English"]),
            MotherTonguesCard(languages: ["Chinese (Simplified)"]),
            BadgesCard(
              badges: [
                {
                  'image': 'assets/images/early-adopter.png',
                  'label': 'Early Adopter'
                },
                {'image': 'assets/images/creator.png', 'label': 'Creator'},
                {'image': 'assets/images/pioneer.png', 'label': 'Pioneer'},
              ],
            ),
            OthersCard(),
          ],
        ),
      ),
    );
  }
}
