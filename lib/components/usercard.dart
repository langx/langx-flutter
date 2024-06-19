import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String name;
  final int age;
  final String studies;
  final String speaks;
  final String imageUrl;
  final String status;

  const UserCard({
    super.key,
    required this.name,
    required this.age,
    required this.studies,
    required this.speaks,
    required this.imageUrl,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(imageUrl,
                    width: double.infinity, fit: BoxFit.cover),
              ),
              const Positioned(
                top: 8,
                left: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 8,
                  child: Text(''),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    '$age',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                bottom: 3,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.white)),
                    Text(
                      studies,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: Colors.white),
                    ),
                    Text(
                      speaks,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
