import 'package:flutter_bloc/flutter_bloc.dart';

import 'form_event.dart';
import 'form_state.dart';

class FormBloc extends Bloc<FormEvent, MyFormState> {
  MyFormState get initialState => FormInitial();

  @override
  Stream<MyFormState> mapEventToState(event) async* {
    if (event is FormInit) {
      await Future.delayed(Duration(seconds: 2));
      yield FormLoaded.copyForm(
        state.copyWith(
          field1: "New Content",
          field2: "More New Content",
          field3: "Alot More New Content",
          field4: "Way Too Much New Content",
        ),
      );
    }
  }
}
