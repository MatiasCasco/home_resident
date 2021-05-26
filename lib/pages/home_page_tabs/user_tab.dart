import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_resident/api/account_api.dart';
import 'package:home_resident/models/recover_cuestionary_list.dart';
import 'package:home_resident/pages/splash_page_get.dart';
import 'package:home_resident/pages/welcome_ranking.dart';
import 'package:shimmer/shimmer.dart';

import '../ranking_page.dart';

class UserTab extends StatefulWidget {
  String nameCurso;

  UserTab({this.nameCurso});

  @override
  _UserTabState createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
 /*
  List<dynamic> _users = [];
  AccountAPI _accountAPI = AccountAPI();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() async {
    final users = await _accountAPI.getUsers(2);
    setState(() {
      _users.addAll(users);
      _isLoading = false;
    });
  }

  Widget _shimmer() {
    return Container(
      height: 120,
      child: ListView.builder(
        itemBuilder: (_, index) {
          return Shimmer(
              period: Duration(seconds: 2),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      height: 13,
                      width: 50,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              gradient: LinearGradient(colors: [Colors.white, Colors.grey]));
        },
        itemCount: 7,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
*/

  //RecoverCuestionaryList recover = Get.put(RecoverCuestionaryList());
  /*Future<void> cargaRanking() async {
    await Future.delayed(Duration(seconds: 3));
  }*/
  String nameCurso;
  @override
  Widget build(BuildContext context) {

    print("user");
    return WelcomeRanking(nameCurso: nameCurso,);
    //return Ranking();
    /*return ListView(
      children: [
        _isLoading
            ? _shimmer()
            : Container(
                height: 150,
                child: ListView.builder(
                  itemBuilder: (_, index) {
                    final dynamic item = _users[index];
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minWidth: 80),
                          child: Column(
                            children: [
                              Expanded(
                                  child: ClipOval(
                                child: Image.network(item['avatar']),
                              )),
                              Text(item['first_name']),
                            ],
                          ),
                        ));
                  },
                  itemCount: _users.length,
                  scrollDirection: Axis.horizontal,
                ),
              )
      ],
    );*/
  }

  @override
  void initState() {
    nameCurso = widget.nameCurso;
    /*Future<void> cargaRanking() async {
      await Future.delayed(Duration(seconds: 3));
    }
    recover.loadRanking(77);
    Get.to(SplashPageGet(), arguments: {"Page":"WelcomeRanking", "Curso": idCurso});*/
  }
}
