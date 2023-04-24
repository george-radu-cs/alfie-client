import 'package:alfie/models/deck.dart';
import 'package:alfie/models/theme_color.dart';

class Group {
  final int? id;
  final String name;
  final ThemeColor color;

  Group({
    this.id,
    required this.name,
    required this.color,
  });

  factory Group.fromMap(Map<String, dynamic> json) => Group(
        id: json['id'],
        name: json['name'],
        color: json['color'].toString().toThemeColor,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'color': color.name,
      };

  Group copyWith({
    int? id,
    String? name,
    ThemeColor? color,
  }) {
    return Group(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  @override
  String toString() {
    return 'Group(id: $id, name: $name, color: $color)';
  }
}

class GroupWithDecks extends Group {
  bool showDecks;
  final List<Deck> decks;

  GroupWithDecks({
    id,
    name,
    color,
    this.showDecks = false,
    this.decks = const [],
  }) : super(id: id, name: name, color: color);

  @override
  GroupWithDecks copyWith({
    int? id,
    String? name,
    ThemeColor? color,
    List<Deck>? decks,
  }) {
    return GroupWithDecks(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      decks: decks ?? this.decks,
    );
  }

  @override
  String toString() {
    return 'Group(id: $id, name: $name, color: $color, showDecks: $showDecks, decks: $decks)';
  }
}
