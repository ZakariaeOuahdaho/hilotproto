import 'package:flutter/material.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({Key? key}) : super(key: key);

  @override
  _ProfileSectionState createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // En-tête de la page
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mon Profil',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue[800]),
                      onPressed: () {
                        // Logique d'édition du profil
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Photo de profil
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.blue[100],
                  child: Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.blue[800],
                  ),
                ),

                const SizedBox(height: 24),

                // Informations de l'utilisateur
                Text(
                  'test Hilot',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'testhilot@gmail.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '+212********',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),

                const SizedBox(height: 40),

                // Options du profil avec plus d'espacement
                _buildProfileSection(
                  children: [
                    _buildProfileOption(
                      icon: Icons.dark_mode_outlined,
                      iconColor: Colors.grey,
                      title: 'mode sombre',
                      trailing: Switch(
                        value: _darkModeEnabled,
                        onChanged: (bool value) {
                          setState(() {
                            _darkModeEnabled = value;
                          });
                        },
                        activeColor: Colors.blue[800],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),  // Espacement entre les sections

                _buildProfileSection(
                  children: [
                    _buildProfileOption(
                      icon: Icons.person_outline,
                      iconColor: Colors.blue,
                      title: 'profil',
                      onTap: () {
                        // Navigation vers les informations personnelles
                      },
                    ),
                    _buildDivider(), // Ajout d'un séparateur
                    _buildProfileOption(
                      icon: Icons.account_balance_outlined,
                      iconColor: Colors.orange,
                      title: 'sécurité',
                      onTap: () {
                        // Navigation vers les informations bancaires
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 20),  // Espacement entre les sections

                _buildProfileSection(
                  children: [
                    _buildProfileOption(
                      icon: Icons.receipt_outlined,
                      iconColor: Colors.red,
                      title: 'documents administratifs',
                      onTap: () {
                        // Navigation vers les transactions
                      },
                    ),
                    _buildDivider(), // Ajout d'un séparateur
                    _buildProfileOption(
                      icon: Icons.settings_outlined,
                      iconColor: Colors.blue,
                      title: 'paramètres',
                      onTap: () {
                        // Navigation vers les paramètres
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 20),  // Espacement entre les sections

                _buildProfileSection(
                  children: [
                    _buildProfileOption(
                      icon: Icons.privacy_tip_outlined,
                      iconColor: Colors.green,
                      title: 'donnée personnelle',
                      onTap: () {
                        // Navigation vers la confidentialité des données
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Méthode pour créer un séparateur
  Widget _buildDivider() {
    return Divider(
      height: 1,
      color: Colors.grey[300],
      indent: 70,  // Aligne le séparateur avec le texte
    );
  }

  // Méthode pour créer une section de profil avec un arrière-plan
  Widget _buildProfileSection({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  // Méthode pour construire les options du profil
  Widget _buildProfileOption({
    required IconData icon,
    required Color iconColor,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: iconColor.withOpacity(0.1),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.blue[800],
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: trailing ?? Icon(Icons.chevron_right, color: Colors.blue[800]),
      onTap: onTap,
    );
  }
}