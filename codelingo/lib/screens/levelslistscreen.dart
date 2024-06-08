import 'package:codelingo/models/LevelsModel.dart';
import 'package:flutter/material.dart';
// import 'package:codelingo/models/LevelsModel.dart';
import 'package:codelingo/services/LevelsService.dart';

class LevelsScreen extends StatefulWidget {
  const LevelsScreen({super.key});

  @override
  _LevelsScreenState createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  final LevelsService _levelsService = LevelsService();
  List<LevelsModel> _levels = [];

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Levels'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Add predefined data to levels
              _addPredefinedData();
            },
          ),
        ],
      ),
      body:
          // StreamBuilder<List<LevelsModel>>(
          // stream: _levelsService.getAllLevelss(),
          // builder: (context, snapshot) {
          //   if (snapshot.connectionState == ConnectionState.waiting) {
          //     return Center(child: CircularProgressIndicator());
          //   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          //     return Center(child: Text('No levels to show'));
          //   } else {
          // return
          Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : _levels.isEmpty
                ? const Text('No Levels yet')
                : ListView.builder(
                    itemCount: _levels.length,
                    itemBuilder: (context, index) {
                      LevelsModel level = _levels[index];
                      return ListTile(
                        title: Text(level.name),
                        subtitle: level.topicsuid.isNotEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: level.topicsuid
                                    .map((topic) => Text(topic))
                                    .toList(),
                              )
                            : const Text('No topics'),
                      );
                    },
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchUsers,
        child: const Icon(Icons.refresh),
      ),
      // }
      // },
      // ),
    );
  }

  void _fetchUsers() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final levels = await _levelsService.getAllLevelss();
      setState(() {
        _levels = levels;
        _isLoading = false;
      });
    } catch (e) {
      print('Failed to fetch levels: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Add predefined data to levels
  void _addPredefinedData() async {
    List<String> predefinedTopicsIds = ["First Id", "Second Id"];

    LevelsModel predefinedLevel = LevelsModel(
      uid: '1',
      name: 'Updateeedddd',
      difficulty: 'Easy',
      order: 1,
      topicsuid: predefinedTopicsIds,
    );
    // await _levelsService.addLevels(Levels:  predefinedLevel);
    final x = await _levelsService.updateLevelsById(LevelsId: "9P4Ew8suBYcGtHTK5eVe",Levels: predefinedLevel);
    // print("the level get is ${x?.topicsId}");
    
    _fetchUsers();
  }
}
