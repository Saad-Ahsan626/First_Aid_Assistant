import 'package:first_aid_assisstant/providers/emergency_provider.dart';
import 'package:first_aid_assisstant/widgets/emergency_bottom_bar.dart';
import 'package:first_aid_assisstant/widgets/emergency_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Homescreen extends ConsumerWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: const EmergencyBottomBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF129490)),
              child: Text(
                'First Aid Assistant',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.brightness),
              title: const Text('Change Theme'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xFF129490),
        title: Center(
          child: Text(
            "First Aid Assistant",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white70],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search emergency",
                  prefixIcon: const Icon(
                    CupertinoIcons.search,
                    color: Color(0xFF129490),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Color(0xFF129490),
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                onChanged: (value) {
                  ref.read(searchQueryProvider.notifier).state = value
                      .toLowerCase();
                },
              ),
            ),

            Expanded(
              child: Consumer(
                builder: (context, gridRef, child) {
                  final searchQuery = gridRef.watch(searchQueryProvider);
                  final emergencyList = gridRef.watch(EmergencyProvider);

                  return emergencyList.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error, stack) =>
                        Center(child: Text('Error: $error')),
                    data: (emergencies) {
                      final filteredList = emergencies.where((emergency) {
                        return emergency.titleEn.toLowerCase().contains(
                              searchQuery,
                            ) ||
                            emergency.titleUr.contains(searchQuery);
                      }).toList();

                      if (filteredList.isEmpty) {
                        return const Center(
                          child: Text(
                            'No matching emergencies found',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        );
                      }

                      return SingleChildScrollView(
                        padding: const EdgeInsets.all(12.0),
                        child: StaggeredGrid.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,

                          children: List.generate(filteredList.length, (index) {
                            final emergency = filteredList[index];
                            final int columnSpan = (index % 3 == 0) ? 2 : 1;

                            return StaggeredGridTile.fit(
                              crossAxisCellCount: columnSpan,
                              child: Emergency_card(
                                context,
                                emergency,
                                columnSpan == 2,
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
