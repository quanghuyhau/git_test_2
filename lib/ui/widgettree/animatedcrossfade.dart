import 'package:flutter/material.dart';

class AnimatedCrossFadeDemo extends StatefulWidget {
  const AnimatedCrossFadeDemo({super.key});

  @override
  State<AnimatedCrossFadeDemo> createState() => _AnimatedCrossFadeDemoState();
}

class _AnimatedCrossFadeDemoState extends State<AnimatedCrossFadeDemo> {
  bool _bool = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: 100,
        ),
        TextButton(
            onPressed: (){
              setState(() {
                _bool = !_bool;
              });
            },
            child: Text(
              "Chuyển hình ảnh",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
        ),
       AnimatedCrossFade(
           firstChild: Image.asset('images/img.png',width: double.infinity,),
           secondChild: Image.asset('images/img_2.png',width: double.infinity,),
           crossFadeState: _bool ? CrossFadeState.showFirst : CrossFadeState.showSecond,
           duration: Duration(seconds: 5),)
      ],
    );
  }
}
