import 'dart:ui';

var appColorBlack = HexColor.fromHex('#2E2739');
var appColorGrey = HexColor.fromHex('#827D88');
var appColorBlue = HexColor.fromHex('#61C3F2');
var appColorDarkBlue = HexColor.fromHex('#15D2BC');
var appColorLightGrey = HexColor.fromHex('#DBDBDF');
var appColorPink = HexColor.fromHex('#E26CA5');
var appColorPurple = HexColor.fromHex('#564CA3');
var appColorYellow = HexColor.fromHex('#CD9D0F');
var appColorWhite = HexColor.fromHex('#F6F6FA');


extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
