import 'package:flutter/material.dart';

class ProfileUserCard extends StatelessWidget {
  final String name;
  final int age;
  final String gender;
  final String location;
  final String imageUrl;
  final String status;

  const ProfileUserCard({
    super.key,
    required this.name,
    required this.age,
    required this.gender,
    required this.location,
    required this.imageUrl,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
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
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(imageUrl,
                    width: 180, height: 180, fit: BoxFit.cover),
              ),
              const SizedBox(height: 16),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '$age | $gender | $location',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                status,
                style: TextStyle(
                  fontSize: 16,
                  color: status == 'Online' ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
