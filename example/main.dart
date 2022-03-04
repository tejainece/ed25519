import 'dart:convert';
import 'dart:typed_data';
import 'package:ninja/ninja.dart';

import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;

void main() {
  signAndVerify();
}

void signAndVerify() {
  var keyPair = ed.generateKey();
  var privateKey = keyPair.privateKey;
  var publicKey = keyPair.publicKey;
  print(privateKey.bytes);
  print(publicKey.bytes);
  print(privateKey.bytes.sublist(0, 32).toList().asBigInt.toRadixString(16));
  print(publicKey.bytes.toList().asBigInt.toRadixString(16));
  var message = utf8.encode('test message');
  var sig = ed.sign(privateKey, message as Uint8List);
  var result = ed.verify(publicKey, message, sig);
  assert(result == true);

  var wrongMessage = utf8.encode('wrong message');
  var wrongResult = ed.verify(publicKey, wrongMessage as Uint8List, sig);
  assert(wrongResult == false);
}
