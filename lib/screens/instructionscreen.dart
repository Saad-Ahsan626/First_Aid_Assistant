import 'package:first_aid_assisstant/providers/emergency_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InstructionScreen extends ConsumerWidget {
  final dynamic emergency;

  const InstructionScreen({super.key, required this.emergency});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isUrdu = ref.watch(isUrduProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(isUrdu ? emergency.titleUr : emergency.titleEn),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        actions: [
          Row(
            children: [
              Text(
                "EN",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isUrdu ? Colors.white54 : Colors.white,
                ),
              ),
              Switch(
                value: isUrdu,
                activeColor: Colors.tealAccent,
                inactiveTrackColor: Colors.white30,
                onChanged: (value) {
                  ref.read(isUrduProvider.notifier).state = value;
                },
              ),
              Text(
                "UR",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isUrdu ? Colors.white : Colors.white54,
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: emergency.steps.length,
        itemBuilder: (context, index) {
          final step = emergency.steps[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.redAccent.withOpacity(0.1),
                        child: Text(
                          "${step.step}",
                          style: const TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          isUrdu ? "مرحلہ ${step.step}" : "Step ${step.step}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: isUrdu ? TextAlign.right : TextAlign.left,
                          textDirection: isUrdu
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                        ),
                      ),

                      if (isUrdu)
                        IconButton(
                          icon: const Icon(
                            Icons.volume_up,
                            color: Colors.teal,
                            size: 28,
                          ),
                          onPressed: () {
                            print("Reading aloud: ${step.ur}");
                          },
                        ),
                    ],
                  ),
                  const Divider(height: 24),
                  Text(
                    isUrdu ? step.ur : step.en,

                    textDirection: isUrdu
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    textAlign: isUrdu ? TextAlign.right : TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
