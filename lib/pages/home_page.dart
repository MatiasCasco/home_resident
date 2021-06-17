import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_resident/models/recover_questions_list.dart';
import 'package:home_resident/pages/reto/pregunta/quiz.dart';
import 'package:home_resident/utils/connection_status.dart';
import 'package:home_resident/widget/bottom_menu.dart';
import 'package:home_resident/widget/my_page_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page_tabs/ajuste_tab.dart';
import 'home_page_tabs/historial_tab.dart';
import 'home_page_tabs/historial_tabD.dart';
import 'home_page_tabs/menu_tab.dart';
import 'home_page_tabs/user_tab.dart';
import 'reto/puntaje/score.dart';

class HomePage extends StatefulWidget {
  static final routeName = "homePage";
  /*int id;
  String curso;

  HomePage({this.id, this.curso});*/

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RecoverQuestionsList recover = Get.put(RecoverQuestionsList());
  int _currentPage = 0;
  int idA;
  String Curso, email, name;
  @override
  void initState() {
    /*idA = widget.id;
    Curso = widget.curso;*/
    super.initState();
    recuperar();
    //recover.loadMateria(Curso);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> recuperar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    idA =  prefs.getInt("Alumno");
    Curso = prefs.getString("Curso");
    email = prefs.getString("email");
    name = prefs.getString("name");
    recover.loadMateriaReto(Curso);
  }

  @override
  Widget build(BuildContext context) {
    int id;
    String curso, email, name;
    Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    if(!args.isEmpty) {
      id = args["alumno"] as int;
      curso = args["curso"].toString();
      email = args["email"].toString();
      name = email = args["name"].toString();
    } else {
      recuperar();
      id = idA;
      curso = Curso;
      email = email;
      name = name;
    }

    /*int id = idA;
    String curso = Curso;*/
    //int id = ModalRoute.of(context).settings.arguments;
    /*if(id == null) {
      id = idA;
      curso = Curso;
    }*/
    print("Este es la prueba: $id");
    print("Este es el curso: $curso");
    print("Este es el curso: $email");
    print("Este es el curso: $name");
    final _menu =  [ // Lista precargada
      BottomMenuItem(iconPath: "assets/icons/smartphoneBlack.svg", label: "Reto", content: MenuTab(idAlumno: id, curso: curso,)),
      BottomMenuItem(iconPath: "assets/icons/examen.svg", label: "Test", content: HistorialTab(idAlumno: id,nameCurso: curso,)),
      BottomMenuItem(iconPath: "assets/icons/user.svg", label: "Ranking", content: UserTab(nameCurso: curso)),
      BottomMenuItem(iconPath: "assets/icons/history.svg", label: "Historial", content: HistorialTabD(idAlumno: id,nameCurso: curso,)),
      BottomMenuItem(iconPath: "assets/icons/adjust.svg", label: "Ajuste", content: AjusteTab(idAlumno: id, curso: curso, rol: 3, email: email, name: name)),
    ];
    print('Identificador del alumno: '+ id.toString());
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
                //final route = MaterialPageRoute(builder: (BuildContext _)=>Score());
                //Navigator.push(context, route);
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
