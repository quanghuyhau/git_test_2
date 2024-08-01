import 'package:flutter/material.dart';
import 'package:learn_flutter/ui/timerdemo/stopwatch.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int countdown = 10;


  // khởi tạo trạng thái ban đầu
  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        countdown--; //
        if (countdown > 0) {
          startCountdown();
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => StopWatchTimer()),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C2757),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                Icons.access_time_filled_rounded,
                size: 80,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Đợi $countdown giây để chuyển màn hình',
              style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

