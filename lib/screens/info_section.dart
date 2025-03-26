import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // En-tête personnalisé
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              color: Colors.blue.shade800,
              child: Text(
                'Hilot',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            // Titre principal
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
              child: Text(
                "Nos Services",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
              ),
            ),

            // Liste des services
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  ServiceCard(
                    icon: Icons.health_and_safety,
                    title: "Prévention",
                    subtitle: "Anticiper & Protéger",
                    color: Colors.blue.shade100,
                    onTap: () {
                      _showServiceDetailsDialog(
                        context,
                        title: "Prévention",
                        description:
                        "La prévention est essentielle pour anticiper les risques et protéger votre santé. Nous vous accompagnons avec des conseils personnalisés et des outils pour rester en bonne santé.",
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  ServiceCard(
                    icon: Icons.local_hospital,
                    title: "Télémédecine",
                    subtitle: "Consulter & Suivre",
                    color: Colors.lightBlue.shade100,
                    onTap: () {
                      _showServiceDetailsDialog(
                        context,
                        title: "Télémédecine",
                        description:
                        "La télémédecine vous permet de consulter un médecin à distance et de suivre votre santé en temps réel. Pratique, rapide et sécurisé.",
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  ServiceCard(
                    icon: Icons.groups,
                    title: "Collaboration Médicale",
                    subtitle: "Partager & Coordonner",
                    color: Colors.orange.shade100,
                    onTap: () {
                      _showServiceDetailsDialog(
                        context,
                        title: "Collaboration Médicale",
                        description:
                        "La collaboration médicale permet aux professionnels de santé de partager des informations et de coordonner les soins pour une prise en charge optimale.",
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Méthode pour afficher les détails du service
  void _showServiceDetailsDialog(BuildContext context, {required String title, required String description}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          content: Text(description),
        );
      },
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback? onTap;

  const ServiceCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade800,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.grey.shade600),
        ),
        trailing: Icon(Icons.chevron_right, color: Colors.blue.shade800),
        onTap: onTap,
      ),
    );
  }
}