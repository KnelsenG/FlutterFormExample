import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MyFormState extends Equatable {
  final String field1, field2, field3, field4;

  MyFormState({
    @required this.field1,
    @required this.field2,
    @required this.field3,
    @required this.field4,
  });

  MyFormState copyWith({
    field1,
    field2,
    field3,
    field4,
  }) {
    return MyFormState(
      field1: field1 ?? this.field1,
      field2: field2 ?? this.field2,
      field3: field3 ?? this.field3,
      field4: field4 ?? this.field4,
    );
  }

  List get props => [
        field1,
        field2,
        field3,
        field4,
      ];
}

class FormInitial extends MyFormState {
  FormInitial() : super(field1: "", field2: "", field3: "", field4: "");
}

class FormLoaded extends MyFormState {
  FormLoaded.copyForm(MyFormState parent)
      : super(
          field1: parent.field1,
          field2: parent.field2,
          field3: parent.field3,
          field4: parent.field4,
        );
}
