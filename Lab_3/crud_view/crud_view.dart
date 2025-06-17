import 'package:flutter/material.dart';
import '../utils/impoer_export.dart'; // Ensure your import path is correct

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CrudView(),
  ));
}

class CrudView extends StatefulWidget {
  const CrudView({super.key});

  @override
  State<CrudView> createState() => _CrudViewState();
}

class _CrudViewState extends State<CrudView> {
  TextEditingController nameController = TextEditingController();
  UserCrudController _userController = UserCrudController();
  late UserModel temp;
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("User Manager"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// Input Field
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Enter Name", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Enter your name",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (isEdit) {
                          _userController.editUser(
                            temp,
                            UserModel(name: nameController.text.toString()),
                          );
                          isEdit = false;
                        } else {
                          _userController.addUser(
                            UserModel(name: nameController.text.toString()),
                          );
                        }
                        nameController.clear();
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isEdit ? Colors.orange : Colors.blue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Text(
                        isEdit ? "Update User" : "Add User",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// List of Users
            Expanded(
              child: _userController.getUser.isEmpty
                  ? const Center(child: Text("No users added yet."))
                  : ListView.builder(
                itemCount: _userController.getUser.length,
                itemBuilder: (context, index) {
                  var user = _userController.getUser[index];
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    elevation: 3,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue.shade200,
                        child: Text(user.name![0].toUpperCase()),
                      ),
                      title: Text(user.name!),
                      trailing: Wrap(
                        spacing: 8,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              temp = user;
                              isEdit = true;
                              nameController.text = temp.name!;
                              setState(() {});
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _userController.deleteUser(user);
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
