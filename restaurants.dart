void main() {
  List<Map<String, dynamic>> restaurantes = [
    {
      "nombre": "El novillo alegre",
      "tipo": "Argentina",
      "calificaciones": [4, 5, 2, 1, 2]
    },
    {
      "nombre": "Baires Grill",
      "tipo": "Argentina",
      "calificaciones": [3, 1, 3, 5, 5, 2, 3]
    },
    {
      "nombre": "Mario Brothers",
      "tipo": "Italiana",
      "calificaciones": [4, 3, 2, 1, 1]
    },
    {
      "nombre": "Molto bene",
      "tipo": "Italiana",
      "calificaciones": [4, 3, 1, 1, 5]
    },
    {
      "nombre": "Ruskiy bistro",
      "tipo": "Rusa",
      "calificaciones": [0,1,2,3]
    }
  ];

  List<String> tipos = [
    for (var restaurante in restaurantes)
      restaurante['tipo']
  ];

  Map<String, List<int>> rating = {
    for (var tipo in tipos)
      tipo: [],
  };

  for (var restaurante in restaurantes) {
    String tipo = restaurante['tipo'];
    List<int> calificaciones = restaurante['calificaciones'];
    rating[tipo]!.addAll(calificaciones);
  }

  Map<String, double> promedios = {};
  for (var tipo in tipos) {
    List<int> calificaciones = rating[tipo]!;
    double suma = calificaciones.reduce((a, b) => a + b).toDouble();
    double promedio = suma / calificaciones.length;
    promedios[tipo] = promedio;
  }

  print(promedios);
}
