import 'package:first_aid_assisstant/providers/emergency_provider.dart';
import 'package:first_aid_assisstant/widgets/emergency_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Homescreen extends ConsumerStatefulWidget {
  const Homescreen({super.key});

  @override
  ConsumerState<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends ConsumerState<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(CupertinoIcons.search),
                onPressed: () {},
              ),
            ],
          ),
        ],
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white70],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Consumer(
          builder: (context, ref, child) {
            final emergencyList = ref.watch(EmergencyProvider);

            return Expanded(
              child: emergencyList.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Error: $error')),
                data: (emergencies) {
                  if (emergencies.isEmpty) {
                    return const Center(child: Text('No emergencies found'));
                  }
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(12.0),
                    child: StaggeredGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      children: List.generate(emergencies.length, (index) {
                        final emergency = emergencies[index];

                        final int columnSpan = (index % 3 == 0) ? 2 : 1;

                        return StaggeredGridTile.fit(
                          crossAxisCellCount: columnSpan,
                          child: Emergency_card(context, emergency, columnSpan == 2),
                        );
                      }),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      
    );
  }
}
