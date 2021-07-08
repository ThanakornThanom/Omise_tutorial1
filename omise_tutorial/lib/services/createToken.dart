import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import '../Keys.dart';
import 'package:omise_flutter/omise_flutter.dart';

Future<void> createToken(String name, String cardNumber, String month,
    String year, String securityCode) async {
  var bytes = utf8.encode("$cardNumber"); // data being hashed

  var digest = sha1.convert(bytes);
  print(digest.toString());

  OmiseFlutter omise = OmiseFlutter(publickey);
  final response2 =
      await omise.token.create(name, cardNumber, month, year, securityCode);
  try {
    http.Response response = await http.post(
        Uri.parse("https://api.omise.co/charges"),
        headers: {
          'Content-Type': 'application/json',
          HttpHeaders.authorizationHeader: "Basic $hashedKey2",
        },
        body: jsonEncode(
            {'amount': '1999999', 'currency': 'THB', 'card': response2.id}));
    print(response.statusCode);
    print(response.headers);
    log(jsonDecode(response.body).toString());
    log(response2.id);
  } catch (e) {
    throw e;
  }
}
