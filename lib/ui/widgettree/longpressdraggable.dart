import 'package:flutter/material.dart';

class LongPressDraggableDemo extends StatefulWidget {
  const LongPressDraggableDemo({super.key});

  @override
  State<LongPressDraggableDemo> createState() => _LongPressDraggableDemoState();
}

class _LongPressDraggableDemoState extends State<LongPressDraggableDemo> {
  /// Khởi tạo vị trí ban đầu của ảnh
  Offset _offset = const Offset(200, 200);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context,constraints){
          return Stack(
            children: [
              Positioned(
                left: _offset.dx,
                  top: _offset.dy,
                  child:LongPressDraggable(
                    feedback: Image.network(
                      'https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcRDMiX3WLUFddSJ5cr4O74OWWM9gwXlrK-M9M6GKpPDJI6o9tqOkYJXy0u6cd7wdMwDxc12bpoyiwbVgpE',
                      height: 100,
                      color: Colors.red,
                      colorBlendMode: BlendMode.colorBurn,
                    ),
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcRDMiX3WLUFddSJ5cr4O74OWWM9gwXlrK-M9M6GKpPDJI6o9tqOkYJXy0u6cd7wdMwDxc12bpoyiwbVgpE',
                      height: 100,
                    ),
                    onDragEnd: (details){
                      setState(() {
                        double adjustment = MediaQuery.of(context).size.height - constraints.maxHeight;
                        _offset = Offset(details.offset.dx, details.offset.dy - adjustment);
                      });
                    },
                  )
              )
            ],
          );
        },
      ),
    );
  }
}
