import 'package:flutter/material.dart';
import 'package:minimalist_state_management/features/counter/widgets/appbar_icon.dart';
import 'package:minimalist_state_management/features/counter/counter_state.dart';
import 'package:minimalist_state_management/features/post_list_view/list_view_state.dart';
import 'package:minimalist_state_management/models/post.dart';
import 'package:minimalist_state_management/services/service_locator.dart';
import 'package:minimalist_state_management/features/post_list_view/list_view_container.dart';

import 'features/counter/counter_text.dart';

void main() {
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Post postToAdd = const Post(
    userId: 99,
    id: 99,
    title: "Kara Kartal",
    body: "dadfafasdfafadfasdfadfadf",
  );


  @override
  void initState() {
    super.initState();

    final state = getIt.get<CounterState>();
    state.counter.addListener(() {
      // sayac degeri 0dan buyuk ve 10unkati ise
      // flutter dialog goster ve kullanicidan onay iste
      if (state.counter.value % 10 == 0 && state.counter.value > 0) {
        _showMyDialog();
      }
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Continue'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Reset'),
              onPressed: () {
                Navigator.of(context).pop();
                final state = getIt.get<CounterState>();
                // state.counter.value == 0;
                state.resetCounter();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: const [AppbarIcon()],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            const CounterText(),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      final state = getIt.get<CounterState>();
                      state.decrementCounter();
                    },
                    child: const Icon(Icons.remove)),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      final state = getIt.get<CounterState>();
                      state.incrementCounter();
                    },
                    child: const Icon(Icons.add)),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  final state = getIt.get<CounterState>();
                  state.resetCounter();
                },
                child: const Icon(Icons.refresh)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child:const ListViewContainer(),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {

        getIt.get<ListViewState>().postsNotifier.addPostTapped(postToAdd);

      },
      child: const Icon(Icons.add),

      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
