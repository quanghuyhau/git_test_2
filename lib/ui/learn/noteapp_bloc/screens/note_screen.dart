import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/note.dart';

class NoteScreen extends StatelessWidget {
   NoteScreen({super.key});

  List<Note> noteList = [
    Note(title: 'Note 1'),
    Note(title: 'Note 2'),
    Note(title: 'Note 3'),
    Note(title: 'Note 4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note App Bloc'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.add)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text("Note: "),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: noteList.length,
                  itemBuilder: (context,index){
                  var note = noteList[index];
                  return ListTile(
                    title: Text(note.title),
                    trailing: Checkbox(
                      value: note.isDone,
                      onChanged: (value){},
                    ),
                  );
                  }),
            )
          ],
      ),
    );
  }
}
