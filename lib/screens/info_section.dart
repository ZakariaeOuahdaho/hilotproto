import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: const Text(
          'E-ilot',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Back to the previous page
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            "Our Services",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ServiceCard(
            icon: Icons.health_and_safety,
            title: "Prévention",
            subtitle: "Anticiper & Protéger",
            color: Colors.blue.shade200,
            onTap: () {
              _showServiceDetailsDialog(
                context,
                title: "Prévention",
                description:
                "La prévention est essentielle pour anticiper les risques et protéger votre santé. Nous vous accompagnons avec des conseils personnalisés et des outils pour rester en bonne santé.",
              );
            },
          ),
          const SizedBox(height: 20),
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
          const SizedBox(height: 20),
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
          const SizedBox(height: 20),
          const Spacer(), // Pushes the button to the bottom
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Add login functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade800,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }

  // Function to show the service details dialog
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
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
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
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}