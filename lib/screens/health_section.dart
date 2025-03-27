import 'package:flutter/material.dart';

class HealthSection extends StatelessWidget {
  const HealthSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Titre de la page
                Text(
                  'Santé',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),

                const SizedBox(height: 24),

                // Carte de profil
                _buildProfileCard(),

                const SizedBox(height: 24),

                // Sections de santé
                _buildHealthSections(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Carte de profil
  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.green,
            radius: 40,
            child: Text(
              'ZO',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Zakaria O.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Dossier médical personnel',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Sections de santé
  Widget _buildHealthSections() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          _buildHealthSectionItem(
            icon: Icons.document_scanner,
            title: 'Documents',
            color: Colors.blue,
          ),
          _buildDivider(),
          _buildHealthSectionItem(
            icon: Icons.medical_services,
            title: 'Antécédents médicaux',
            color: Colors.red,
          ),
          _buildDivider(),
          _buildHealthSectionItem(
            icon: Icons.medication,
            title: 'Traitements réguliers',
            color: Colors.purple,
          ),
          _buildDivider(),
          _buildHealthSectionItem(
            icon: Icons.coronavirus,
            title: 'Allergies',
            color: Colors.orange,
          ),
          _buildDivider(),
          _buildHealthSectionItem(
            icon: Icons.family_restroom,
            title: 'Antécédents familiaux',
            color: Colors.green,
          ),
          _buildDivider(),
          _buildHealthSectionItem(
            icon: Icons.local_hospital,
            title: 'Opérations chirurgicales',
            color: Colors.pink,
          ),
          _buildDivider(),
          _buildHealthSectionItem(
            icon: Icons.vaccines,
            title: 'Vaccins',
            color: Colors.teal,
          ),
          _buildDivider(),
          _buildHealthSectionItem(
            icon: Icons.monitor_weight,
            title: 'Mesures',
            color: Colors.indigo,
          ),
        ],
      ),
    );
  }

  // Élément de section de santé
  Widget _buildHealthSectionItem({
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: color,
          size: 24,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.blue[800],
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: Colors.blue[800],
      ),
      onTap: () {
        // Action à implémenter pour chaque section
      },
    );
  }

  // Séparateur
  Widget _buildDivider() {
    return Divider(
      height: 1,
      color: Colors.grey[300],
      indent: 16,
      endIndent: 16,
    );
  }
}