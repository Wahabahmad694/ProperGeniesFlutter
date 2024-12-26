class ApiResponseError {
  final String timestamp;
  final bool success;
  final dynamic data; // Use dynamic if the type is uncertain, or specify the exact type
  final ApiError? error;

  ApiResponseError({
    required this.timestamp,
    required this.success,
    this.data,
    this.error,
  });

  // Factory method to parse JSON into the model
  factory ApiResponseError.fromJson(Map<String, dynamic> json) {
    return ApiResponseError(
      timestamp: json['timestamp'],
      success: json['success'],
      data: json['data'],
      error: json['error'] != null ? ApiError.fromJson(json['error']) : null,
    );
  }

  // Method to convert the object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp,
      'success': success,
      'data': data,
      'error': error?.toJson(),
    };
  }
}

class ApiError {
  final List<String> messages;

  ApiError({required this.messages});

  // Factory method to parse JSON into the model
  factory ApiError.fromJson(Map<String, dynamic> json) {
    final messageData = json['message'];

    // Convert `message` to a List<String>, regardless of its original format
    List<String> parsedMessages;
    if (messageData is String) {
      parsedMessages = [messageData]; // Wrap the string in a list
    } else if (messageData is List) {
      parsedMessages = List<String>.from(messageData); // Convert list to List<String>
    } else {
      parsedMessages = ["Unknown error"]; // Fallback in case of unexpected format
    }

    return ApiError(messages: parsedMessages);
  }

  // Method to convert the object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'message': messages.length == 1 ? messages.first : messages, // Return string if only one message
    };
  }
}

