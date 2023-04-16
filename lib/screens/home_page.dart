import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();

  var result = "";

  var bgColor = Colors.indigo.shade100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Text(
              "BMI Calculator",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "BMI Index",
              style: TextStyle(
                color: Colors.purpleAccent,
                fontSize: 25,
              ),
            ),
            TextField(
              controller: wtController,
              decoration: const InputDecoration(
                label: Text("Enter your weight(Kg)"),
                prefixIcon: Icon(Icons.line_weight),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 11,
            ),
            TextField(
              controller: ftController,
              decoration: const InputDecoration(
                label: Text("Enter your height(ft)"),
                prefixIcon: Icon(Icons.height_sharp),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 11,
            ),
            TextField(
              controller: inchController,
              decoration: const InputDecoration(
                label: Text("Enter your height(inch)"),
                prefixIcon: Icon(Icons.height),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                var wt = wtController.text.toString();
                var ft = ftController.text.toString();
                var inch = ftController.text.toString();

                if (wt != "" && ft != "" && inch != "") {
                  var iWt = int.parse(wt);
                  var iFt = int.parse(ft);
                  var iInch = int.parse(inch);

                  var tInch = (iFt * 12) + iInch;

                  var tCm = tInch * 2.54;

                  var tM = tCm / 100;

                  var bmi = iWt / (tM * tM);

                  var msg = "";

                  if(bmi>25){
                    msg = "You're OverWeight";
                    bgColor = Colors.orange.shade200;
                  }

                  else if(bmi<18){
                    msg = "You're underweight";
                    bgColor = Colors.red.shade200;
                  }
                  else{
                    msg = "You're healthy";
                    bgColor = Colors.green.shade200;
                  }

                  setState(() {
                    result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                  });
                } else {
                  setState(() {
                    result = "Please fill the required fields";
                  });
                }
              },
              child: const Text(
                "Calculate",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Text(
              result,
              style: const TextStyle(fontSize: 20, color: Colors.redAccent),
            )
          ],
        ),
      ),
    );
  }
}
