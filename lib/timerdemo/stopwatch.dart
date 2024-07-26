import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchTimer extends StatefulWidget {
  const StopWatchTimer({super.key});

  @override
  State<StopWatchTimer> createState() => _StopWatchTimerState();
}

class _StopWatchTimerState extends State<StopWatchTimer> {
  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = "00", digitMinutes = "00", digitHours = "00";
  Timer? timer;
  bool started = false;
  List laps = [];

  /// Chức năng dừng hẹn giờ .
  /// Timer có chức năng dừng khác với futured.delayed
  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  /// Chức năng reset thời gian
  void reset() {
    timer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitSeconds = "00";
      digitMinutes = "00";
      digitHours = "00";

      started = false;
    });
  }

  void addLap() {
    String lap = "$digitHours:$digitMinutes:$digitSeconds";
    setState(() {
      laps.add(lap);
    });
  }

  /// Tạo chức năng hẹn giờ "Bắt đầu"
  void start() {
    started = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;

      if (localSeconds > 59) {
        if (localMinutes > 59) {
          localHours++;
          localMinutes = 0;
        } else {
          localMinutes++;
          localSeconds = 0;
        }
      }
      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;
        digitSeconds = (seconds > 9) ? "$seconds" : "0$seconds";
        digitMinutes = (minutes > 9) ? "$minutes" : "0$minutes";
        digitHours = (hours >= 9) ? "$hours" : "0$hours";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C2757),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Đồng hồ bấm giờ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "$digitHours:$digitMinutes:$digitSeconds",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 80,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 400,
                decoration: BoxDecoration(
                  color: Color(0xFF323F68),
                  borderRadius: BorderRadius.circular(8.0),
                ),

                /// Tạo danh sách lưu thời gian
                child: ListView.builder(
                    itemCount: laps.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Lần ${index + 1}",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                            Text(
                              "${laps[index]}",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      (!started) ? start() : stop();
                    },
                    shape: StadiumBorder(
                      side: BorderSide(color: Colors.blue),
                    ),
                    child: Text(
                      (!started) ? "Bắt đầu " : "Tạm dừng",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  SizedBox(
                    width: 8,
                  ),
                  IconButton(
                    onPressed: () {
                      addLap();
                    },
                    icon: Icon(Icons.access_time_filled_rounded),
                    color: Colors.white,
                  ),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      reset();
                    },
                    fillColor: Colors.blue,
                    shape: StadiumBorder(
                      side: BorderSide(color: Colors.blue),
                    ),
                    child: Text(
                      'Tạo lại',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
