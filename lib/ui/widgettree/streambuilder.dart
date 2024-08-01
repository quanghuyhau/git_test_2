import 'package:flutter/material.dart';

class StreamBuilderDemo extends StatefulWidget {
  const StreamBuilderDemo({super.key});

  @override
  State<StreamBuilderDemo> createState() => _StreamBuilderDemoState();
}

Stream<String> generateStream = (() async * {
  await Future<void>.delayed(Duration(seconds: 2));
  yield 'Tran';
  await Future<void>.delayed(Duration(seconds: 2));
  yield 'Quang';
  // throw 'Bi loi roi !';
  await Future<void>.delayed(Duration(seconds: 2));
  yield 'Huy';
  await Future<void>.delayed(Duration(seconds: 5));
  yield 'Tran Quang Huy';


})();
class _StreamBuilderDemoState extends State<StreamBuilderDemo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
        stream: generateStream,
        initialData: 0,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator.adaptive();
          }
          if (snapshot.hasError) {
            return Text('BI LOI ROI !');
          } else {
            return Text(
              snapshot.data.toString(),
              style: TextStyle(fontSize: 50),
            );
          }
        },
      ),
    );
  }
}
