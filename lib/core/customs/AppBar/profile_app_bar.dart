import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Profile",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        IconButton(
          onPressed: () => Navigator.pushNamed(context, "settings"),
          icon: const Icon(Icons.settings),
          color: AppColors.primaryColor,
        ),
      ],
    );
  }
}
