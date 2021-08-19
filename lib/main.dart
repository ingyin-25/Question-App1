import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizbrain.dart';
import 'package:flutter/cupertino.dart';


void main() {
  runApp(App1());
  }

class MyAlert extends StatefulWidget {
  const MyAlert({ Key? key }) : super(key: key);

  @override
  _MyAlertState createState() => _MyAlertState();
}

class _MyAlertState extends State<MyAlert> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exam Result'),
        ),
        body: PopupDialog(),
      ),
    );
  }
}//Class-MyAlert

class PopupDialog extends StatefulWidget {
  @override
  _PopupDialogState createState() => _PopupDialogState();
}

class _PopupDialogState extends State<PopupDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: Text(
                    'Your score is Good',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ),
              ),
            ),

            ElevatedButton(
              child: Text('Next'),
              onPressed: () => _onBasicAlertPressed(context),
            ),
          ],
        ),
      ),
    );
  }
}
    _onBasicAlertPressed(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "You are finished 6-questions",
      desc: "Want to Again?",
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => runApp(App1()),
          width: 120,
        )
      ],
    ).show();
  }

Widget fadeAlertAnimation(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return Align(
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
  

class App1 extends StatefulWidget {
  @override
  _App1State createState() => _App1State();
}

Quizbrain quizbrain=new Quizbrain();

class _App1State extends State<App1> {

  List<Icon> scorekeeper=[];
  void addscore(bool scoretype) {
    if (quizbrain.getAnswer()==scoretype) {
        scorekeeper.add(Icon(Icons.check_circle_outline,color: Colors.green,),);
    } 
    else {
          scorekeeper.add(Icon(Icons.highlight_off,color: Colors.red,),);
    }
    setState(() {quizbrain.next();});
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Click..Click..Click.."),
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        quizbrain.getQuestion(),
                        style: TextStyle(color: Colors.black, fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black12),),
                      child: Text('True',style: TextStyle(color: Colors.black, fontSize: 20,),),
                      onPressed:(){addscore(true);}
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black12),
                      ),
                      child: Text(
                        'False', style: 
                        TextStyle(
                          color: Colors.black, fontSize: 20,
                        ),
                      ),
                    onPressed:(){addscore(false);}
                    ),
                  ),
                ),
                Row(
                  children: scorekeeper,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



