import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spoti_third/common/helper/is_dark_mode.dart';
import 'package:spoti_third/presentation/home/widgets/news_song.dart';
import 'package:spoti_third/presentation/home/widgets/play_list_song.dart';
import 'package:spoti_third/presentation/profile/pages/profile.dart';

import '../../../core/configs/assets/app_image.dart';
import '../../../core/configs/assets/app_vector.dart';
import '../../../core/configs/theme/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _homeTopCard(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: _tabs(),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 280,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: NewsSongs(),
                  ),
                  Container(),
                  Container(),
                  Container(),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            PlayList(),
          ],
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return Center(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SvgPicture.asset(AppVector.hometop),
          Padding(
            padding: const EdgeInsets.only(right: 70),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(AppImage.artist),
            ),
          )
        ],
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
      controller: _tabController,
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      indicatorColor: AppColor.primary,
      labelPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      tabs: const [
        Text(
          'News',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        Text(
          'Videos',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        Text(
          'Artists',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        Text(
          'Podcasts',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        )
      ],
    );
  }
}
