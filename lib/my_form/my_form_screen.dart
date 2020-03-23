import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/form_bloc.dart';
import 'my_form.dart';

class MyFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FormBloc>(
      create: (BuildContext context) {
        return FormBloc();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Form Example"),
        ),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            ListView(
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                _buildGap(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      _buildGap(),
                      MyForm(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGap() {
    return Container(
      decoration: BoxDecoration(color: Colors.blue),
      height: 100,
    );
  }
}
