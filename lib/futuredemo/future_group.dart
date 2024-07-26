import 'package:flutter/material.dart';
import 'package:async/async.dart';

class FutureGroupDemo extends StatefulWidget {
  const FutureGroupDemo({Key? key}) : super(key: key);

  @override
  State<FutureGroupDemo> createState() => _FutureGroupDemoState();
}

class _FutureGroupDemoState extends State<FutureGroupDemo> {
  int _result = 0;
  bool _isLoading = false;

  Future<int> _futureOne() async {
    await Future.delayed(const Duration(seconds: 2));
    return 1;
  }

  Future<int> _futureTwo() async {
    await Future.delayed(const Duration(seconds: 2));
    return 2;
  }

  Future<int> _futureThree() async {
    await Future.delayed(const Duration(seconds: 2));
    return 3;
  }
  Future<int> _futureFour() async {
    await Future.delayed(const Duration(seconds: 2));
    return 4;
  }
  Future<int> _futureFive() async {
    await Future.delayed(const Duration(seconds: 2));
    return 5;
  }

  void _fireFutureGroup() async {
    setState(() {
      _isLoading = true;
    });

    final FutureGroup<int> futureGroup = FutureGroup<int>();
    futureGroup.add(_futureOne());
    futureGroup.add(_futureTwo());
    futureGroup.add(_futureThree());
    futureGroup.add(_futureFour());
    futureGroup.add(_futureFive());

    futureGroup.close();

    final List<int> results = await futureGroup.future;
    final sum = results.fold<int>(0, (prev, element) => prev + element);

    setState(() {
      _isLoading = false;
      _result = sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureGroup Example'),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : Text(
          _result.toString(),
          style: const TextStyle(fontSize: 100, color: Colors.purple),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fireFutureGroup,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}


