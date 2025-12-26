// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'worker_register_screen.dart';
// import 'customer_register_screen.dart';

// class RoleSelectionScreen extends StatelessWidget {
//   const RoleSelectionScreen({super.key});

//   void selectRole(BuildContext context, String role) {
//     Hive.box('appBox').put('role', role);

//     if (role == 'worker') {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (_) => const WorkerRegisterScreen()),
//       );
//     } else {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (_) => const CustomerRegisterScreen()),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Select Role')),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: () => selectRole(context, 'worker'),
//             child: const Text('I am a Worker'),
//           ),
//           ElevatedButton(
//             onPressed: () => selectRole(context, 'customer'),
//             child: const Text('I am a Customer'),
//           ),
//         ],
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'worker_register_screen.dart';
import 'customer_register_screen.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  void selectRole(BuildContext context, String role) {
    Hive.box('appBox').put('role', role);

    if (role == 'worker') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const WorkerRegisterScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const CustomerRegisterScreen()),
      );
    }
  }

  // 🌍 Language Text Handler
  Future<Map<String, String>> _getTexts() async {
    final prefs = await SharedPreferences.getInstance();
    final lang = prefs.getString('language') ?? 'en';

    switch (lang) {
      case 'hi':
        return {
          'title': 'अपनी भूमिका चुनें',
          'subtitle': 'आप ऐप को कैसे उपयोग करना चाहते हैं?',
          'worker': 'मैं एक कामगार हूँ',
          'customer': 'मैं एक ग्राहक हूँ',
        };
      case 'mr':
        return {
          'title': 'आपली भूमिका निवडा',
          'subtitle': 'आपण अ‍ॅप कसा वापरू इच्छिता?',
          'worker': 'मी कामगार आहे',
          'customer': 'मी ग्राहक आहे',
        };
      default:
        return {
          'title': 'Select Your Role',
          'subtitle': 'How would you like to use this app?',
          'worker': 'I am a Worker',
          'customer': 'I am a Customer',
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, String>>(
        future: _getTexts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final text = snapshot.data!;

          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF4A90E2),
                  Color(0xFF6A5AE0),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 🌟 Title
                  Text(
                    text['title']!,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Subtitle
                  Text(
                    text['subtitle']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Worker Card
                  _roleCard(
                    title: text['worker']!,
                    icon: Icons.handyman,
                    onTap: () => selectRole(context, 'worker'),
                  ),

                  // Customer Card
                  _roleCard(
                    title: text['customer']!,
                    icon: Icons.person,
                    onTap: () => selectRole(context, 'customer'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // 🎨 Role Card Widget (UI Consistent)
  Widget _roleCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 34,
                color: const Color(0xFF4A90E2),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
