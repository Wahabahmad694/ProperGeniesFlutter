import 'package:flutter/services.dart';


extension GetSvgPath on String {
  String get toSvgPath => 'assets/svg/$this.svg';
  String get toPngPath => 'assets/images/$this.png';
  String get toPNGPath => 'assets/images/$this.PNG';
  String get toBottomNavPath => 'assets/svg/bottomNav/$this.svg';
  String get toCoinsIconPath => 'assets/svg/icons/$this.svg';
  String get toAnimationPath => 'assets/animation/$this.json';

}


class StringHelpers{
  static List<TextInputFormatter> decimalFormatter = <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,4}')),
    _DecimalTextInputFormatter(),
  ];
}
class _DecimalTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // Allow only one decimal point
    if (newValue.text.contains('.') &&
        newValue.text.indexOf('.') != newValue.text.lastIndexOf('.')) {
      return oldValue;
    }

    return newValue;
  }
}

String splitTextByLength(String text, int chunkLength) {
  List<String> chunks = [];
  for (int i = 0; i < text.length; i += chunkLength) {
    chunks.add(text.substring(i, i + chunkLength > text.length ? text.length : i + chunkLength));
  }
  return chunks.join('\n'); // Join chunks with a new line
}


String formatPrice(num price) {
  if (price >= 1000000) {
    return "${(price / 1000000).toStringAsFixed(1)}M"; // Convert to millions
  } else if (price >= 1000) {
    return "${(price / 1000).toStringAsFixed(1)}K"; // Convert to thousands
  } else {
    return price.toStringAsFixed(0); // Display as it is
  }
}

String truncateAfterThirdComma(String text) {
  // Split the text by commas
  List<String> parts = text.split(',');
  // Keep the first three parts
  if (parts.length > 3) {
    return '${parts.sublist(0, 3).join(',')}...'; // Join back with commas
  }
  return text; // Return full text if less than 3 commas
}

String truncateAfterLength(String text, int maxLength) {
  // Check if the text length exceeds the max length
  if (text.length > maxLength) {
    // Truncate and add '...' at the end
    return '${text.substring(0, maxLength)}...';
  }
  return text; // Return the full text if the length is within the limit
}