import 'package:flutter/material.dart';
class BottomSheetDemo extends StatefulWidget {
  const BottomSheetDemo({super.key});

  @override
  State<BottomSheetDemo> createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('BottomSheet'),
        onPressed: (){
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context){
                return SizedBox(
                  height: 400,
                  child: Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                          child: Text('dong lai'),
                          onPressed: (){
                            Navigator.pop(context);
                          },

                        ),



                      ],
                    ),


                  ),
                );
              });
        },
      ),
    );
  }
}
