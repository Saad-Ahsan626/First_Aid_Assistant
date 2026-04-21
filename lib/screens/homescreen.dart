import 'package:first_aid_assisstant/providers/emergency_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Homescreen extends ConsumerStatefulWidget {
  const Homescreen({super.key});

  @override
  ConsumerState<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends ConsumerState<Homescreen> {
  @override
  Widget build(BuildContext context) {
    final EmergencyState = ref.watch(EmergencyProvider);
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("First Aid Assistant"))),
      body: EmergencyState.when(
        data: (emergencies) {
          if (emergencies.isEmpty) {
            return const Center(child: Text('No emergencies found.'));
          }
          return ListView.builder(
            itemCount: emergencies.length,
            itemBuilder: (context, index) {
              final emergency = emergencies[index];
              return ListTile(
                leading: const Icon(Icons.medical_services, color: Colors.red),
                title: Text(
                  emergency.titleEn,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(emergency.titleUr),
              );
            },
          );
        },
        error: (error, Stack) =>
            Center(child: Text('Oops, something went wrong: $error')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
