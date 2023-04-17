import 'package:flutter/material.dart';
import 'package:u_and_i/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      // style을 한 곳에 관리할 수 있는 장점이 있습니다.
      theme: ThemeData(
        // default value 설정
        fontFamily: 'sunflower',
        textTheme: TextTheme(
          // U&I
          displayMedium: TextStyle(
            color: Colors.white,
            fontFamily: 'parisienne',
            fontSize: 80.0,
          ),
          // D+1
          displaySmall: TextStyle(
            color: Colors.white,
            // fontFamily: 'sunflower',
            fontWeight: FontWeight.w700,
            fontSize: 50.0,
          ),
          // 우리 처음 만난날
          bodyMedium: TextStyle(
            color: Colors.white,
            // fontFamily: 'sunflower',
            fontSize: 30.0,
          ),
          // 2021. 12. 27
          bodySmall: TextStyle(
            color: Colors.white,
            // fontFamily: 'sunflower',
            fontSize: 20.0,
          ),
        ),
      ),
      home: HomeScreen(),
    ),
  );
}
