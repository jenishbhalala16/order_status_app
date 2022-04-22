
import 'package:flutter/material.dart';

void main () {

  runApp(MaterialApp(home: StepperDemo(),));
}

class StepperDemo extends StatefulWidget {
  const StepperDemo({Key? key}) : super(key: key);

  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Stepper App'),
      ),
      body:  Column(
        children: [
          Expanded(
            child: Stepper(
              type: stepperType,
              physics: ScrollPhysics(),
              currentStep: _currentStep,
              onStepTapped: (step) => tapped(step),
              onStepContinue:  continued,
              onStepCancel: cancel,
              steps: [
                Step(
                  title:  Text('Sign Up'),
                  content: Column(
                    children: [
                      TextFormField(

                        decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: 'Full Name'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.mail_outline),
                            labelText: 'Email id'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.lock_outline),
                            labelText: 'Password'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.lock_outline),
                            labelText: 'Confirm Password'),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 0 ?
                  StepState.complete : StepState.disabled,
                ),
                Step(
                  title: Text('Login'),
                  content: Column(
                    children:[
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: 'User Name'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.lock_outline),
                            labelText: 'Password'),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 1 ?
                  StepState.complete : StepState.disabled,
                ),
                Step(
                  title:  Text('Mobile Number'),
                  content: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.mobile_friendly),
                            labelText: 'Mobile Number'),
                      ),
                    ],
                  ),
                  isActive:_currentStep >= 0,
                  state: _currentStep >= 2 ?
                  StepState.complete : StepState.disabled,
                ),
                Step(
                  title:  Text('Gender'),
                  content: Column(
                    children:[
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.perm_identity),
                            labelText: 'Enter Gender '),
                      ),
                    ],
                  ),
                  isActive:_currentStep >= 0,
                  state: _currentStep >= 3 ?
                  StepState.complete : StepState.disabled,
                ),
                Step(
                  title:  Text('Nationality'),
                  content: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.language),
                            labelText: 'Enter Your Nationality'),
                      ),
                    ],
                  ),
                  isActive:_currentStep >= 0,
                  state: _currentStep >= 4 ?
                  StepState.complete : StepState.disabled,
                ),
              ],
            ),
          ),
        ],
      ),


    );
  }


  tapped(int step){
    setState(() => _currentStep = step);
  }


  continued(){
    _currentStep < 4 ?
    setState(() => _currentStep += 1): null;
  }
  cancel(){
    _currentStep > 0 ?
    setState(() => _currentStep -= 1) : null;
  }
}