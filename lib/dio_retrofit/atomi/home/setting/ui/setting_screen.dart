import 'package:flutter/material.dart';


class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      border: Border(
                          bottom: BorderSide( //                   <--- left side
                            color: Colors.grey.shade300,
                            width: 1.0,
                          )
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
                      child: Text(
                        'HuyQuangTran',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),

            ],
          ),
        )
    );
  }
}
