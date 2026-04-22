import 'package:first_aid_assisstant/data/models/emergency_model.dart';
import 'package:first_aid_assisstant/data/repositories/emergency_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final EmergencyProvider = FutureProvider<List<EmergencyModel>>((ref) async {
  final EmergencyRepository emergencyRepository = EmergencyRepository();
  return await emergencyRepository.getEmergency();
});

final isUrduProvider = StateProvider.autoDispose<bool>((ref) => false);

final searchQueryProvider = StateProvider<String>((ref) => '');
