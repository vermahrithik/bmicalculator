import 'package:bmicalculator/BmiLogic.dart';
import 'package:bmicalculator/BmiResultPage.dart';
import 'package:flutter/material.dart';

enum Gender {
  male,
  female,
}

class BmiCalculatorPage extends StatefulWidget {
  const BmiCalculatorPage({super.key});

  @override
  State<BmiCalculatorPage> createState() => _BmiCalculatorPageState();
}

class _BmiCalculatorPageState extends State<BmiCalculatorPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xff1e2134),
      appBar: AppBar(
        title: Text('BMI CALCULATOR',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Color(0xff1e2134),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: Container(
                        height: deviceWidth*0.45,
                        width: deviceWidth*0.45,
                        color: selectedGender == Gender.male
                        ? Color(0xff25243b)
                        : Color(0xff2f3041),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.male,size: 60,),
                            Text('MALE',style: TextStyle(fontSize: 16),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: Container(
                        height: deviceWidth*0.45,
                        width: deviceWidth*0.45,
                        color: selectedGender == Gender.female
                            ? Color(0xff25243b)
                            : Color(0xff2f3041),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.female,size: 60,),
                            Text('FEMALE',style: TextStyle(fontSize: 16),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Container(
                  height: deviceHeight*0.3,
                  width: deviceWidth*0.91,
                  color: Color(0xff2f3041),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('HEIGHT',style: TextStyle(fontSize: 18),),
                      Text('${height.toString()} cm',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800,color: Colors.white),),
                      SizedBox(
                        width: deviceWidth*0.9,
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Color(0xff8F3F68), // Color for the active part of the slider
                            inactiveTrackColor: Colors.grey.shade200, // Color for the inactive part of the slider
                            thumbColor: Color(0xffcc4367), // Color for the thumb (circular part)
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                            overlayColor: Colors.grey, // Color for the overlay when dragging
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 18.0),
                            valueIndicatorColor: Colors.white,
                            valueIndicatorTextStyle: TextStyle(
                              color: Color(0xff5f384a),
                              fontWeight: FontWeight.w800
                            )

                          ),
                          child: Slider(
                            value: height.toDouble(),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                            label: height.round().toString(),
                            min: 0,
                            max: 220,
                            divisions: 219,
                          ),
                        )

                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Container(
                      height: deviceWidth*0.45,
                      width: deviceWidth*0.45,
                      color: Color(0xff2f3041),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT',style: TextStyle(fontSize: 18,),),
                          Text('${weight.toString()}',style: TextStyle(fontSize: 50,fontWeight: FontWeight.w800,color: Colors.white),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: GestureDetector(
                                  onTap: (){
                                    if(weight <= 0){
                                      weight=0;
                                    }else{
                                      setState(() {
                                        weight--;
                                      });
                                    }
                                  },
                                  child: Container(
                                    height:45,
                                    width: 45,
                                    color: Color(0xff686775),
                                    child: Icon(Icons.remove,color: Colors.white,size: 18,),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16,),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  child: Container(
                                    height:45,
                                    width: 45,
                                    color: Color(0xff686775),
                                    child: Icon(Icons.add,color: Colors.white,size: 18,),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Container(
                      height: deviceWidth*0.45,
                      width: deviceWidth*0.45,
                      color: Color(0xff2f3041),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE',style: TextStyle(fontSize: 18,),),
                          Text('$age',style: TextStyle(fontSize: 50,fontWeight: FontWeight.w800,color: Colors.white),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: GestureDetector(
                                  onTap: (){
                                    if(age <= 0){
                                      setState(() {
                                        age=0;
                                      });
                                    }else{
                                      setState(() {
                                        age--;
                                      });
                                    }
                                  },
                                  child: Container(
                                    height:45,
                                    width: 45,
                                    color: Color(0xff686775),
                                    child: Icon(Icons.remove,color: Colors.white,size: 18,),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16,),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  child: Container(
                                    height:45,
                                    width: 45,
                                    color: Color(0xff686775),
                                    child: Icon(Icons.add,color: Colors.white,size: 18,),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                BmiLogic calc = BmiLogic(height: height, weight: weight);
                return BmiResultPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  suggestion: calc.getSuggestion(),
                );
              },
            ),
          );
        },
        child: BottomAppBar(
            color: Color(0xffe04167),
            child: Center(
              child: Text('CALCULATE',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
            )
        ),
      ),
    );
  }
}
