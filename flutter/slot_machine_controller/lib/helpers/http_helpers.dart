import 'package:http/http.dart';

void throwIfNotOk(Response response) {
  if (response.statusCode >= 400) {
    throw Exception('HttpException ${response.statusCode}: ${response.body}.');
  }
}
