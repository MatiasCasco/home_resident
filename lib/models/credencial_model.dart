import 'package:home_resident/api/account_api.dart';

class Credencial {
  AccountApi _accountAPI = AccountApi();
  Map<String, dynamic> _data;
  Map<String, dynamic> get data => this._data;

  Future<void> loadData(String email, String pass) async {
    print("Carga datos");
    final _datos = await _accountAPI.dataUser(email, pass);
    _data = _datos;
    print(_data);
    //this._loading = false;
  }

  Future<void> loadUpdatePass(int id,String passwordOld, String passwordNew) async {
    print("response update password");
    final _datos = await _accountAPI.updatePassword(id, passwordOld, passwordNew);
    _data = _datos;
    print(_data);
    //this._loading = false;
  }
}