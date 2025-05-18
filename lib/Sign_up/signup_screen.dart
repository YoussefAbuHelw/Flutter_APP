import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sectiontasks/Sign_up/signup_view_model.dart';

import '../login/login_screen.dart';
import '../login/login_view_model.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignUpViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
          centerTitle: true,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primaryContainer,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Consumer<SignUpViewModel>(
            builder: (context, viewModel, child) {
              return SingleChildScrollView(
                child: Center(
                  child: Form(
                    key: viewModel.formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 16),
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.2),
                          child: Icon(
                            Icons.person_add,
                            size: 50,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Create your account',
                          style: Theme.of(
                            context,
                          ).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 32),
                        _buildTextField(
                          context,
                          controller: null,
                          label: 'Name',
                          icon: Icons.person_outline,
                          validator: viewModel.validateName,
                          onSaved:
                              (value) => viewModel.user.name = value!.trim(),
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          context,
                          controller: null,
                          label: 'Email',
                          icon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                          validator: viewModel.validateEmail,
                          onSaved:
                              (value) => viewModel.user.email = value!.trim(),
                        ),
                        const SizedBox(height: 20),
                        PasswordField(
                          validator: viewModel.validatePassword,
                          onSaved: (value) => viewModel.user.password = value!,
                        ),
                        const SizedBox(height: 36),
                        _buildSignUpButton(context, viewModel),
                        const SizedBox(height: 24),
                        _buildLoginOption(context),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    required FormFieldValidator<String>? validator,
    required FormFieldSetter<String>? onSaved,
    TextEditingController? controller,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Theme.of(context).colorScheme.primary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        floatingLabelStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
      ),
      keyboardType: keyboardType,
      validator: validator,
      onSaved: onSaved,
      textInputAction: TextInputAction.next,
    );
  }

  // Widget _buildSignUpButton(BuildContext context, SignUpViewModel viewModel) {
  //   return SizedBox(
  //     width: double.infinity,
  //     height: 50,
  //     child: ElevatedButton(
  //       onPressed: () async {
  //         bool x = await viewModel.submit(() {
  //           print('Registered User:');
  //           print('Name: ${viewModel.user.name}');
  //           print('Email: ${viewModel.user.email}');
  //           ScaffoldMessenger.of(context)
  //             ..removeCurrentSnackBar()
  //             ..showSnackBar(
  //               SnackBar(
  //                 content: Text(
  //                   viewModel.errorMessage ?? 'Registration successful!',
  //                   style: TextStyle(color: Colors.white),
  //                 ),
  //                 behavior: SnackBarBehavior.floating,
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(10),
  //                 ),
  //                 backgroundColor: Theme.of(context).colorScheme.primary,
  //                 duration: Duration(seconds: 2),
  //               ),
  //             );
  //         });
  //         if (x) {
  //           Navigator.pushReplacement(
  //             context,
  //             MaterialPageRoute(builder: (context) => LoginScreen()),
  //           );
  //         }
  //       },
  //       style: ElevatedButton.styleFrom(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(12),
  //         ),
  //         elevation: 4,
  //         textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //         padding: const EdgeInsets.symmetric(vertical: 14),
  //         backgroundColor: Theme.of(context).colorScheme.primary,
  //         foregroundColor: Theme.of(context).colorScheme.onPrimary,
  //       ),
  //       child: const Text('Sign Up'),
  //     ),
  //   );
  // }

  Widget _buildSignUpButton(BuildContext context, SignUpViewModel viewModel) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          bool x = await viewModel.submit(() {
            print('Registered User:');
            print('Name: ${viewModel.user.name}');
            print('Email: ${viewModel.user.email}');
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    viewModel.errorMessage ?? 'Registration successful!',
                    style: TextStyle(color: Colors.white),
                  ),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  duration: Duration(seconds: 2),
                ),
              );
          });
          if (x) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder:
                    (_) => ChangeNotifierProvider(
                      create: (_) => LoginViewModel(),
                      child: LoginScreen(),
                    ),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          padding: const EdgeInsets.symmetric(vertical: 14),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
        child: const Text('Sign Up'),
      ),
    );
  }

  Widget _buildLoginOption(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (_) => ChangeNotifierProvider(
                      create: (_) => LoginViewModel(),
                      child: LoginScreen(),
                    ),
              ),
            );
          },
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.primary,
          ),
          child: const Text('Log In'),
        ),
      ],
    );
  }
}

