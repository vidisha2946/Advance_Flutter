import 'package:flutter/material.dart';
import 'package:crud/Lab_3/db/user_controller_with_db.dart';
import 'package:crud/Lab_3/db/user_model.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  final UserControllerwithdb _controller = UserControllerwithdb();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool isEdit = false;
  int? editId;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await _controller.initDatabase();
    await _controller.displayUser();
    setState(() {});
  }

  void resetForm() {
    nameController.clear();
    emailController.clear();
    isEdit = false;
    editId = null;
  }

  void onSave() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    if (name.isEmpty || email.isEmpty) return;

    if (isEdit) {
      await _controller.editUser(UserModelDB(id: editId, name: name, email: email));
    } else {
      await _controller.addUser(UserModelDB(name: name, email: email));
    }

    resetForm();
    Navigator.pop(context); // Close the bottom sheet
    setState(() {});
  }

  void showUserForm({UserModelDB? user}) {
    if (user != null) {
      isEdit = true;
      editId = user.id;
      nameController.text = user.name!;
      emailController.text = user.email!;
    } else {
      resetForm();
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isEdit ? "Edit User" : "Add User",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: onSave,
              child: Text(isEdit ? "Update" : "Add"),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User DB CRUD"),
        backgroundColor: Colors.pinkAccent.shade100,
      ),
      body: _controller.getUser.isEmpty
          ? const Center(child: Text("No users found"))
          : ListView.builder(
        itemCount: _controller.getUser.length,
        itemBuilder: (context, index) {
          final user = _controller.getUser[index];
          return ListTile(
            title: Text(user.name ?? ''),
            subtitle: Text(user.email ?? ''),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => showUserForm(user: user),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () async {
                    await _controller.deleteUser(user);
                    await _controller.displayUser();
                    setState(() {});
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent.shade100,
        child: const Icon(Icons.add),
        onPressed: () {
          showUserForm(); // Open form for Add
        },
      ),
    );
  }
}
