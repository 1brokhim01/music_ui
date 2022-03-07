import 'package:flutter/material.dart';
import 'package:home30/core/constants/color_const.dart';
import 'package:home30/screens/pages/first_page.dart';
import 'package:home30/screens/pages/second_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.kPrimary_purple,
        toolbarHeight: 0.0,
        bottom: tabBarim,
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          FirstPage(),
          SecondPage(),
        ],
      ),
    );
  }

  TabBar get tabBarim => TabBar(
        indicatorColor: ColorConst.kPrimary_white,
        labelColor: ColorConst.kPrimary_white,
        controller: _tabController,
        tabs: const [
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.queue_music_outlined),
          ),
        ],
      );
}
