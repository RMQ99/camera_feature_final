import 'dart:convert';
import 'dart:typed_data';

Uint8List encryptText(Encoding codec, String text) {
  final encoded = codec.encode(text);
  for (int i = 0; i < encoded.length; i++) {
    // );
  }
  return Uint8List.fromList(encoded);
}
