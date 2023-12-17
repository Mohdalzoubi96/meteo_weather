import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature.export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          bottomNavigationBar: BottomBarInspiredFancy(
            items: items,
            backgroundColor: const Color(0xFF23272d),
            color: color,
            colorSelected: colorSelect,
            indexSelected: state.index,
            onTap: (int index) => context.read<HomeBloc>().add(
                  ChangeSelectedItemHomeEvent(currentIndex: index),
                ),
          ),
          body: _getBody(state),
        );
      },
    );
  }

  Widget _getBody(HomeState state) {
    if (state is HomeMusicListState || state is HomeInitial) {
      return const HomeMusicItems();
    } else if (state is HomeSearchListState) {
      return const HomeSearchItems();
    } else if (state is HomePodcastListState) {
      return const HomePodcastItems();
    } else if (state is HomeSettingListState) {
      return const HomeSettingItems();
    }

    return const SizedBox.shrink();
  }
}
