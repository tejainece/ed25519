import 'dart:typed_data';
import 'package:ed25519_edwards/src/edwards25519.dart';
import 'package:ninja/ninja.dart';

void getPublic() {
  var A = ExtendedGroupElement();
  final v = '96d54cd4f1d71e10a1eb76125aad65219cded6a987fd0b6cc1f758417b99d20c';
  final bi = BigInt.parse(
      '96d54cd4f1d71e10a1eb76125aad65219cded6a987fd0b6cc1f758417b99d20c',
      radix: 16);
  print(bi.bitLength);
  var hBytes = Uint8List.fromList(bi.asBytes(outLen: 32).toList());
  GeScalarMultBase(A, hBytes);
  var publicKeyBytes = Uint8List(32);
  A.ToBytes(publicKeyBytes);
  print(publicKeyBytes.toHex);
}

void main() {
  /*
  final bi = BigInt.parse(
      'deefd263cbfed62a3711dd133df3ccbd1c4dc4aac21d7405fd667498bf8ebaa1',
      radix: 16);
  final s = Uint8List.fromList(bi.asBytes(outLen: 32).reversed.toList());
  final out = Uint8List(32);
  ScReduce(out, s);
  print(out.toHex);
   */

  getPublic();
}
