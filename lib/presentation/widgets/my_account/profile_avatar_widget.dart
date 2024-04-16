import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/theme.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.photoURL,
  });

  final String? photoURL;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: lightGreyColor,
            border: Border.all(color: darkGreyColor, width: 6),
          ),
          child: photoURL != null
              ? CircleAvatar(
                  radius: 48,
                  backgroundImage: NetworkImage(photoURL!),
                )
              : const Icon(
                  Icons.person_outlined,
                  size: 80,
                  color: darkGreyColor,
                ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 35,
            height: 35,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: darkGreenColor,
            ),
            child: const Icon(
              Icons.add,
              size: 35,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
