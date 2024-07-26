import 'package:flutter/material.dart';

class SetsDemo extends StatefulWidget {
  const SetsDemo({super.key});

  @override
  State<SetsDemo> createState() => _SetsDemoState();
}

class _SetsDemoState extends State<SetsDemo> {
  final Set<String> itemsSet = {};
  final List<String> itemsList = [];
  final TextEditingController textController = TextEditingController();

  void _addItem() {
    if (textController.text.isNotEmpty) {
      setState(() {
        itemsSet.add(textController.text);
        itemsList.add(textController.text);
        textController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Set vs List Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: 'Enter item',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addItem,
              child: Text('Add Item'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text('Set'),
                        Expanded(
                          child: ListView.builder(
                            itemCount: itemsSet.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(itemsSet.elementAt(index)),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(),
                  Expanded(
                    child: Column(
                      children: [
                        Text('List'),
                        Expanded(
                          child: ListView.builder(
                            itemCount: itemsList.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(itemsList[index]),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}