import 'package:flutter/material.dart';
import 'package:fluttercounter/services/Counter.service.dart';
import 'package:get_it/get_it.dart';

class CounterPage extends StatefulWidget {
  final String id;
  const CounterPage({Key? key, required this.id}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final CounterService _counterService = GetIt.I<CounterService>();

  void increment() {
    _counterService.increment(widget.id);
  }

  void decrement() {
    _counterService.decrement(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${widget.id} state",
            style: TextStyle(fontSize: 28),
          ),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder(
            stream: _counterService.getCount(widget.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error");
              } else if (snapshot.connectionState == ConnectionState.active) {
                return Text(
                  snapshot.data.toString(),
                  style: TextStyle(fontSize: 24),
                );
              } else {
                return Text("Not Connected");
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size>(
                Size(100, 50),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.blue,
              ),
              padding: MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.all(10),
              ),
            ),
            onPressed: increment,
            child: Text("Increment Me!",
                style: TextStyle(fontSize: 24, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
