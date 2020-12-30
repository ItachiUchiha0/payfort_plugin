import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import 'auth_key_response.dart';

Future<GetAuthKeyResponse> getAuthKey(String deviceID,int userID) async {

  final response = await get("http://18.157.167.102:7080/api/GetAuthKey?deviceID=$deviceID&customerId=$userID");
  debugPrint(response.body.toString());
  if (response.statusCode == 200) {
    return GetAuthKeyResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load packages');
  }
}
