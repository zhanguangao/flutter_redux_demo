class AppState {
  final int count;
  final int clickCount;

  AppState({
    this.count,
    this.clickCount
  });

  AppState copyWith({count, clickCount}) {
    return AppState(
      count: count ?? this.count,
      clickCount: clickCount ?? this.clickCount,
    );
  }

  static AppState initialState() {
    return AppState(
      count: 0, 
      clickCount: 0
    );
  }

  //To only save parts of your state, simply omit the fields that you wish to not save from your serializer.
  ////when state is null, it will throw "The method '[]' was called on null".
  static AppState fromJson(dynamic json) {
    return AppState(count: json['count'], clickCount: json['clickCount']);
    // return json == null ? AppState.initialState() : AppState(count: json['count'], clickCount: json['clickCount']);
  }

  dynamic toJson() => { 'count': count, 'clickCount': clickCount };
}

