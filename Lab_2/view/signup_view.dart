import '../controller/signup_controller.dart';
import '../utils/import_export.dart';
class SignupView extends StatefulWidget {
  const SignupView({super.key});
  @override
  State<SignupView> createState() => _SignupViewState();
}
class _SignupViewState extends State<SignupView> {
  final SignUpController _controller = SignUpController();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  String? _nameError;
  String? _emailError;
  String? _passwordError;

  void _submit() {
    setState(() {
      _nameError = _controller.validatename(_nameCtrl.text);
      _emailError = _controller.validateemail(_emailCtrl.text);
      _passwordError = _controller.validatepassword(_passwordCtrl.text);
    });
    if (_nameError == null && _emailError == null && _passwordError == null) {
      _controller.saveuser(
        _nameCtrl.text,
        _emailCtrl.text,
        _passwordCtrl.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Signup Successful")),
      );

      _nameCtrl.clear();
      _emailCtrl.clear();
      _passwordCtrl.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Signup')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameCtrl,
              decoration: InputDecoration(
                labelText: 'Name',
                errorText: _nameError,
              ),
            ),
            TextField(
              controller: _emailCtrl,
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: _emailError,
              ),
            ),
            TextField(
              controller: _passwordCtrl,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: _passwordError,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
