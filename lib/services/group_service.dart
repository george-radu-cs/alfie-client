import 'package:alfie/models/deck.dart';
import 'package:alfie/models/group.dart';
import 'package:alfie/repositories/deck_repository.dart';
import 'package:alfie/repositories/group_repository.dart';

class GroupService {
  GroupService._privateConstructor();
  static final GroupService instance = GroupService._privateConstructor();

  static final GroupRepository _groupRepository = GroupRepository.instance;
  static final DeckRepository _deckRepository = DeckRepository.instance;

  Future<List<Group>> getGroups() async {
    return await _groupRepository.getGroups();
  }

  Future<List<GroupWithDecks>> getGroupsWithDecks() async {
    List<Group> groups = await _groupRepository.getGroups();
    List<Deck> decks = await _deckRepository.getDecks();

    return groups.map((group) {
      return GroupWithDecks(
          id: group.id,
          name: group.name,
          color: group.color,
          decks: decks.where((deck) => deck.groupId == group.id).toList(growable: false));
    }).toList(growable: false);
  }

  Future<List<Group>> getGroupsOtherThan(List<int> groupIds) async {
    List<Group> groups = await _groupRepository.getGroups();
    return groups.where((group) => !groupIds.contains(group.id)).toList(growable: false);
  }

  Future<bool> createGroup(Group group) async {
    try {
      await _groupRepository.createGroup(group);
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> updateGroup(Group group) async {
    try {
      await _groupRepository.updateGroup(group);
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> deleteGroup(int id) async {
    try {
      await _groupRepository.deleteGroup(id);
      return true;
    } catch (err) {
      return false;
    }
  }
}
