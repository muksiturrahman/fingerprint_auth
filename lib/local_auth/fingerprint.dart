import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class FingerPrint extends StatefulWidget {
  const FingerPrint({Key? key}) : super(key: key);

  @override
  State<FingerPrint> createState() => _FingerPrintState();
}

class _FingerPrintState extends State<FingerPrint> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  bool _isAuthenticated = false;

  Future<void> _authenticate() async {
    bool authenticated = false;

    try {
      authenticated = await _localAuthentication.authenticate(
        options: AuthenticationOptions(
            biometricOnly: true,
            useErrorDialogs: true,
          stickyAuth: true,
        ),
        // biometricOnly: true,
        localizedReason: 'Authenticate to access the app', // Displayed on the dialog
        // useErrorDialogs: true, // Show error dialogs on authentication failure
      );
    } catch (e) {
      print('Error during fingerprint authentication: $e');
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
        title: Text("FingerPrint"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _isAuthenticated
                  ? 'Fingerprint authentication successful!'
                  : 'Press the button to authenticate with fingerprint.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _authenticate,
              child: Text('Authenticate with Fingerprint'),
            ),
          ],
        ),
      ),
    );
  }
}
