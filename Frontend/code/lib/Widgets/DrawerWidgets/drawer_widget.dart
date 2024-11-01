import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muqin/Widgets/DrawerWidgets/drawer_header.dart';
import 'package:muqin/Widgets/DrawerWidgets/drawer_item.dart';
import "package:muqin/providers/provider.dart";
// Step 1: Convert DrawerWidget to a ConsumerStatefulWidget
class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
  void signOut() {
    FirebaseAuth.instance.signOut();
    ref.read(googleSignIn.notifier).state.signOut();
    
  }
    // Step 3: Implement the build method in the State class
    bool isDarkMode = Theme.of(context).brightness==Brightness.dark;
    return Drawer(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          
          padding: EdgeInsets.zero,
          children: <Widget>[
            const MyDrawerHeader(), // Function to create the header
            DrawerItem(
              icon: Icons.home,
              text: 'الصفحة الرئيسية',
              onTap: () => Navigator.of(context).pop(),
            ),
            DrawerItem(
              icon: Icons.book,
              text: 'قوائم القراءة الخاصة بي',
              onTap: () => Navigator.of(context).pop(),
            ),
            DrawerItem(
              icon: Icons.notifications,
              text: 'تنبيهاتي',
              onTap: () => Navigator.of(context).pop(),
            ),
            DrawerItem(
              icon: Icons.search,
              text: 'البحث',
              onTap: () => Navigator.of(context).pop(),
            ),
            DrawerItem(
              icon: Icons.help_outline,
              text: 'للمساعدة',
              onTap: () => Navigator.of(context).pop(),
            ),
            const Divider(),
            DrawerItem(
              icon: Icons.help_outline,
              text: 'تصميم البرنامج',
              onTap: () => Navigator.of(context).pop(),
        
            ),
        Switch(
          value: isDarkMode,
          onChanged: (isOn) {
            ThemeMode newThemeMode = isOn ? ThemeMode.dark : ThemeMode.light;
            // Update the theme mode state
            ref.read(themeModeToggle.notifier).state = newThemeMode;
          },
          
        )
        ,DrawerItem(icon: Icons.logout, text: "تسجيل الخروج", onTap: signOut)
          ],
        ),
      ),
    );
  }


}
