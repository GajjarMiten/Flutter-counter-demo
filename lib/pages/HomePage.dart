import 'package:flutter/material.dart';
import 'package:fluttercounter/components/Navbar.dart';
import 'package:fluttercounter/pages/CounterPage.dart';
import 'package:fluttercounter/services/Counter.service.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _controller = PageController(initialPage: 0);
  final CounterService _counterService = GetIt.I<CounterService>();

  void _changePage(int index) {
    _controller.animateToPage(index,
        duration: Duration(milliseconds: 700), curve: Curves.linear);
  }

  final List<String> counters = [
    "counter_1",
    "counter_2",
    "counter_3",
  ];

  void incrementCurrentCounter() {
    _counterService.increment(counters[_controller.page!.toInt()]);
  }

  void resetAllCounters() {
    counters.forEach((id) {
      _counterService.reset(id);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter example app'),
        actions: [
          IconButton(
            onPressed: resetAllCounters,
            icon: const Tooltip(
              message: "Reset all counters",
              child: Icon(Icons.restore_rounded),
            ),
          )
        ],
      ),
      body: PageView.builder(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return CounterPage(
            id: counters[index],
          );
        },
        itemCount: counters.length,
      ),
      floatingActionButton: Tooltip(
        message: "Increment current Counter",
        child: FloatingActionButton(
          onPressed: incrementCurrentCounter,
          child: const Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: MyNavbar(
        onPressed: _changePage,
      ),
    );
  }
}