class PasswordField extends StatefulWidget {
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;

  const PasswordField({this.validator, this.onSaved, Key? key})
    : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(
          Icons.lock_outline,
          color: Theme.of(context).colorScheme.primary,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility_off : Icons.visibility,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
        floatingLabelStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
      ),
      obscureText: _obscurePassword,
      validator: widget.validator,
      onSaved: widget.onSaved,
      textInputAction: TextInputAction.done,
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sectiontasks/Sign_up/signup_view_model.dart';
//
// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => SignUpViewModel(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Sign Up'),
//           centerTitle: true,
//           elevation: 2,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//           child: Consumer<SignUpViewModel>(
//             builder: (context, viewModel, child) {
//               return SingleChildScrollView(
//                 child: Center(
//                   child: Form(
//                     key: viewModel.formKey,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           'Create your account',
//                           style: Theme.of(context).textTheme.titleLarge
//                               ?.copyWith(fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(height: 32),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             labelText: 'Name',
//                             prefixIcon: const Icon(Icons.person_outline),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: BorderSide(
//                                 color: Theme.of(context).colorScheme.primary,
//                                 width: 2,
//                               ),
//                             ),
//                           ),
//                           validator: viewModel.validateName,
//                           onSaved:
//                               (value) => viewModel.user.name = value!.trim(),
//                           textInputAction: TextInputAction.next,
//                         ),
//                         const SizedBox(height: 20),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             labelText: 'Email',
//                             prefixIcon: const Icon(Icons.email_outlined),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: BorderSide(
//                                 color: Theme.of(context).colorScheme.primary,
//                                 width: 2,
//                               ),
//                             ),
//                           ),
//                           keyboardType: TextInputType.emailAddress,
//                           validator: viewModel.validateEmail,
//                           onSaved:
//                               (value) => viewModel.user.email = value!.trim(),
//                           textInputAction: TextInputAction.next,
//                         ),
//                         const SizedBox(height: 20),
//
//                         PasswordField(
//                           validator: viewModel.validatePassword,
//                           onSaved: (value) => viewModel.user.password = value!,
//                         ),
//
//                         const SizedBox(height: 36),
//                         SizedBox(
//                           width: double.infinity,
//                           height: 48,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               viewModel.submit(() {
//                                 print('Registered User:');
//                                 print('Name: ${viewModel.user.name}');
//                                 print('Email: ${viewModel.user.email}');
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                     content: Text('Registration successful!'),
//                                   ),
//                                 );
//                               });
//                             },
//                             style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               elevation: 4,
//                               textStyle: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             child: const Text('Sign Up'),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class PasswordField extends StatefulWidget {
//   final FormFieldValidator<String>? validator;
//   final FormFieldSetter<String>? onSaved;
//
//   const PasswordField({this.validator, this.onSaved, Key? key})
//     : super(key: key);
//
//   @override
//   State<PasswordField> createState() => _PasswordFieldState();
// }
//
// class _PasswordFieldState extends State<PasswordField> {
//   bool _obscurePassword = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       decoration: InputDecoration(
//         labelText: 'Password',
//         prefixIcon: const Icon(Icons.lock_outline),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//         suffixIcon: IconButton(
//           icon: Icon(
//             _obscurePassword ? Icons.visibility_off : Icons.visibility,
//           ),
//           onPressed: () {
//             setState(() {
//               _obscurePassword = !_obscurePassword;
//             });
//           },
//         ),
//       ),
//       obscureText: _obscurePassword,
//       validator: widget.validator,
//       onSaved: widget.onSaved,
//       textInputAction: TextInputAction.done,
//     );
//   }
// }
