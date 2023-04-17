import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 100 ~ 900 / default: 500
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text(
                'U&I',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'parisienne',
                  fontSize: 80.0,
                ),
              ),
              Text(
                '우리 처음 만난날',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'sunflower',
                  fontSize: 30.0,
                ),
              ),
              Text(
                '2021. 12. 27',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'sunflower',
                  fontSize: 20.0,
                ),
              ),
              IconButton(
                onPressed: () {

                },
                icon: Icon(
                  Icons.favorite,
                ),
              ),
              Text(
                'D+1',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'sunflower',
                  fontWeight: FontWeight.w700,
                  fontSize: 50.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
