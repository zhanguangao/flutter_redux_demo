
class ThemeState {
  final String primaryColor;

  ThemeState({
    this.primaryColor
  });

  static ThemeState initial() {
    return ThemeState(primaryColor: 'blue');
  }

  ThemeState copyWith({ 
    String primaryColor 
  }) {
    return ThemeState(primaryColor: primaryColor ?? this.primaryColor);
  }

  static ThemeState fromJson(dynamic json) {
    return json == null ? ThemeState.initial() : ThemeState(primaryColor: json['primaryColor']);
  }

  dynamic toJson() => { 'primaryColor': primaryColor };
}