// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'role_selection_screen.dart';

// class LanguageScreen extends StatelessWidget {
//   const LanguageScreen({super.key});

//   Future<void> selectLanguage(BuildContext context, String lang) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('language', lang);

//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) => const RoleSelectionScreen()),
//     );
//   } // ✅ FUNCTION CLOSED HERE

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Select Language')),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: () => selectLanguage(context, 'en'),
//             child: const Text('English'),
//           ),
//           ElevatedButton(
//             onPressed: () => selectLanguage(context, 'hi'),
//             child: const Text('Hindi'),
//           ),
//           ElevatedButton(
//             onPressed: () => selectLanguage(context, 'mr'),
//             child: const Text('Marathi'),
//           ),
//         ],
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'role_selection_screen.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  Future<void> selectLanguage(BuildContext context, String lang) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', lang);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const RoleSelectionScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              const SizedBox(height: 20),

              // 🌟 Title
              const Text(
                'Choose Your Language',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 8),

              // Subtitle
              const Text(
                'Select the language you are comfortable with',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 40),

              // Language Cards
              _languageButton(
                context,
                title: 'English',
                subtitle: 'Continue in English',
                onTap: () => selectLanguage(context, 'en'),
              ),

              _languageButton(
                context,
                title: 'हिंदी',
                subtitle: 'हिंदी में जारी रखें',
                onTap: () => selectLanguage(context, 'hi'),
              ),

              _languageButton(
                context,
                title: 'मराठी',
                subtitle: 'मराठीत पुढे चला',
                onTap: () => selectLanguage(context, 'mr'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Custom Language Button Widget
  Widget _languageButton(
    BuildContext context, {
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
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
              const Icon(
                Icons.language,
                size: 30,
                color: Color(0xFF4A90E2),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

