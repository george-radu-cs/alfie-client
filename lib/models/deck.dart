import 'deck_card.dart';

class Deck {
  final int? id;
  final String name;
  final String description;
  final int groupId;
  List<DeckCard> cards = [];

  Deck({
    this.id,
    required this.name,
    required this.description,
    required this.groupId,
  });

  factory Deck.fromMap(Map<String, dynamic> json) => Deck(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        groupId: json['groupId'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'groupId': groupId,
      };

  Deck copyWith({
    int? id,
    String? name,
    String? description,
    int? groupId,
  }) {
    return Deck(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      groupId: groupId ?? this.groupId,
    );
  }

  @override
  String toString() {
    return 'Deck(id: $id, name: $name, description: $description, groupId: $groupId, cards: $cards)';
  }
}
