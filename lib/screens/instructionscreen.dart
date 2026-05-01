import 'package:first_aid_assisstant/providers/emergency_provider.dart';
import 'package:first_aid_assisstant/providers/tts_provider.dart';
import 'package:first_aid_assisstant/widgets/emergency_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';

class InstructionScreen extends ConsumerWidget {
  final dynamic emergency;

  const InstructionScreen({super.key, required this.emergency});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isUrdu = ref.watch(isUrduProvider);
    final tts = ref.watch(ttsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(isUrdu ? emergency.titleUr : emergency.titleEn),
        backgroundColor: Theme.of(context).primaryColor,
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
                activeColor: Colors.white,
                inactiveTrackColor: Colors.white30,
                onChanged: (value) {
                  ref.read(isUrduProvider.notifier).state = value;
                  if (!value) {
                    tts.stop();
                  }
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

          return Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: Theme.of(context).brightness == Brightness.dark
                  ? []
                  : [
                      BoxShadow(
                        color: const Color(0xFF1A1C1C).withOpacity(0.06),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                        child: Text(
                          "${step.step}",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
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
                          icon: Icon(
                            Icons.volume_up,
                            color: Theme.of(context).primaryColor,
                            size: 28,
                          ),
                          onPressed: () async {
                            await tts.stop();
                            await tts.speak(step.ur);
                          },
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    isUrdu ? step.ur : step.en,

                    textDirection: isUrdu
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    textAlign: isUrdu ? TextAlign.right : TextAlign.left,
                    style: TextStyle(
                      fontFamily: isUrdu ? 'JameelNoori' : null,
                      fontSize: isUrdu ? 22 : 18,
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
      bottomNavigationBar: const EmergencyBottomBar(),
    );
  }
}
