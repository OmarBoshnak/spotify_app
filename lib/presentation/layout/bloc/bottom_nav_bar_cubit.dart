import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spoti_third/core/configs/assets/app_image.dart';
import 'package:spoti_third/presentation/home/pages/home_screen.dart';
import 'package:spoti_third/presentation/layout/bloc/bottom_nav_bar_state.dart';
import 'package:spoti_third/presentation/play_list_screen/pages/play_list.dart';
import 'package:spoti_third/presentation/profile/pages/profile.dart';

import '../../../core/configs/assets/app_vector.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNvaBarInitail());
  static BottomNavBarCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    HomePage(),
    PlayListPage(),
    ProfilePage(),
  ];
  List<dynamic> title = [
    SvgPicture.asset(
      AppVector.logo,
      height: 40,
      width: 40,
    ),
    Text(''),
    Text('Profile',
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w700,
        )),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeBottomNvaBar());
  }
}
