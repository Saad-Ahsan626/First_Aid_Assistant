import 'package:url_launcher/url_launcher.dart';

class EmergencyDialer {

static Future<void> call1122() async {
  final Uri phoneUri = Uri(scheme: 'tel', path: '1122');

  if(await canLaunchUrl(phoneUri)) {
    await launchUrl(phoneUri);
  } 
  else 
  {
    throw 'Could not launch $phoneUri';
  }

}

}