abstract class LobbyValueBasics {
  static const List<String> nomParam = <String>[
    "Nombre d'imposteur",
    "Temps entre chaque mort",
    "distance de meurtre",
    "Réunion d'urgence",
    "Temps de discussion/vote",
    "Nombre de tâches par personne",
    "Nombre de tâche totale"
  ];
  static const List<int> maxValues = <int>[3, 480, 3, 3, 600, 10, 30];
  static const List<int> minValues = <int>[1, 60, 1, 0, 30, 4, 10];
  static const List<int> multiplier = <int>[1, 5, 1, 1, 30, 1, 1];
  static const List<String> screenValues = <String>["", "s", "x", " fois", "s", "", ""];
  static const List<int> defaultValues = <int>[1, 120, 2, 1, 150, 5, 10];
}