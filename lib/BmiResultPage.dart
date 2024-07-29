import 'package:flutter/material.dart';

class BmiResultPage extends StatefulWidget {
  final String bmiResult;
  final String resultText;
  final String suggestion;

  const BmiResultPage({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.suggestion,
  });

  @override
  State<BmiResultPage> createState() => _BmiResultPageState();
}

class _BmiResultPageState extends State<BmiResultPage> {
  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xff1f1e33),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Your Result',
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        backgroundColor: Color(0xff1f1e33),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: deviceHeight * 0.8,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        height: deviceHeight * 0.7,
                        width: deviceWidth * 0.91,
                        color: Color(0xff2d303e),
                        padding: EdgeInsets.all(6.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              widget.resultText,
                              style: TextStyle(fontSize: 18,color: Color(0xff6d8898)),
                            ),
                            Text(
                              widget.bmiResult,
                              style: TextStyle(fontSize: 60, fontWeight: FontWeight.w600, color: Colors.white),
                            ),
                            Text(
                              widget.suggestion,
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Color(0xffb2adb8)),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: BottomAppBar(
          color: Color(0xffe04167),
          child: Center(
            child: Text(
              'RE-CALCULATE',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
