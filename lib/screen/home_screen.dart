import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 100 ~ 900 / default: 500
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        bottom: false,
        child: Container(
          // of: constructor
          // of라는 constructor를 사용하는 클래스들의 특징은 inherited 위젯입니다.
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              // 자식 클래스(위젯)에서는 데이터를 올려줄 수 없습니다.
              // _TopPart의 state를 _HomeScreenState로 올려준 이유입니다. 향후 하위 클래스(위젯)에서 사용할 수 도 있기 때문에...
              _TopPart(
                selectedDate: selectedDate,
                onPressed: onHeartPressed,
              ),
              _BottomPart(),
            ],
          ),
        ),
      ),
    );
  }

  void onHeartPressed() {
    final DateTime now = DateTime.now();

    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        // 특정 위젯이 어디에 정렬을 해야하는지 알 수가 없으면, 그냥 최대한의 사이즈를 차지합니다.
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 300.0,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: selectedDate,
              maximumDate: DateTime(
                now.year,
                now.month,
                now.day,
              ),
              onDateTimeChanged: (DateTime dateTime) {
                print(dateTime);
                setState(() {
                  selectedDate = dateTime;
                });
              },
            ),
          ),
        );
      },
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        'asset/img/middle_image.png',
      ),
    );
  }
}

class _TopPart extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPressed;

  _TopPart({
    Key? key,
    required this.selectedDate,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // main.dart에서 지정한 theme 가져오기
    // 위젯 트리에서 가장 가까운 theme 인스턴스를 가져옵니다.
    // of: constructor
    // of라는 constructor를 사용하는 클래스들의 특징은 inherited 위젯입니다.
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final now = DateTime.now();

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'U&I',
            style: textTheme.displayMedium,
          ),
          Column(
            children: [
              Text(
                '우리 처음 만난날',
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                // '2021. 12. 27',
                '${selectedDate.year}. ${selectedDate.month}. ${selectedDate.day}',
                style: textTheme.bodySmall,
              ),
            ],
          ),
          IconButton(
            iconSize: 60.0,
            onPressed: onPressed,
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          Text(
            // 'D+1',
            'D+${DateTime(
                  now.year,
                  now.month,
                  now.day,
                ).difference(selectedDate).inDays + 1}',
            style: textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
