import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Form Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _field1 = TextEditingController();
  final _field2 = TextEditingController();
  final _field3 = TextEditingController();
  final _field4 = TextEditingController();

  @override
  void initState() {
    super.initState();

    loadData();

    _field1.addListener(_field1Changed);
    _field2.addListener(_field2Changed);
    _field3.addListener(_field3Changed);
    _field4.addListener(_field4Changed);
  }

  @override
  void dispose() {
    super.dispose();
    _field1.dispose();
    _field2.dispose();
    _field3.dispose();
    _field4.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Example"),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(hintText: "Field 1 Hint"),
                controller: _field1,
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              _buildGap(),
              TextFormField(
                decoration: InputDecoration(hintText: "Field 2 Hint"),
                controller: _field2,
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              _buildGap(),
              TextFormField(
                decoration: InputDecoration(hintText: "Field 3 Hint"),
                controller: _field3,
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              _buildGap(),
              TextFormField(
                decoration: InputDecoration(hintText: "Field 4 Hint"),
                controller: _field4,
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGap() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.red),
          height: 150,
        ),
        Container(
          decoration: BoxDecoration(color: Colors.green),
          height: 100,
        ),
        Container(
          decoration: BoxDecoration(color: Colors.blue),
          height: 150,
        ),
      ],
    );
  }

  void loadData() async {
    await Future.delayed(Duration(seconds: 3));

    _field1.text = "New Text\n\nAnother Line\n\nand another line";
    _field2.text = "Also New Text";
    _field3.text = "More New Text\n\nAnother Line\n\nand another line";
    _field4.text = "Even More New Text";
  }

  void _field1Changed() {
    // save changes
  }

  void _field2Changed() {
    //save changes
  }

  void _field3Changed() {
    //save changes
  }

  void _field4Changed() {
    //save changes
  }
}
