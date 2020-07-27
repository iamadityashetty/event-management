import 'dart:io';

import 'package:flutter/foundation.dart';
// import 'package:headstrait_digital_banking/utils/secure_storage.dart';
import 'package:http/http.dart' as http;
// import 'package:event-management/config.dart';
import 'dart:convert';
// import '../app_config/app_config.dart';

final String uri = 'http://192.168.1.104:5000/api/events/';

class EventsProvider extends ChangeNotifier {
  Map<String, dynamic> eventsData = {},
      error = {},
      accountData = {},
      response = {};
  int statusCode;

//TO CREATE A NEW CARD

  //get a new card
  getAllEvents() async {
    print("get provider getAllEvents ");
    print(uri);
    await http
        .get(
      uri + 'all-events',
    )
        .then((val) {
      if (val.statusCode == 200) {
        eventsData['allEvents'] = json.decode(val.body);
        print(eventsData['get']);
      }
      notifyListeners();
    }).catchError((err) {
      print('Error : $err');
    });
  }

  eventDetail(String key, dynamic val) {
    eventsData[key] = val;

    notifyListeners();
  }
}
