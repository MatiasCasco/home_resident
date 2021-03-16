import 'package:flutter/material.dart';
import 'package:home_resident/api/account_api.dart';
import 'package:shimmer/shimmer.dart';

class UserTab extends StatefulWidget {
  @override
  _UserTabState createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
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

  @override
  Widget build(BuildContext context) {
    //return Container();
    print("user");
    return ListView(
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
    );
  }
}
