import 'package:equatable/equatable.dart';

class ErrorMsgModel extends Equatable {
  final String statusMessage;
  final int statusCode;
  final bool success;

  const ErrorMsgModel({
    required this.statusMessage,
    required this.statusCode,
    required this.success,
  });

  factory ErrorMsgModel.fromJson(Map<String, dynamic> json) {
    return ErrorMsgModel(
      statusMessage: json['status_message'],
      statusCode: json['status_code'],
      success: json['success'],
    );
  }

  @override
  List<Object?> get props => [statusMessage, statusCode, success];
}
