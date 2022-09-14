import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testblock/bussines_logic/counter_cubit.dart';
import 'package:testblock/bussines_logic/counter_state.dart';
import 'package:testblock/pressentation/screens/Home_Screen.dart';
import 'package:testblock/pressentation/screens/Second_Screen.dart';
import 'package:testblock/pressentation/screens/Third_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Counter_cubit _counter_cubit = Counter_cubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<Counter_cubit>(
      create: (context) => Counter_cubit(),
       child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      routes: {
        '/' : (context) => BlocProvider.value(
             value: _counter_cubit ,
             child:  MyHomeScreen(
               title: "HomeScreen",
             ),

        ),
        '/second' : (context) => BlocProvider.value(
          value: _counter_cubit ,
          child:  SecondScreen(
            title: "SecondScreen",
          ),

        ),
        '/third' : (context) => BlocProvider.value(
          value: _counter_cubit ,
          child:  ThirdScreen(
            title: "TirrdScreen",
          ),

        ),

      },


     ));

  }
  dispose(){
    _counter_cubit.close();
    super.dispose();
  }
}

