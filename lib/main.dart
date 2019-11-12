import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
//  SystemChrome.setPreferredOrientations([
//  DeviceOrientation.portraitUp,
//    DeviceOrientation.landscapeLeft,
//    DeviceOrientation.portraitDown
//  ]);
print('yessss');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceInfo = MediaQuery.of(context).size;
//    print('size: ${deviceInfo.size}');
//    print('padding: ${deviceInfo.padding}');
    var bar = AppBar(
      title: Text(widget.title),
    );
    return Scaffold(
      appBar: bar,
      body: Center(
        child: ListView(
//          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: deviceInfo.width,
              height: (deviceInfo.height -
                      bar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  .4,
//              color: Colors.red,
              child: LayoutBuilder(builder: (ctx, c) {
                return SizedBox(
                  width: c.maxWidth * .5,
                  height: c.maxHeight * .5,
//                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(80.0),
                    child: Container(
                      color: Colors.green,
                      child: Text(
                        'You have pushed the button this many times:',
                      ),
                    ),
                  ),
                );
              }),
            ),
            Container(
              width: deviceInfo.width,
              height: (deviceInfo.height -
                      bar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  .6,
              color: Colors.blue,
              child: Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
