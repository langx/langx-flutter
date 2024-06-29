import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Providers Import
import 'package:langx/providers/auth_provider.dart';

// Components Import
import 'package:langx/components/profile/user_card.dart';
import 'package:langx/components/profile/token_card.dart';
import 'package:langx/components/profile/day_streaks_card.dart';
import 'package:langx/components/profile/about_me_card.dart';
import 'package:langx/components/profile/study_languages_card.dart';
import 'package:langx/components/profile/mother_tongues_card.dart';
import 'package:langx/components/profile/badges_card.dart';
import 'package:langx/components/profile/others_card.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
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
                  onTap: () async {
                    ref.read(authProvider.notifier).logout(context);
                  },
                  child: const Icon(Icons.exit_to_app_outlined),
                ),
                const SizedBox(width: 10.0),
              ],
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: const [
            // Afterwards, it should be modified to take an ID as input and retrieve data based on that ID.
            // Alternatively, the outer layer retrieves all the data for the cards and inserts them individually.
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
            StudyLanguagesCard(languages: ["English", "Italian", "French"]),
            MotherTonguesCard(languages: [
              "Chinese (Simplified)",
              "English",
              "Italian",
              "French",
              "Spanish",
            ]),
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
