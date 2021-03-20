import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_resident/pages/reto/pregunta/quiz.dart';
import 'package:home_resident/widget/bottom_menu.dart';
import 'package:home_resident/widget/my_page_view.dart';
import 'home_page_tabs/ajuste_tab.dart';
import 'home_page_tabs/historial_tab.dart';
import 'home_page_tabs/menu_tab.dart';
import 'home_page_tabs/user_tab.dart';

class HomePage extends StatefulWidget {
  static final routeName = "homePaee";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentPage = 0;
  final _menu =  [ // Lista precargada
    BottomMenuItem(iconPath: "assets/icons/menu.svg", label: "Incio", content: MenuTab()),
    BottomMenuItem(iconPath: "assets/icons/history.svg", label: "Historial", content: HistorialTab()),
    BottomMenuItem(iconPath: "assets/icons/user.svg", label: "Usuarios", content: UserTab()),
    BottomMenuItem(iconPath: "assets/icons/adjust.svg", label: "Ajuste", content: AjusteTab())
  ];


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ver si no es mejor cambiar con el myAppBar
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Home Resident"),
        iconTheme: IconThemeData(color: Colors.black87),
        leading: IconButton(icon: Icon(Icons.menu), onPressed: (){}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.send),
              onPressed: (){
                //final route = MaterialPageRoute(builder: (BuildContext _)=>ChatPage(name: "Matias Casco",));
                final route = MaterialPageRoute(builder: (BuildContext _)=>Quiz());
                Navigator.push(context, route);
              }),
          IconButton(icon: Icon(Icons.more_vert), onPressed: (){
            //Navigator.pushNamed(context, PostPage2.routeName);
          })
        ],
      ),

      bottomNavigationBar: BottomMenu(
        currentPage: _currentPage,
        onChanged: (int newCurrentPage){
          setState(() {
            _currentPage = newCurrentPage;
          });
        },
        items: _menu,),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: MyPageView(
                children: _menu.map<Widget>((item)=> item.content).toList(),
                currentPage: _currentPage, ),
            ),
          ],
        ),
      ),
    );
  }
}
