import 'package:flutter/material.dart';

import 'home_music_bottom_sticky.dart';

class HomeSettingItems extends StatelessWidget {
  const HomeSettingItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF212a32),
      bottomNavigationBar: MusicBottomSticky(),
      body: Center(
        child: Text(
          'Setting',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
