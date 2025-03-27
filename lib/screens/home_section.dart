import 'package:flutter/material.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({Key? key}) : super(key: key);

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
                // En-tête avec salutation
                _buildHeader(),

                const SizedBox(height: 24),

                // Carte de rendez-vous
                _buildAppointmentCard(),

                const SizedBox(height: 24),

                // Barre de recherche
                _buildSearchBar(),

                const SizedBox(height: 24),

                // Catégories de services
                _buildServiceCategories(),

                const SizedBox(height: 24),

                // Titre "Médecin à proximité"
                Text(
                  'dernière consultation ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),

                const SizedBox(height: 16),

                // Carte du médecin à proximité
                _buildNearDoctorCard(),
              ],
            ),
          ),
        ),
      ),
      // Barre de navigation inférieure
    );
  }

  // En-tête avec salutation
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bonjour,',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            Text(
              'Salut test Hilot',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
          ],
        ),
        CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Icon(
            Icons.person,
            color: Colors.blue[800],
          ),
        ),
      ],
    );
  }

  // Carte de rendez-vous
  Widget _buildAppointmentCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[500],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr. zakariae',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'medecin généraliste',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.white, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    'vendredi, 28 mars',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.access_time, color: Colors.white, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    '11:00 - 12:00h',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.chevron_right,
            color: Colors.white,
            size: 30,
          ),
        ],
      ),
    );
  }

  // Barre de recherche
  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'trouver votre medecin',
        hintStyle: TextStyle(color: Colors.grey[500]),
        prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Catégories de services
  Widget _buildServiceCategories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildServiceCategory(Icons.coronavirus, 'Covid 19'),
        _buildServiceCategory(Icons.medical_services, 'Doctor'),
        _buildServiceCategory(Icons.medication, 'Medicine'),
        _buildServiceCategory(Icons.local_hospital, 'Hospital'),
      ],
    );
  }

  // Catégorie de service individuelle
  Widget _buildServiceCategory(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Icon(icon, color: Colors.blue[800]),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(color: Colors.grey[600]),
        ),
      ],
    );
  }

  // dérnière consultation
  Widget _buildNearDoctorCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue[100],
            child: Icon(Icons.person, color: Colors.blue[800]),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr. **nom**',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Dentiste',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    '4.8 (120 Reviews)',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'dispo apres  17:00',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ),
    );
  }


}