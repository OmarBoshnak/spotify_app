import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoti_third/common/icon_broken.dart';
import 'package:spoti_third/core/configs/theme/app_color.dart';
import 'package:spoti_third/presentation/layout/bloc/bottom_nav_bar_cubit.dart';
import 'package:spoti_third/presentation/layout/bloc/bottom_nav_bar_state.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        var cubit = BottomNavBarCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_rounded,
                size: 30,
              ),
            ),
            centerTitle: true,
            title: cubit.title[cubit.currentIndex],
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert_rounded),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              showUnselectedLabels: true,
              currentIndex: cubit.currentIndex,
              unselectedFontSize: 10,
              fixedColor: AppColor.primary,
              elevation: 10,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Heart),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Profile,
                    size: 20,
                  ),
                  label: 'Profile',
                )
              ]),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
