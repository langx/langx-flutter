import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  // ignore: use_super_parameters
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserInfoSection(),
        SendMessageButton(),
        MorePhotosSection(),
      ],
    );
  }
}

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[700],
      padding: const EdgeInsets.all(16.0),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/preview.png'),
          ),
          SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tanya',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('ACTIVE IN IM AGO'),
              Text('27 | FEMALE | AUSTRALIA'),
            ],
          ),
        ],
      ),
    );
  }
}

class SendMessageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Send A Message'),
    );
  }
}

class MorePhotosSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'More Photos',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text('Currently, no photos are available.'),
        ],
      ),
    );
  }
}
