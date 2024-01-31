class Question {
  final String id;
  final int nivel;
  final int fase;
  final String title;
  final Map<String, bool> options;

  Question({
    required this.id,
    required this.nivel,
    required this.fase,
    required this.title,
    required this.options,
  });

  @override
  String toString() {
    // TODO: implement toString
    return 'Question(id: $id, title: $title, options: $options)';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nivel': nivel,
      'fase': fase,
      'title': title,
      'options': options,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    Map<String, bool> options = {};

    String optionsString = map['options'].substring(
        1, map['options'].length - 1); // Remover os caracteres "{" e "}"

    List<String> pairs = optionsString.split(', ');
    for (String pair in pairs) {
      List<String> keyValue = pair.split('=');
      String key = keyValue[0].trim();
      bool value = keyValue[1].trim().toLowerCase() == 'true';
      options[key] = value;
    }

    return Question(
      id: map['id'].toString(),
      nivel: map['nivel'],
      fase: map['fase'],
      title: map['title'],
      options: options,
    );
  }
}
