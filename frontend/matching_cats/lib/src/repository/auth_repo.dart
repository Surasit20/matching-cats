import 'package:http/http.dart' as http;

class AuthRepository {
  register(String email, String password) async {
    var url =
        Uri.https('htsdfsdfsdftp://localhost:4000/dfgdfgdfg', 'users/register');
    var res = await http.post(url, body: {
      "name": "lnw1",
      "email": "123@gmail.com",
      "password": "testeryrt"
    });

    print(res);
  }
}
