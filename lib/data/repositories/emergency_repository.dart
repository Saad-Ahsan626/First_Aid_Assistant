import 'package:first_aid_assisstant/data/models/emergency_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class EmergencyRepository {

  Future<List<EmergencyModel>> getEmergency() async {
    
    try 
    {
      final String response = await rootBundle.loadString(
        'assets/data/emergencies.json',
      );

      final Map<String, dynamic> jsonData = jsonDecode(response);

      final List<dynamic> emergenciesList = jsonData['emergencies'];

      return emergenciesList
          .map((emergencyJson) => EmergencyModel.fromJson(emergencyJson))
          .toList();
    } 
    catch (e) 
    {
      print('Error: $e');
      return [];
    }
  }
}