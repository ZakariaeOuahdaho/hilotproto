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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // En-tête de la page
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My Profile',
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

                const SizedBox(height: 24),

                // Photo de profil
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.blue[100],
                      backgroundImage: const NetworkImage(
                        'https://example.com/profile-image.jpg', // Remplacez par l'URL de l'image
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Informations de l'utilisateur
                Text(
                  'utilisateur',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
                Text(
                  'testhilot@gmail.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  '+212*********',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),

                const SizedBox(height: 32),

                // Options du profil
                _buildProfileOption(
                  icon: Icons.dark_mode_outlined,
                  iconColor: Colors.grey,
                  title: 'Dark Mode',
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

                const SizedBox(height: 8),

                _buildProfileOption(
                  icon: Icons.person_outline,
                  iconColor: Colors.blue,
                  title: 'information personnelle',
                  onTap: () {
                    // Navigation vers les informations personnelles
                  },
                ),

                const SizedBox(height: 8),

                _buildProfileOption(
                  icon: Icons.account_balance_outlined,
                  iconColor: Colors.orange,
                  title: 'documents',
                  onTap: () {
                    // Navigation vers les informations bancaires
                  },
                ),

                const SizedBox(height: 8),

                _buildProfileOption(
                  icon: Icons.receipt_outlined,
                  iconColor: Colors.red,
                  title: 'notification',
                  onTap: () {
                    // Navigation vers les transactions
                  },
                ),

                const SizedBox(height: 8),

                _buildProfileOption(
                  icon: Icons.settings_outlined,
                  iconColor: Colors.blue,
                  title: 'paramètres',
                  onTap: () {
                    // Navigation vers les paramètres
                  },
                ),

                const SizedBox(height: 8),

                _buildProfileOption(
                  icon: Icons.privacy_tip_outlined,
                  iconColor: Colors.green,
                  title: 'Sécurité',
                  onTap: () {
                    // Navigation vers la confidentialité des données
                  },
                ),
              ],
            ),
          ),
        ),
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