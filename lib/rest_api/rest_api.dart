class CustomClass {
  final String text;
  final int value;

  CustomClass({required this.text, required this.value});

  CustomClass.fromJson(Map json)
      : text = json['text'],
        value = json['value'];

  static Map toJson(CustomClass value) => {'text': value.text, 'value': value.value};
}
