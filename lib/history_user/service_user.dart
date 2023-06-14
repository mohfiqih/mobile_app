import 'package:http/http.dart' as http;
import 'package:mobile_app/history_user/model_user.dart';
import 'package:mobile_app/ip/ip.dart';

class UserApi {
  Future<List<User>> getAllUser({int page = 1, int pageSize = 10}) async {
    var client = http.Client();
    var uri = Uri.parse(ip + "data-user?page=$page&pageSize=$pageSize");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return UserFromJson(json);
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
