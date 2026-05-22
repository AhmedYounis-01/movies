import 'package:movies_app/core/network/error_msg_model.dart';

class ServerException implements Exception {
  final ErrorMsgModel errorMsgModel;

  ServerException({required this.errorMsgModel});
}
