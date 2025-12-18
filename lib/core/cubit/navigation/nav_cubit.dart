import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../screens/Home/home_screen.dart';
import '../../screens/Subscribtion/plans_screen.dart';
import '../../screens/book/book_screen.dart';
import '../../screens/profile/profile_screen.dart';

class NavCubit extends Cubit<int> {
  NavCubit() : super(0);

  List<Widget> screens = [
    HomeScreen(),
    BookScreen(),
    const PlansScreen(),
    const ProfileScreen(),
  ];

  changeIndex(int index) => emit(index);

  onWillPop() {
    if (state != 0) emit(0);
  }
}
