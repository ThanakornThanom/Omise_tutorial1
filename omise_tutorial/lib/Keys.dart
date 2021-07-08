import 'dart:convert';
import 'dart:core';

var codec = latin1.fuse(base64);
var publickey = "pkey_test_5ofea65ygsuh4uqvrsw";
var skKey = "skey_test_5ofea6wkse1uev94fiq";
var hashedKey = codec.encode(publickey);

var hashedKey2 = codec.encode("skey_test_5ofea6wkse1uev94fiq");
