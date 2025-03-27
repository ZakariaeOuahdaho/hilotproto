import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                  'Nos Services',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),

                const SizedBox(height: 24),

                // Section Santé Préventive
                _buildServiceSection(
                  title: 'Santé Préventive',
                  services: [
                    ServiceItem(
                      icon: Icons.health_and_safety,
                      title: "Prévention",
                      subtitle: "Anticiper & Protéger",
                      color: Colors.green,
                      onTap: () => _showServiceDetailsDialog(
                        title: "Prévention",
                        description:
                        "La prévention est essentielle pour anticiper les risques et protéger votre santé. Nous vous accompagnons avec des conseils personnalisés et des outils pour rester en bonne santé.",
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Section Consultation
                _buildServiceSection(
                  title: 'Consultation',
                  services: [
                    ServiceItem(
                      icon: Icons.local_hospital,
                      title: "Télémédecine",
                      subtitle: "Consulter & Suivre",
                      color: Colors.blue,
                      onTap: () => _showServiceDetailsDialog(
                        title: "Télémédecine",
                        description:
                        "La télémédecine vous permet de consulter un médecin à distance et de suivre votre santé en temps réel. Pratique, rapide et sécurisé.",
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Section Collaboration
                _buildServiceSection(
                  title: 'Collaboration Médicale',
                  services: [
                    ServiceItem(
                      icon: Icons.groups,
                      title: "Partage d'Informations",
                      subtitle: "Partager & Coordonner",
                      color: Colors.orange,
                      onTap: () => _showServiceDetailsDialog(
                        title: "Collaboration Médicale",
                        description:
                        "La collaboration médicale permet aux professionnels de santé de partager des informations et de coordonner les soins pour une prise en charge optimale.",
                      ),
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

  // Méthode pour construire une section de services
  Widget _buildServiceSection({
    required String title,
    required List<ServiceItem> services,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Titre de la section
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue[700],
            ),
          ),
        ),

        // Conteneur des services
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: services.map((service) {
              return Column(
                children: [
                  _buildServiceItem(
                    icon: service.icon,
                    title: service.title,
                    subtitle: service.subtitle,
                    color: service.color,
                    onTap: service.onTap,
                  ),
                  if (service != services.last)
                    _buildDivider(),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  // Élément de service
  Widget _buildServiceItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    VoidCallback? onTap,
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
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 14,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: Colors.blue[800],
      ),
      onTap: onTap,
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

  // Méthode pour afficher les détails du service
  void _showServiceDetailsDialog({
    required String title,
    required String description,
  }) {
    // Implémentation du dialogue (similaire à votre version précédente)
  }
}

// Classe pour définir un service
class ServiceItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback? onTap;

  ServiceItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    this.onTap,
  });
}