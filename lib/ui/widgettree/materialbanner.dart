import 'package:flutter/material.dart';
class MaterialBannerDemo extends StatelessWidget {
  const MaterialBannerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('MaterialBanner'),
        onPressed: (){
          ScaffoldMessenger.of(context).showMaterialBanner(
              MaterialBanner(
                padding: EdgeInsets.all(20),
                  content: Text('Hien thi thong bao'),
                  elevation: 5,
                  actions: <Widget>[
                    TextButton(
                        onPressed: (){
                          ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                        },
                        child: Text('dong lai')),

                  ]
              )
          );
        },
      ),
    );
  }
}
