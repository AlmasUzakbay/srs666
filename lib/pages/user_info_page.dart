import 'package:flutter/material.dart';
import '../shared_preferences_service.dart';

class RegistrPage extends StatelessWidget {
  final User user;

  RegistrPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registr Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Clients Name: ${user.personName}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Clients Phone Number: ${user.phoneNumber}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Clients Country: ${user.country}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Clients Email: ${user.email}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Clients Life Story: ${user.life}',
              style: TextStyle(fontSize: 16),
            ),
             SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                SharedPreferencesService service = await SharedPreferencesService.getInstance();
                bool currentSoundSettings = await service.getSoundSettings();
                await service.saveSoundSettings(!currentSoundSettings);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Sound settings updated!'),
                ));
              },
              child: Text('Toggle Sound Settings'),
            )
          ],
        ),
      ),
    );
  }
}

class User {
  String personName = '';
  String phoneNumber = '';
  String country = 'Russia';
  String email = '';
  String life = '';
  String password = '';
  String confirmPassword = '';

  User({
    this.personName = '',
    this.phoneNumber = '',
    this.country = 'Russia',
    this.email = '',
    this.life = '',
    this.password = '',
    this.confirmPassword = '',
  });
}