import '../utils/import_export.dart';
import 'package:flutter/material.dart';

class CardView extends StatefulWidget {
  const CardView({super.key});
  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  final CardController _controller = CardController();
  final _companyController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _occupationController = TextEditingController();
  final _cityController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _websiteController = TextEditingController();

  void _submitAndOpenCard() {
    final newProfile = _controller.addProfile(
      _companyController.text,
      _nameController.text,
      _occupationController.text,
      _phoneController.text,
      _websiteController.text,
      _emailController.text,
      _cityController.text,
      _addressController.text,
    );
    //_clearForm();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VisitingCard(profile: newProfile),
      ),
    );
  }

  // void _clearForm() {
  //   _companyController.clear();
  //   _nameController.clear();
  //   _emailController.clear();
  //   _occupationController.clear();
  //   _cityController.clear();
  //   _addressController.clear();
  //   _phoneController.clear();
  //   _websiteController.clear();
  // }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ADD_VISITING_CARD),
        backgroundColor: Colors.brown.shade400,
        elevation: 3,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            TextField(
              controller: _companyController,
              decoration: _inputDecoration(USER_COMPANY_NAME),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: _inputDecoration(USER_NAME),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: _inputDecoration(USER_EMAIL),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _occupationController,
              decoration: _inputDecoration(USER_OCCUPATION),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _cityController,
              decoration: _inputDecoration(USER_CITY),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _addressController,
              maxLines: 2,
              decoration: _inputDecoration(USER_ADDRESS),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: _inputDecoration(PHONE),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _websiteController,
              keyboardType: TextInputType.url,
              decoration: _inputDecoration(WEBSITE),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _submitAndOpenCard,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 4,
                ),
                child: Text(
                  SUBMIT_BTN,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
