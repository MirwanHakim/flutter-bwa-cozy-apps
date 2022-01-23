import 'package:bwa_cozy/models/space.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  getRecommendedSpace() async {
    var url = Uri.https('bwa-cozy.herokuapp.com', '/recommended-spaces');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      List data = convert.jsonDecode(response.body);
      List<Space> spaces = data.map((e) => Space.fromJson(e)).toList();
      return spaces;
    } else {
      return <Space>[];
    }
  }
}
