class CountState {
  final int count;
  final int clickCount;

  CountState({
    this.count,
    this.clickCount
  });

  static CountState initialState() {
    return CountState(
      count: 0, 
      clickCount: 0
    );
  }

  CountState copyWith({count, clickCount}) {
    return CountState(
      count: count ?? this.count,
      clickCount: clickCount ?? this.clickCount,
    );
  }

  //To only save parts of your state, simply omit the fields that you wish to not save from your serializer.
  ////when state is null, it will throw "The method '[]' was called on null".
  static CountState fromJson(dynamic json) {
    return json == null ? CountState.initialState() : CountState(count: json['count'], clickCount: json['clickCount']);
  }

  dynamic toJson() => { 'count': count, 'clickCount': clickCount };
}