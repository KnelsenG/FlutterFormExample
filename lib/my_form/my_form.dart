import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myformexample/my_form/bloc/form_bloc.dart';
import 'package:myformexample/my_form/bloc/form_event.dart';
import 'package:myformexample/my_form/bloc/form_state.dart';
class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  FormBloc _bloc;

  final _field1 = TextEditingController();
  final _field2 = TextEditingController();
  final _field3 = TextEditingController();
  final _field4 = TextEditingController();

  @override
  void initState() {
    super.initState();

    _field1.addListener(_field1Changed);
    _field2.addListener(_field2Changed);
    _field3.addListener(_field3Changed);
    _field4.addListener(_field4Changed);

    _bloc = BlocProvider.of<FormBloc>(context);

    _bloc.add(FormInit());
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
    return BlocListener<FormBloc, MyFormState>(
      condition: (prev, current) => current is FormLoaded,
      listener: (BuildContext context, state) {
        if (state is FormLoaded) {
          _field1.text = state.field1;
          _field2.text = state.field2;
          _field3.text = state.field3;
          _field4.text = state.field4;
        }
      },
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              _buildInput(
                hint: "Field 1 Hint",
                controller: _field1,
              ),
              SizedBox(height: 34),
              _buildInput(
                hint: "Field 2 Hint",
                controller: _field2,
              ),
              SizedBox(height: 34),
              _buildInput(
                hint: "Field 3 Hint",
                controller: _field3,
              ),
              SizedBox(height: 34),
              _buildInput(
                hint: "Field 4 Hint",
                controller: _field4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInput({String hint, TextEditingController controller}) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildGap(),
          TextFormField(
            decoration: InputDecoration(hintText: hint),
            controller: controller,
            keyboardType: TextInputType.multiline,
          ),
        ]);
  }

  Widget _buildGap() {
    return Container(
      decoration: BoxDecoration(color: Colors.blue),
      height: 200,
    );
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
