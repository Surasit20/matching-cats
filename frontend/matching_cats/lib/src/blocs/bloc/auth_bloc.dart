import 'package:bloc/bloc.dart';
import 'package:matching_cats/src/blocs/bloc/auth_event.dart';
import 'package:matching_cats/src/blocs/bloc/auth_state.dart';
import 'package:meta/meta.dart';
import '../../repository/auth_repo.dart';
import 'package:http/http.dart' as http;

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  AuthBloc(super.initialState);

/*
  void _onRegister(RegisterButtonPressed event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());
    var url = Uri.https('http://localhost:4000/', 'users/register');
    var res = await http.post(url, body: {
      "name": "lnw1",
      "email": "123@gmail.com",
      "password": "testeryrt"
    });

    print(res);
  }
*/
/*
   AuthBloc(
    AuthState initialSate,
  ) : super(initialSate) {
    AuthRepository repo;

    on<RegisterButtonPressed>((event, emit) {
      emit(repo.register(event.email, event.password));
    });
  }


   on((event, emit) => {
      
    });
  }

*/

}
