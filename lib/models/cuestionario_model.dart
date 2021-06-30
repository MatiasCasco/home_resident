class Cuestionario{
  final int idCuestionario, puntos, idCurso, idMateria;
  final String descripcion, nameMateria, nameCurso, fechaApertura, fechaCierre, tiempoLimite;

  Cuestionario({
      this.idCuestionario,
      this.descripcion,
      this.puntos,
      this.idCurso,
      this.idMateria,
      this.nameMateria,
      this.nameCurso,
      this.fechaApertura,
      this.fechaCierre,
      this.tiempoLimite
});

  @override
  String toString() {
    return 'Cuestionario{idCuestionario: $idCuestionario, descripcion: $descripcion, puntos: $puntos, idCurso: $idCurso, idMateria: $idMateria, nameMateria: $nameMateria, nameCurso: $nameCurso, fechaApertura: $fechaApertura, fechaCierre: $fechaCierre, tiempoLimite: $tiempoLimite}';
  }
}