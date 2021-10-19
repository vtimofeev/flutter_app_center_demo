import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  Timer? _timer;


  @override
  void initState() {
    _timer = Timer.periodic(const Duration(milliseconds: 20), _onTimer);
  }


  @override
  void dispose() {
    _timer?.cancel();
  }

  void _onTimer(Timer timer) {
    setState(() {
      _counter++;
    });
  }


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            TappableTravelDestinationItem(key: Key('1'), child: Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            )),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}


class TappableTravelDestinationItem extends StatelessWidget {
  const TappableTravelDestinationItem({Key key = const Key('tappable'), this.child}) : super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final Widget? child;
  static const height = 298.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
        color: Color.fromRGBO(200, 80, 25, 1.0),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              SectionTitle(title: 'Title1'),
              SizedBox(
                height: height,
                child: Card(
                  // This ensures that the Card's children (including the ink splash) are clipped correctly.
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    // Generally, material cards use onSurface with 12% opacity for the pressed state.
                    splashColor:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                    // Generally, material cards do not have a highlight overlay.
                    highlightColor: Colors.transparent,
                    child: this.child,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({Key? key, this.title = '',}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: Theme
            .of(context)
            .textTheme
            .subtitle1),
      ),
    );
  }
}