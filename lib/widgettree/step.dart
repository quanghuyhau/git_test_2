import 'package:flutter/material.dart';

class StepDemo extends StatefulWidget {
  const StepDemo({super.key});

  @override
  State<StepDemo> createState() => _StepDemoState();
}

class _StepDemoState extends State<StepDemo> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stepper(
        steps: [
          Step(
            isActive: _currentStep == 0,
            title: Text('Step 1'),
            content: Text(
              'Infomation for step 1',
              style: TextStyle(
                color: Colors.redAccent,
              ),
            )
          ),
          Step(
            isActive: _currentStep == 1,
            title: Text('Step 2'),
            content: Text(
              'Infomation for step 2',
              style: TextStyle(
                color: Colors.yellow,
              ),
            )
          ),
          Step(
            isActive: _currentStep == 2,
            title: Text('Step 3'),
            content: Text(
              'Infomation for step 3',
              style: TextStyle(
                color: Colors.blue,
              ),
            )
          ),
        ],
        onStepTapped: (int newIndex){
          setState(() {
            _currentStep = newIndex;
          });
        },
        currentStep: _currentStep,
        onStepContinue: (){
          if(_currentStep != 2){
            setState(() {
              _currentStep += 1;
            });
          }
        },
        onStepCancel: (){
          if(_currentStep != 0){
            setState(() {
              _currentStep -= 1;
            });
          }
        },
        type: StepperType.horizontal,
      ),
    );
  }
}
