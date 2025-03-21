import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Énumération des types d'utilisateurs
enum UserType { migrant, professionalSante, ong }

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with SingleTickerProviderStateMixin {
  // Clé pour le formulaire
  final _formKey = GlobalKey<FormState>();

  // Contrôleurs d'animation
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  // Contrôleurs de texte
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Variables d'état
  UserType? _selectedUserType;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Configuration de l'animation
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    // Libération des ressources
    _animationController.dispose();
    _nomController.dispose();
    _prenomController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // Méthodes de validation
  String? _validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre $fieldName';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre email';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Veuillez entrer un email valide';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre numéro de téléphone';
    }
    final phoneRegex = RegExp(r'^\+?[\d\s-]{8,}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Veuillez entrer un numéro de téléphone valide';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre mot de passe';
    }
    if (value.length < 8) {
      return 'Le mot de passe doit contenir au moins 8 caractères';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez confirmer votre mot de passe';
    }
    if (value != _passwordController.text) {
      return 'Les mots de passe ne correspondent pas';
    }
    return null;
  }

  // Méthode de gestion de l'inscription
  Future<void> _handleSignUp() async {
    // Validation du formulaire
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Vérification du type d'utilisateur
    if (_selectedUserType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez sélectionner votre type de profil'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Début du chargement
    setState(() => _isLoading = true);

    try {
      // Simulation de l'inscription
      await Future.delayed(const Duration(seconds: 2));

      if (!mounted) return;

      // Succès de l'inscription
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Inscription réussie !'),
          backgroundColor: Colors.green,
        ),
      );

      // Retour à la page précédente
      Navigator.pop(context);

    } catch (e) {
      // Gestion des erreurs
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur lors de l\'inscription: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      // Fin du chargement
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // En-tête
                Text(
                  'Créer un compte',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Choisissez votre type de profil',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 32),

                // Sélecteur de type d'utilisateur
                _buildUserTypeSelector(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Construction du sélecteur de type d'utilisateur
  Widget _buildUserTypeSelector() {
    return Column(
      children: UserType.values.map((type) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: _selectedUserType == type
                      ? Colors.blue[50]
                      : Colors.grey[100],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: _selectedUserType == type
                          ? Colors.blue[300]!
                          : Colors.transparent,
                      width: 2
                  ),
                ),
                child: _buildUserTypeOption(
                  type,
                  _getTitle(type),
                  _getDescription(type),
                  _getIcon(type),
                ),
              ),
              // Ajout du formulaire conditionnel
              if (_selectedUserType == type)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  padding: const EdgeInsets.only(top: 16),
                  child: _buildSignUpForm(),
                ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // Construction d'une option de type d'utilisateur
  Widget _buildUserTypeOption(UserType type, String title, String description, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue[700], size: 36),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue[800],
        ),
      ),
      subtitle: Text(description),
      trailing: Radio<UserType>(
        value: type,
        groupValue: _selectedUserType,
        onChanged: (UserType? value) {
          setState(() {
            _selectedUserType = _selectedUserType == value ? null : value;
          });
        },
        activeColor: Colors.blue[700],
      ),
      onTap: () {
        setState(() {
          _selectedUserType = _selectedUserType == type ? null : type;
        });
      },
    );
  }

  // Construction du formulaire d'inscription
  Widget _buildSignUpForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Champs de saisie
          _buildTextField(
            controller: _nomController,
            label: 'Nom',
            validator: (value) => _validateRequired(value, 'nom'),
          ),
          const SizedBox(height: 16),

          _buildTextField(
            controller: _prenomController,
            label: 'Prénom',
            validator: (value) => _validateRequired(value, 'prénom'),
          ),
          const SizedBox(height: 16),

          _buildTextField(
            controller: _emailController,
            label: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: _validateEmail,
          ),
          const SizedBox(height: 16),

          _buildTextField(
            controller: _phoneController,
            label: 'Numéro de téléphone',
            keyboardType: TextInputType.phone,
            validator: _validatePhone,
          ),
          const SizedBox(height: 16),

          // Champs de mot de passe
          _buildPasswordField(
            controller: _passwordController,
            label: 'Mot de passe',
            obscureText: _obscurePassword,
            onToggleVisibility: () => setState(() => _obscurePassword = !_obscurePassword),
            validator: _validatePassword,
          ),
          const SizedBox(height: 16),

          _buildPasswordField(
            controller: _confirmPasswordController,
            label: 'Confirmer le mot de passe',
            obscureText: _obscureConfirmPassword,
            onToggleVisibility: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
            validator: _validateConfirmPassword,
          ),
          const SizedBox(height: 32),

          // Bouton d'inscription
          ElevatedButton(
            onPressed: _isLoading ? null : _handleSignUp,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[700],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: _isLoading
                ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
                : const Text(
              'S\'inscrire',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Méthodes utilitaires pour les titres, descriptions et icônes
  String _getTitle(UserType type) {
    switch (type) {
      case UserType.migrant:
        return 'Migrant';
      case UserType.professionalSante:
        return 'Professionnel de santé';
      case UserType.ong:
        return 'ONG';
    }
  }

  String _getDescription(UserType type) {
    switch (type) {
      case UserType.migrant:
        return 'Pour les personnes en situation de migration';
      case UserType.professionalSante:
        return 'Pour les médecins et personnels soignants';
      case UserType.ong:
        return 'Pour les organisations non gouvernementales';
    }
  }

  IconData _getIcon(UserType type) {
    switch (type) {
      case UserType.migrant:
        return Icons.person;
      case UserType.professionalSante:
        return Icons.medical_services;
      case UserType.ong:
        return Icons.group;
    }
  }

  // Méthode de construction de champ de texte standard
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.grey[100],
      ),
      keyboardType: keyboardType,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  // Méthode de construction de champ de mot de passe
  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required bool obscureText,
    required VoidCallback onToggleVisibility,
    required String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.grey[100],
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: onToggleVisibility,
        ),
      ),
      obscureText: obscureText,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}