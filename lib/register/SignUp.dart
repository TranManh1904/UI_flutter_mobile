import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isChecked = false;
  bool _isCheckedRobot = false;
  bool _isHide = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(20),
            // color: Colors.black,
            // height: double.infinity,
            // width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  'Sign up for free to access to in any of our products',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                ),
                const SizedBox(
                  height: 20,
                ),
                //TextFormField Email, password
                Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email address',
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey.shade700)),
                        const SizedBox(
                          height: 3,
                        ),
                        TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email không được để trống";
                            } else if (!RegExp(
                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                              return "Email không đúng định dạng";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade700),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade700),
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Password',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.grey.shade700)),
                            //hide
                            InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  _isHide = !_isHide;
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    _isHide
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.grey.shade800,
                                    size: 25,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(_isHide ? 'Show' : 'Hide',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey.shade700))
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        TextFormField(
                          obscureText: _isHide,
                          controller: _passwordController,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Vui lòng nhập mật khẩu';
                            } else if (value.length < 6) {
                              return 'Mật khẩu phải có ít nhất 6 ký tự';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade700),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade700),
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                            'Use 8 or more characters with a mix of letters, numbers & symbols',
                            style: TextStyle(
                                fontSize: 11, color: Colors.grey.shade700)),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                Row(
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          _isChecked = !_isChecked;
                        });
                      },
                      child: Icon(
                        _isChecked
                            ? Icons.check_box_rounded
                            : Icons.check_box_outlined,
                        color: _isChecked ? Colors.black : Colors.grey.shade800,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    //Agree to our Terms of use and Privacy Policy
                    RichText(
                      text: TextSpan(
                          text: 'Agree to our ',
                          style: TextStyle(
                              fontSize: 13, color: Colors.grey.shade800),
                          children: [
                            TextSpan(
                                text: 'Terms of use ',
                                style: TextStyle(
                                  fontSize: 13,
                                  decoration: TextDecoration.underline,
                                  color: Colors.grey.shade800,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('Terms of use');
                                  }),
                            TextSpan(
                              text: 'and ',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                  fontSize: 13,
                                  decoration: TextDecoration.underline,
                                  color: Colors.grey.shade800,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('Privacy Policy');
                                  })
                          ]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          _isChecked = !_isChecked;
                        });
                      },
                      child: Icon(
                        _isChecked
                            ? Icons.check_box_rounded
                            : Icons.check_box_outlined,
                        color: _isChecked ? Colors.black : Colors.grey.shade800,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text('Subscribe to our monthly newsletter',
                        style: TextStyle(
                            fontSize: 13, color: Colors.grey.shade700))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ), // Robot
                Container(
                  height: 55,
                  width: 280,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 15),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              _isCheckedRobot = !_isCheckedRobot;
                            });
                          },
                          child: Row(
                            children: [
                              Icon(
                                _isCheckedRobot
                                    ? Icons.check_box_rounded
                                    : Icons.check_box_outlined,
                                color: _isCheckedRobot
                                    ? Colors.green
                                    : Colors.green,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text('I’m not a robot'),
                            ],
                          ),
                        ),
                      ),
                      // image i'm not robots
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                // create acount
                Column(
                  children: [
                    InkWell(
                      onTap: _onHandleLoginSubmit,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            color: Colors.grey.shade400),
                        width: 180,
                        height: 55,
                        child: const Text(
                          'Sign Up',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Already have an ccount? ',
                          style: TextStyle(
                              fontSize: 13, color: Colors.grey.shade800),
                          children: [
                            TextSpan(
                                text: 'Login',
                                style: TextStyle(
                                  fontSize: 13,
                                  decoration: TextDecoration.underline,
                                  color: Colors.grey.shade800,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('Login');
                                  })
                          ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onHandleLoginSubmit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
      //call api
      print('sign up');
    } else {}
  }
}
