import 'dart:async';

import 'package:flutter/material.dart';
import 'package:async/async.dart';

class FutureDelayedDemo extends StatefulWidget {
  const FutureDelayedDemo({super.key});

  @override
  State<FutureDelayedDemo> createState() => _FutureDelayedDemoState();
}
class _FutureDelayedDemoState extends State<FutureDelayedDemo> {
  bool isLoading = false;
  String data = 'Tran Quang Huy';

  void fetchData() async {
    setState(() {
      isLoading = true;
    });

    // Giả lập việc lấy dữ liệu từ server bằng
    // await Future.delayed(Duration(seconds: 5));
    // setState(() {
    //   isLoading = false;
    // });

   Timer(Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (isLoading)
              CircularProgressIndicator()
            else
              Text(data), // Hiển thị thông báo khi hoàn thành
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchData,
              child: Text('Lấy dữ liệu'),
            ),
          ],
        ),
      ),
    );
  }
}


