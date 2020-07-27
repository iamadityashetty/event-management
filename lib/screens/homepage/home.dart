import 'package:event_management/reusableComponents/event_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/events.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  EventsProvider eventsProvider;

  @override
  void initState() {
    eventsProvider = Provider.of<EventsProvider>(context, listen: false);
    getData();
    super.initState();
  }

  Future<void> getData() async {
    print("get data called");

    eventsProvider.getAllEvents();
  }

  @override
  Widget build(BuildContext context) {
    print("homepage");
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: EventCard(),
        ),
      ),
    );
  }
}
