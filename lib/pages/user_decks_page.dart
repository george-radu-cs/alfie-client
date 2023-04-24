import 'package:alfie/models/group.dart';
import 'package:alfie/services/group_service.dart';
import 'package:alfie/services/language_service.dart';
import 'package:alfie/widgets/group/create_edit_group.dart';
import 'package:alfie/widgets/core/snackbar.dart';
import 'package:alfie/widgets/group/view_group.dart';
import 'package:flutter/material.dart';

class UserDecksPage extends StatefulWidget {
  const UserDecksPage({super.key});

  @override
  State<UserDecksPage> createState() => _UserDecksPageState();
}

class _UserDecksPageState extends State<UserDecksPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ValueNotifier<bool> _loading = ValueNotifier(true);
  late Future<List<GroupWithDecks>> _getGroups;

  @override
  void initState() {
    _getGroups = getGroupsWithDecks();
    super.initState();
  }

  Future<List<GroupWithDecks>> getGroupsWithDecks() async {
    _loading.value = true;
    List<GroupWithDecks> result = await GroupService.instance.getGroupsWithDecks();
    _loading.value = false;
    return result;
  }

  refreshData() {
    setState(() {
      _getGroups = getGroupsWithDecks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Align(
        alignment: Alignment.topCenter,
        child: FutureBuilder(
          future: _getGroups,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError || (snapshot.data == null) || (snapshot.data != null && snapshot.data!.isEmpty)) {
              if (snapshot.hasError) {
                WidgetsBinding.instance.addPostFrameCallback(
                    (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).errorLoadingDecks));
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                child: Text(LanguageService.translation(context).noDecks, style: const TextStyle(fontSize: 18)),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      snapshot.data!.length,
                      (groupIndex) => Column(children: [
                        ViewGroup(
                          group: snapshot.data![groupIndex],
                          parentKey: _scaffoldKey,
                          refreshData: refreshData,
                        ),
                        Visibility(
                          visible: groupIndex != snapshot.data!.length - 1,
                          replacement: const SizedBox(height: 100),
                          child: const SizedBox(height: 10),
                        ),
                      ]),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
      // add deck button
      floatingActionButton: ValueListenableBuilder(
        valueListenable: _loading,
        builder: (context, value, child) => Visibility(
          visible: !value,
          child: FloatingActionButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => CreateEditGroup(
                closeWidgetCallback: refreshData,
              ),
            ),
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
