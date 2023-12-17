import 'package:flutter/material.dart';

import '../home.export.dart';

class HomeSearchItems extends StatelessWidget {
  const HomeSearchItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF212a32),
      bottomNavigationBar: MusicBottomSticky(),
      body: Center(
        child: Text(
          'Search ...',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
