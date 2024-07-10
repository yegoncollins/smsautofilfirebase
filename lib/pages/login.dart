import 'package:flutter/material.dart';
import 'package:smsautofilfirebase/controllers/auth_service.dart';
import 'package:smsautofilfirebase/pages/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: Image.asset("assets/login.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const Text(
                      'Hi Welcome Back',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text("Enter your phone number to continue."),
                    const SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefixText: "+254",
                          labelText: "Enter your phone number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.length != 10) {
                            return "Invalid phone number";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            AuthService.sentOtp(
                              phone: _phoneController.text,
                              errorStep: () =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Error in sending OTP",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              ),
                              nextStep: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text("OTP Verification"),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Text("Enter 6 digit OTP"),
                                          const SizedBox(height: 12),
                                          Form(
                                            key: _formKey1,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: _otpController,
                                              decoration: InputDecoration(
                                                labelText: "Enter OTP",
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(32),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.length != 6) {
                                                  return "Invalid OTP";
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            AuthService.loginWithOtp(
                                                    otp: _otpController.text)
                                                .then((value) {
                                              Navigator.pop(context);
                                              if (value == "Success") {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Home()),
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      value,
                                                      style: const TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    backgroundColor: Colors.red,
                                                  ),
                                                );
                                              }
                                            });
                                          }
                                        },
                                        child: const Text("Submit"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: Text("Send OTP"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
