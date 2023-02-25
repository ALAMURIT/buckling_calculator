import 'package:buckling_calculator/utilities/input_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(BucklingCalculator());
}

class BucklingCalculator extends StatefulWidget {
  const BucklingCalculator({super.key});

  @override
  State<BucklingCalculator> createState() => _BucklingCalculatorState();
}

class _BucklingCalculatorState extends State<BucklingCalculator> {
  final loadTextController = TextEditingController();
  final lengthTextController = TextEditingController();
  final modulusTextController = TextEditingController();
  final inertiaTextController = TextEditingController();
  final resultTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 32,);
  double loadP = 1, lengthL = 1, movementI = 1, modulusE = 1, criticalLoad = 1;
  String resultText = "N/A";
  Color resultColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buckling Calculator',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Buckling Calculator'),
        ),
        body: Center(
          child: Container(
              color: Colors.blue,
              // height: 600,
              // width: 900,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Group #1
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 300,
                      color: Colors.white,
                      child: Column(
                        children: [
                          //Element #1 Buckling Image with all varibles shown, like L, P etc.
                          Container(
                            // color: Colors.amber,
                            height: 300,
                            // width: 200,
                            // child: Image(image: AssetImage('assets/Buckling_Calculator.png'))
                            child: SvgPicture.asset('assets/Buckling_Illustration.svg'),
                          ),
                          //Element #2 Text showing result weather the column will fail or not !
                          Container(
                            height: 200,
                            child: Center(
                              child: Text(
                                resultText,
                                style: TextStyle(
                                  color: resultColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                ),
                                )
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Group #2
                  //Contains all text fields and buttons
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // width: 200,
                        // height: 128,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //P field
                            inputCard(captionText: 'Load : ', labelText: 'Enter P in N', inputCardController: loadTextController),
                            inputCard(captionText: 'Length : ', labelText: 'Enter L in mm', inputCardController: lengthTextController),
                            inputCard(captionText: 'Youngs Modulus : ', labelText: 'Enter E in N/mm\u00B2', inputCardController: modulusTextController),
                            inputCard(captionText: 'Movement of inertia : ', labelText: 'Enter I in mm\u2074', inputCardController: inertiaTextController),
                            Container(
                              // color: Colors.green,
                              height: 64,
                              width: 512,
                              child: ElevatedButton(
                                child: const Text('Calculate'),
                                onPressed: () {
                                  loadP = double.parse(loadTextController.text);
                                  lengthL = double.parse(lengthTextController.text);
                                  movementI = double.parse(inertiaTextController.text);
                                  modulusE = double.parse(modulusTextController.text);
                                  criticalLoad = (3.14*3.14*modulusE*movementI)/(lengthL*lengthL);
                                  if(criticalLoad > loadP){
                                    setState(() {
                                      resultText = "Column is safe";
                                      resultColor = Colors.green;
                                    });
                                  } 
                                  else {
                                    setState(() {
                                      resultText = "Column failed !";
                                      resultColor = Colors.red;
                                    });
                                  };
                                  print('P : $loadP Lc : $criticalLoad');
                                  },
                                ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
