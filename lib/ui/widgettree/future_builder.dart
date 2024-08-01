import 'package:flutter/material.dart';

class FutureBuilderDemo extends StatefulWidget {
  const FutureBuilderDemo({super.key});

  @override
  State<FutureBuilderDemo> createState() => _FutureBuilderDemoState();
}

class _FutureBuilderDemoState extends State<FutureBuilderDemo> {
  Future<String> getData() async{
    await Future.delayed(Duration(seconds: 5));

    //data
    
    // error
    throw 'Failed';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future Builder'),
      ),
      body: Center(
        child: FutureBuilder<String?>(
          future: getData(),
          builder: (context,snapshot){
           if(snapshot.hasError){
             final error = snapshot.error;
             return Text('$error');
           } else if (snapshot.hasData){
               String data = snapshot.data!;
              return Text('$data');
            } else{
              return CircularProgressIndicator();
            }
          },
        )
      ),
    );
  }
}
