import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';

final ttsProvider = Provider.autoDispose<FlutterTts>((ref) {
  final tts = FlutterTts();

  tts.setLanguage("ur-PK");

  tts.setSpeechRate(0.5);
  tts.setVolume(1.0);

  ref.onDispose(() {
    tts.stop();
  });

  return tts;
});
