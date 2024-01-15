import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class FaceId extends StatefulWidget {
  const FaceId({Key? key}) : super(key: key);

  @override
  State<FaceId> createState() => _FaceIdState();
}

class _FaceIdState extends State<FaceId> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  bool _isAuthenticated = false;

  Future<void> _authenticate() async {
    bool authenticated = false;

    try {
      authenticated = await _localAuthentication.authenticate(
        options: AuthenticationOptions(
          biometricOnly: true, // Use only biometric methods (face or fingerprint)
          useErrorDialogs: true, // Show error dialogs on authentication failure
          stickyAuth: false, // Set to false to allow switching between Face ID and fingerprint
        ),
        localizedReason: 'Authenticate to access the app', // Displayed on the dialog

      );
    } catch (e) {
      print('Error during biometric authentication: $e');
    }

    if (!mounted) return;

    setState(() {
      _isAuthenticated = authenticated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("Face ID"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _isAuthenticated
                  ? 'Biometric authentication successful!'
                  : 'Press the button to authenticate with Face ID or Fingerprint.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _authenticate,
              child: Text('Authenticate with Biometrics'),
            ),
          ],
        ),
      ),
    );
  }
}
