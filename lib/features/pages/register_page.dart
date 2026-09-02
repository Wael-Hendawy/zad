import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isChecked = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("إنشاء حساب في زاد")),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 16,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "ZAD | زاد",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          Text("Egypt", style: TextStyle(fontSize: 18)),

                          SizedBox(width: 20),
                          Icon(Icons.language_rounded, size: 30),
                        ],
                      ),
                      const Text("أنشئ حسابك في زاد", style: TextStyle(fontSize: 24)),
                      RegisterTextFormField(
                        labelText: "الاسم الأول",
                        controller: _firstNameController,
                      ),
                      RegisterTextFormField(
                        labelText: "اسم العائلة",
                        controller: _lastNameController,
                      ),
                      RegisterTextFormField(
                        labelText: "البريد الإلكتروني",
                        controller: _emailController,
                      ),
                      RegisterTextFormFieldWithIcon(
                        lableText: "رقم الهاتف",
                        icon: Icons.abc_outlined,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Placeholder is required";
                          }
                          return null;
                        },
                      ),
                      RegisterTextFormFieldWithIcon(
                        lableText: "كلمة المرور",
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "كلمة المرور مطلوبة";
                          }
                          return null;
                        },
                        icon: Icons.access_alarms_sharp,
                      ),

                      const Divider(),

                      CheckboxMenuButton(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        value: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            _isChecked = value ?? false;
                          });
                        },
                        child: const Text("أوافق على الشروط والأحكام"),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.maybePop(context);
                          },
                          child: const Text(
                            "لديك حساب بالفعل؟",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.green,
                                    behavior: SnackBarBehavior.floating,
                                    content: Text(
                                      _emailController.text,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                );
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  '/',
                                  (route) => false,
                                );
                              }
                            },
                            child: const Text("إنشاء الحساب"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _emailController.clear();
                              _passwordController.clear();
                              _firstNameController.clear();
                              _lastNameController.clear();
                            },
                            child: const Text("مسح البيانات"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Wrap(
                alignment: WrapAlignment.center,
                spacing: 5,
                children: [
                  Text(
                    "الشروط والأحكام",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                  Text(
                    "الشروط والأحكام",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                  Text(
                    "الشروط والأحكام",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                  Text(
                    "الشروط والأحكام",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                  Text("&", style: TextStyle(fontSize: 16)),
                  Text(
                    "سياسة الخصوصية",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterTextFormField extends StatelessWidget {
  const RegisterTextFormField({
    super.key,
    required this.labelText,
    required this.controller,
    this.validator,
  });
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return "This field can not be empty";
            }

            return null;
          },
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.number,

      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.lightGreen),
        ),
      ),
    );
  }
}

class RegisterTextFormFieldWithIcon extends StatelessWidget {
  const RegisterTextFormFieldWithIcon({
    super.key,
    required this.lableText,
    required this.icon,
    this.controller,
    this.validator,
  });

  final String lableText;
  final IconData icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,

      decoration: InputDecoration(
        labelText: lableText,
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.lightGreen),
        ),
      ),
    );
  }
}

