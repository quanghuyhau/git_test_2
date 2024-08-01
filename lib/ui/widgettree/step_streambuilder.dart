// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// class StepDemo extends StatefulWidget {
//   const StepDemo({Key? key});
//
//   @override
//   State<StepDemo> createState() => _StepDemoState();
// }
//
// class _StepDemoState extends State<StepDemo> {
//   int _currentStep = 0;
//   StreamController<int> _stepController = StreamController<int>();
//
//   @override
//   void dispose() {
//     _stepController.close(); // Đừng quên đóng StreamController khi không cần nữa
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: StreamBuilder<int>(
//         stream: _stepController.stream,
//         initialData: 0,
//         builder: (context, snapshot) {
//           int currentStep = snapshot.data ?? 0;
//
//           return Stepper(
//             steps: [
//               Step(
//                   isActive: _currentStep == 0,
//                   title: Text('Step 1'),
//                   content: Text(
//                     'Infomation for step 1',
//                     style: TextStyle(
//                       color: Colors.redAccent,
//                     ),
//                   )
//               ),
//               Step(
//                   isActive: _currentStep == 1,
//                   title: Text('Step 2'),
//                   content: Text(
//                     'Infomation for step 2',
//                     style: TextStyle(
//                       color: Colors.yellow,
//                     ),
//                   )
//               ),
//               Step(
//                   isActive: _currentStep == 2,
//                   title: Text('Step 3'),
//                   content: Text(
//                     'Infomation for step 3',
//                     style: TextStyle(
//                       color: Colors.blue,
//                     ),
//                   )
//               ),
//             ],
//             onStepTapped: (int newIndex) {
//               _stepController.add(newIndex);
//             },
//             currentStep: currentStep,
//
//           );
//         },
//       ),
//     );
//   }
// }
