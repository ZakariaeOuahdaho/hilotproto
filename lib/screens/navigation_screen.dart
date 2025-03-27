import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Importez vos écrans
import 'home_section.dart';
import 'info_section.dart';
import 'profile_section.dart';
import 'health_section.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  // Index de la page sélectionnée
  int _selectedIndex = 0;

  // Titres correspondant à chaque écran
  final List<String> _titles = [
    'Accueil',
    'Informations',
    'Santé',
    'Profil',
  ];

  // Liste des écrans
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    // Initialisation des écrans
    _screens = [
      const HomeSection(),
      const HomePage(),
      const HealthSection(), // Nouvelle section Santé
      const ProfileSection(),
    ];

    // Configuration de l'orientation de l'écran
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar conditionnelle
      appBar: _selectedIndex != 2 && _selectedIndex != 3
          ? AppBar(
        title: Text(
          _titles[_selectedIndex],
          style: TextStyle(
            color: Colors.blue[800],
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      )
          : null,

      // Corps de l'application avec l'écran sélectionné
      body: _screens[_selectedIndex],

      // Barre de navigation inférieure
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: NavigationBar(
          height: 65,
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          backgroundColor: Colors.white,
          elevation: 0,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          animationDuration: const Duration(milliseconds: 500),
          destinations: [
            // Destination Accueil
            NavigationDestination(
              icon: Icon(Icons.home_outlined, color: Colors.grey),
              selectedIcon: Icon(Icons.home, color: Colors.blue[800]),
              label: 'Accueil',
            ),

            // Destination Informations
            NavigationDestination(
              icon: Icon(Icons.info_outline, color: Colors.grey),
              selectedIcon: Icon(Icons.info, color: Colors.blue[800]),
              label: 'Informations',
            ),

            // Destination Santé
            NavigationDestination(
              icon: Icon(Icons.favorite_border, color: Colors.grey),
              selectedIcon: Icon(Icons.favorite, color: Colors.blue[800]),
              label: 'Santé',
            ),

            // Destination Profil
            NavigationDestination(
              icon: Icon(Icons.person_outline, color: Colors.grey),
              selectedIcon: Icon(Icons.person, color: Colors.blue[800]),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}