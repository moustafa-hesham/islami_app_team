import 'package:flutter/material.dart';
import 'package:islami_sun_c9/ui/screens/home/tabs/ahadeth_tab/ahadeth_tab.dart';
import 'package:islami_sun_c9/ui/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami_sun_c9/ui/screens/home/tabs/radio_tab/radio_tab.dart';
import 'package:islami_sun_c9/ui/screens/home/tabs/sebha_tab/sebha_tab.dart';
import 'package:islami_sun_c9/ui/utils/app_assets.dart';
import 'package:islami_sun_c9/ui/utils/app_colors.dart';
import 'package:islami_sun_c9/ui/utils/app_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.backgorund), fit: BoxFit.fill)
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparent,
          centerTitle: true,
          title: const Text("Islami", style: AppTheme.appBarTitleTextStyle,),
        ),
        body: tabs[currentTabIndex],
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  Widget buildBottomNavigationBar() => Theme(
    data: ThemeData(canvasColor: AppColors.primiary),
    child: BottomNavigationBar(
      currentIndex: currentTabIndex,
      onTap: (index){
        currentTabIndex = index;
        setState(() {});
      },
      selectedItemColor: AppColors.accent,
      iconSize: 32,
      items: const [
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icQuran)), label: "Quran"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icAhadeth)), label: "Ahadeth"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icSebha)), label: "Sebha"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icRadio)), label: "Radio"),
      ],
    ),
  );
}
