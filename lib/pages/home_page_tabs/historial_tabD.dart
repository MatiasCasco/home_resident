import 'package:flutter/cupertino.dart';
import 'package:home_resident/pages/recover_cuestionary/comoponents/body_cuestionary_recover.dart';

import '../welcone_recover.dart';

class HistorialTabD extends StatefulWidget {
  int idAlumno;
  String nameCurso;

  HistorialTabD({@required this.idAlumno, @required this.nameCurso});

  @override
  _HistorialTabDState createState() => _HistorialTabDState();
}

class _HistorialTabDState extends State<HistorialTabD> {
  int id;
  String curso;
  @override
  Widget build(BuildContext context) {
    return WelcomeRecover(id: id, curso: curso,);
  }

  @override
  void initState() {
    id= widget.idAlumno;
    curso = widget.nameCurso;
  }
}
