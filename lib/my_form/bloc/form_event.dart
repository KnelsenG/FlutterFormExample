import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class FormEvent extends Equatable {
  FormEvent([List props = const []]) : super(props);
}

class FormInit extends FormEvent {}

