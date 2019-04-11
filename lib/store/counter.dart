class CounterState {
  final int count;
  final int clickCount;

  CounterState({
    this.count,
    this.clickCount
  });

  static CounterState initial() {
    return CounterState(
      count: 0, 
      clickCount: 0
    );
  }

  CounterState copyWith({count, clickCount}) {
    return CounterState(
      count: count ?? this.count,
      clickCount: clickCount ?? this.clickCount,
    );
  }

  static CounterState fromJson(dynamic json) {
    return json == null ? CounterState.initial() : CounterState(count: json['count'], clickCount: json['clickCount']);
  }

  dynamic toJson() => { 'count': count, 'clickCount': clickCount };
}