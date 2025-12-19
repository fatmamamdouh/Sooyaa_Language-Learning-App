import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooyaa_app/core/cubit/home/home_cubit.dart';

import '../../cubit/navigation/nav_cubit.dart';
import '../../resources/app_colors.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NavCubit(),
      child: BlocBuilder<NavCubit, int>(
        builder: (context, state) {
          final nav = context.read<NavCubit>();

          return PopScope(
            canPop: state == 0,
            onPopInvokedWithResult: (didPop, result) {
              if (!didPop) {
                nav.onWillPop();
              } else {
                if (kDebugMode) {
                  print('Returned result: $result');
                }
              }
            },
            child: Scaffold(
              body: nav.screens[state],
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: AppColors.white,
                type: BottomNavigationBarType.fixed,
                elevation: 0.5,
                iconSize: 25.w,
                currentIndex: state,
                selectedItemColor: AppColors.primaryColor,
                unselectedItemColor: AppColors.grey,
                onTap: (index) => nav.changeIndex(index),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.book),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.workspace_premium_outlined),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.person),
                    label: '',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
