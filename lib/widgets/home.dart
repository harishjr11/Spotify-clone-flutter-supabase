import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:demo/common/widgets/appbar/app_bar.dart';
import 'package:demo/core/configs/assets/app_vectors.dart';
import 'package:demo/core/configs/themes/app_colors.dart';
import 'package:demo/navigations/tabbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        title: SvgPicture.asset(height: 40, width: 40, AppVectors.logo),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _tabs(),
            SizedBox(
              height: 650,
              child: TabBarView(
                controller: _tabController,
                children: [
                  const Tabbar(),
                  const Tabbar(),
                  Container(
                    child: const Center(
                      child: Text(
                        'PodCasts working'
                      ),
                    ),
                  )
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
      controller: _tabController,
      labelColor: Colors.white,
      indicator: BoxDecoration(
        border: Border.all(color: AppColors.primary, width: 3),
        borderRadius: BorderRadius.circular(70),
      ),
      dividerColor: Colors.black,
      indicatorPadding: const EdgeInsets.symmetric(
        vertical: -2,
        horizontal: -12,
      ),
      labelPadding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 2,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 30,
      ),
      tabs: const [
        Text(
          'All',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        Text(
          'Music',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        Text(
          'Podcasts',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ],
    );
  }
}
