import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp( Kitchen());

class Kitchen extends StatefulWidget{
  Kitchen( {Key? key,}) : super(key: key);

  //===================================================
  // createState                                      =
  //===================================================
  @override
  _KitchenState createState(){
    return _KitchenState();
  }
}

class _KitchenState extends State<Kitchen> {

  Future<bool> wasteTime() {
    return Future.delayed(const Duration(seconds: 2)).then((onValue) => true);
  }

  Future<String> retrieve() async {
    const String link = 'http://worldclockapi.com/api/json/utc/now';
    Uri url = Uri.parse(link);

    http.Response response = await http.get(url);
    Map body = json.decode( response.body );
    String result = body['currentDateTime'];

// here only to show the CircularProgressIndicator to the user.
//  The network calls are fairly quick.

    await wasteTime();

    return result;
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: retrieve(),
        builder: (context, snapshot) {
          if( snapshot.connectionState == ConnectionState.done
              && snapshot.hasError )
          {
            return MaterialApp(
                title: 'Flutter Demo',
                home: Scaffold(
                    appBar: AppBar(title: const Text('Kitchen async demo') ),
                    body: Container(
                        color: Colors.cyan[50],
                        child: const Center( child: Text( 'Error message' ) )
                    )
                )
            );
          }
          else if( snapshot.connectionState == ConnectionState.done
              && snapshot.hasData )
          {
            final caption = snapshot.data ?? '-none-';
            return MaterialApp(
                title: 'Flutter Demo',
                home: Scaffold(
                    appBar: AppBar(
                        title: const Text('Kitchen async demo')
                    ),
                    body: Container(
                        color: Colors.cyan[50],
                        child: Center(
                            child: Text( caption.toString() )
                        )
                    )
                )
            );
          }
          else {
            return MaterialApp(
                title: 'Flutter Demo',
                home: Scaffold(
                    appBar: AppBar(title: const Text('Kitchen async demo') ),
                    body: Container(
                        color: Colors.cyan[50],
                        child: const Center(
                            child: CircularProgressIndicator(
                                value: null, color: Colors.blue
                            )
                        )
                    )
                )
            );
          }
        }
    );
  }
}