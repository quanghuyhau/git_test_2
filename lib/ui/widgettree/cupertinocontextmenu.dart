import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoContextMenuDemo extends StatelessWidget {
  const CupertinoContextMenuDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: CupertinoContextMenu(
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRSayGtNxjkX66PfYfVA69HM3h3_fDAB69yA&s',
            ),
            actions: <Widget>[
              CupertinoContextMenuAction(
                child: Text('Xóa ứng dụng'),
                onPressed: () {

                  // Đóng CupertinoContextMenu
                  Navigator.of(context).pop();
                },
              ),

              CupertinoContextMenuAction(
                  child: Text('Sửa ứng dụng'),
                onPressed: (){
                    Navigator.pop(context);
                },

              )
            ],
          ),
        ),
      ),
    );
  }
}
