import 'package:flutter/material.dart';
import 'package:time_demo/screens/demo.dart';

DateTime? startTime;
DateTime? endTime;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List homeData = [];
  var time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: MaterialButton(
              onPressed: () {
                startTime = startOrEndActivity();
                print(startTime);
              },
              child: const Text('start Screen'),
              color: Colors.brown.shade200,
            ),
          ),
          Center(
            child: MaterialButton(
              onPressed: () {
                endTime = startOrEndActivity();

                Navigator.of(context)
                    .push(MaterialPageRoute(
                  builder: (context) => SecondScreen(),
                ))
                    .then((value) {
                  startTime = value;
                });
                var data = getDiffrenace(
                  startTime: startTime!,
                  endTime: endTime!,
                  activityScreen: 'homeSceen',
                );

                homeData.add(data);
              },
              child: const Text('Seconde Screen'),
              color: Colors.brown.shade200,
            ),
          ),
          MaterialButton(
            onPressed: () {
              setState(() {});
              time = homeData.reduce((v, e) => v + e);
              print("list of timer : $homeData");
              print("total timer : $time");
            },
            child: const Text('data'),
          ),
          Text("total time: $time ")
        ],
      ),
    );
  }
}

DateTime startOrEndActivity() {
  return DateTime.now();
}

int getDiffrenace(
    {required DateTime startTime,
    required DateTime endTime,
    required String activityScreen}) {
  int diffranceData = endTime.difference(startTime).inSeconds;
  print('$activityScreen *************$diffranceData');
  return diffranceData;
}
