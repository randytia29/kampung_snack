import 'dart:ui';

class ColorManager {
  static Color primary = HexColor.fromHex('#26A69A');
  static Color white = HexColor.fromHex('#FFFFFF');
  static Color grey = HexColor.fromHex('#D9D9D9');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString';
    }

    return Color(int.parse(hexColorString, radix: 16));
  }
}
