import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Circular Profile Image
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),

        SizedBox(width: 20),

        // Name and Location
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name
            Text(
              'John Doe',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),

            // Location
            Row(
              children: [
                const Icon(Icons.location_on, size: 15, color: Colors.red),
                const SizedBox(width: 3),
                Text('New York, USA', style: const TextStyle(fontSize: 13)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
