import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventCard extends StatefulWidget {
  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    final Widget favourites = SvgPicture.asset('images/favourites.svg');
    final Widget location = SvgPicture.asset('images/location.svg');
    final Widget calendar = SvgPicture.asset('images/calendar.svg');

    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          height: 150,
          color: Colors.red,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[Text('Dance Party'), favourites],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Text(
                        'All those crazy people who want to loosen up and just have some fun. Come lets dance and forget the world.'),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[calendar, Text("26, July,2020")],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      location,
                      Text('Denver, Colorado'),
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}
