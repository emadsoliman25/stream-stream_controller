
import 'package:flutter/material.dart';
import 'ticker_controller.dart';

void main() => runApp(StreamExample() );

class StreamExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamExampleHome(),
    );
  }
}


class StreamExampleHome extends StatefulWidget {
  @override
  _StreamExampleHomeState createState() => _StreamExampleHomeState();
}

class _StreamExampleHomeState extends State<StreamExampleHome> {

  final TickerController tickerController = TickerController();

  @override
  void dispose() {
    tickerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Example"),
      ),
      body: StreamBuilder(
        stream: tickerController.tickerStream,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot){
          if(snapshot.hasError){
            return Text("error");
          }else if(!snapshot.hasData){
            return Text("error");
          }else{
            return Stack(
              children: <Widget>[
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(snapshot.data.toString(),style: TextStyle(color: Colors.lightBlue,fontSize: 32,),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          tickerController.decrement.add(snapshot.data);
                        },
                        child: CircleAvatar(
                          child: Icon(Icons.remove),
                        ),
                      ),
                      SizedBox(height: 5,),

                      GestureDetector(
                        onTap: (){
                          tickerController.increment.add(snapshot.data);
                        },
                        child: CircleAvatar(
                          child: Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        }, ),
    );
  }
}



