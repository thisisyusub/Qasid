import 'package:equatable/equatable.dart';

class Selection<T> extends Equatable {
  const Selection({
    required this.value,
    this.selected = true,
  });

  final T value;
  final bool selected;

  Selection<T> toggle() {
    return Selection(
      value: value,
      selected: !selected,
    );
  }

  factory Selection.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return Selection(
      selected: json['selected'],
      value: fromJson(json['value']),
    );
  }

  Map<String, dynamic> toJson(
    Map<String, dynamic> typeToJson,
  ) {
    final map = <String, dynamic>{};

    map['value'] = typeToJson;
    map['selected'] = selected;

    return map;
  }

  @override
  List<Object?> get props => [value, selected];
}
