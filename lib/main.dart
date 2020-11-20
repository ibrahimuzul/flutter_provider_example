import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  String message = "Goodbye";
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      //      <--- ChangeNotifierProvider
      create: (context) => MyModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Provider Example')),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.red[200],
                  child: Consumer<MyModel>(
                    //                  <--- Consumer
                    builder: (context, myModel, child) {
                      return Column(children: [
                        TextField(
                          controller: myController,
                        ),
                      ]);
                    },
                  )),
              Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.green[200],
                  child: Consumer<MyModel>(
                    //                  <--- Consumer
                    builder: (context, myModel, child) {
                      return Column(children: [
                        RaisedButton(
                          child: Text("Press "+myModel.counter.toString()),
                          onPressed: () {
                            myModel.doSomething(myController.text);
                          },
                        ),
                      ]);
                    },
                  )),
              Container(
                padding: const EdgeInsets.all(35),
                color: Colors.blue[200],
                child: Consumer<MyModel>(
                  //                    <--- Consumer
                  builder: (context, myModel, child) {
                    return Column(
                      children: [
                        Text(myModel.someValue),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyModel with ChangeNotifier {
  //                          <--- MyModel
  String someValue = '';
  int counter = 0;

  void doSomething(String message) {
    someValue = message + counter.toString();
    counter++;
    print(someValue);
    notifyListeners();
  }
}
