import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hitung IPK'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controllerSks1 = TextEditingController();
  TextEditingController controllerNilai1 = TextEditingController();

  TextEditingController controllerSks2 = TextEditingController();
  TextEditingController controllerNilai2 = TextEditingController();

  TextEditingController controllerSks3 = TextEditingController();
  TextEditingController controllerNilai3 = TextEditingController();

  double ipk = 0.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildMataKuliahInput( controllerSks1, controllerNilai1),
          buildMataKuliahInput(controllerSks2, controllerNilai2),
          buildMataKuliahInput(controllerSks3, controllerNilai3),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              calculateIPK();
            },
            child: Text('Hitung IPK'),
          ),
          SizedBox(height: 16.0),
          Text(
            'IPK: $ipk',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildMataKuliahInput(
    
    TextEditingController controllerSks,
    TextEditingController controllerNilai,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controllerSks,
          decoration: InputDecoration(labelText: 'SKS'),
          keyboardType: TextInputType.number,
        ),
        TextField(
          controller: controllerNilai,
          decoration: InputDecoration(labelText: 'Nilai'),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  void calculateIPK() {
    int sks1 = int.tryParse(controllerSks1.text) ?? 0;
    double nilai1 = getBobotNilai(controllerNilai1.text);

    int sks2 = int.tryParse(controllerSks2.text) ?? 0;
    double nilai2 = getBobotNilai(controllerNilai2.text);

    int sks3 = int.tryParse(controllerSks3.text) ?? 0;
    double nilai3 = getBobotNilai(controllerNilai3.text);

    int totalSks = sks1 + sks2 + sks3;

    if (totalSks > 0) {
      double totalBobot = (sks1 * nilai1 + sks2 * nilai2 + sks3 * nilai3) / totalSks;
      setState(() {
        ipk = totalBobot;
      });
    } else {
      setState(() {
        ipk = 0.0;
      });
    }
  }

  double getBobotNilai(String nilai) {
    switch (nilai) {
      case 'A':
        return 4.0;
      case 'AB':
        return 3.5;
      case 'B':
        return 3.0;
      case 'BC':
        return 2.5;
      case 'C':
        return 2.0;
      case 'D':
        return 1.0;
      case 'E':
        return 1.0;
      default:
        return 0.0;
    }
  }
}
