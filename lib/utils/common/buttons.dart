import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FilledAppButton extends StatelessWidget {
  const FilledAppButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      height: 5.5.h,
      decoration: ShapeDecoration(
        color: const Color(0xFFf75191),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
      child: const Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.shuffle, color: Colors.white),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 5),
              child: Text(
                'SHUFFLE PLAY',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      height: 5.5.h,
      decoration: ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
          side: const BorderSide(
            width: 1,
            color: Color(0xFFd0d1d3),
          ),
        ),
      ),
      child: const Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.favorite_border, color: Colors.white),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 5),
              child: Text(
                'FOLLOW',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
