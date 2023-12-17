import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:meteo_weather/utils/services/custom_navigation.dart';
import 'package:meteo_weather/utils/theme/light_theme.dart';

int visit = 0;
double height = 30;
Color colorSelect = LightTheme.of(currentContext!).secondaryColor;
Color color = Colors.white;
Color color2 = const Color(0XFF96B1FD);
Color bgColor = LightTheme.of(currentContext!).secondaryColor;

List<TabItem> items = [
  const TabItem(
    icon: Icons.home,
    // title: 'Home',
  ),
  const TabItem(
    icon: Icons.search_sharp,
    // title: 'Search',
  ),
  TabItem(
    icon: Icons.headphones,
    // title: 'Music',
  ),
  const TabItem(
    icon: Icons.podcasts,
    // title: 'Podcasts',
  ),
  const TabItem(
    icon: Icons.settings,
    // title: 'Settings',
  ),
];
