import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testblock/bussines_logic/counter_cubit.dart';
import 'package:testblock/bussines_logic/counter_state.dart';
class SecondScreen extends StatefulWidget {
  SecondScreen ({Key key, this.title ,   }) : super(key: key);

  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SecondScreen > {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: BlocListener<Counter_cubit , Counter_State>(
        listener: (context , state){
          if(state.waschange==true){
            Scaffold.of(context).showSnackBar(SnackBar(content:Text("Incremaent"),duration : Duration(milliseconds: 300),),);
          } else if (state.waschange==false){
            Scaffold.of(context).showSnackBar(SnackBar(content:Text("decremaent"),duration : Duration(milliseconds: 300),),);
          }
        },

        child : Container(
          color: Colors.greenAccent,
          child: Center(

            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                BlocBuilder<Counter_cubit, Counter_State>(

                    builder: (context , state) {
                      return Text(
                        state.counterValue.toString(),
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline4,
                      );
                    }
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      onPressed: (){
                        BlocProvider.of<Counter_cubit>(context).incrementState();

                      },
                      tooltip: 'Increment',
                      child: Icon(Icons.add),
                    ),
                    FloatingActionButton(
                      onPressed: (){
                        BlocProvider.of<Counter_cubit>(context).decrementState();
                      },
                      tooltip: 'decrement',
                      child: Icon(Icons.remove),
                    ),


                  ],
                ),

              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
