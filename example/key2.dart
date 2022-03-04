import 'dart:convert';
import 'dart:typed_data';

import 'package:ed25519_edwards/ed25519_edwards.dart';

void main() {
  final key = base64.decode('EIKfPPFkqu9BRtpHq5kg7nqVRjyXDZiksxWq3gFcOh5Q3qQNqlsPhFLz4blZv7usf6MmJErzn5ONz0U2xEu2Jw==');
  final pv = PrivateKey(key);
  final msg = 'test message';
  final v = base64.encode(sign(pv, Uint8List.fromList(msg.codeUnits)));
  print(v);
}