import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_bloc/app.dart';
import 'package:state_bloc/general_observer.dart';

void main() {
  Bloc.observer = MyObserver();
  runApp(const MyApp());
}


