import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

void main() {
  runApp(
    const MaterialApp(
      home: CompleteProfileScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _nameController = TextEditingController(
    text: "Ahrar Qamar",
  );
  final TextEditingController _emailController = TextEditingController();

  // final TextEditingController _genderController = TextEditingController();
  String? fullPhoneNumber;

  // Store submitted data
  String? name;
  String? email;
  String? gender;
  String? _selectedGender;

  void _submitProfile() {
    setState(() {
      name = _nameController.text;
      email = _emailController.text;
      gender = _selectedGender;
    });

    if (fullPhoneNumber == null || email!.isEmpty || gender!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please complete all fields")),
      );
      return;
    }

    print("Name: $name");
    print("Email: $email");
    print("Phone Number: $fullPhoneNumber");
    print("Gender: $gender");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile completed successfully!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'Complete Your Profile',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Don’t worry only you can see your personal data. No one else will be able to see it',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.bottomRight,
                children: const [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Color(0xFFEDEDED),
                    child: Icon(Icons.person, size: 50, color: Colors.grey),
                  ),
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.edit, size: 16, color: Colors.blue),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              /// Name
              const Align(alignment: Alignment.centerLeft, child: Text('Name')),
              const SizedBox(height: 5),
              TextField(
                controller: _nameController,
                enabled: false,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFF2F4F7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              /// Email
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Email'),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  filled: true,
                  fillColor: const Color(0xFFF2F4F7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              /// Phone
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Phone Number'),
              ),
              const SizedBox(height: 5),
              IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  filled: true,
                  fillColor: const Color(0xFFF2F4F7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                initialCountryCode: 'US',
                onChanged: (phone) {
                  setState(() {
                    fullPhoneNumber = phone.completeNumber;
                  });
                },
              ),
              const SizedBox(height: 15),

              /// Gender
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Gender'),
              ),
              const SizedBox(height: 5),
              // TextField(
              //   controller: _genderController,
              //   decoration: InputDecoration(
              //     hintText: 'Gender',
              //     filled: true,
              //     fillColor: const Color(0xFFF2F4F7),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(8),
              //       borderSide: BorderSide.none,
              //     ),
              //   ),
              // ),
              DropdownButtonFormField<String>(
                value: _selectedGender,
                items:
                    ['Male', 'Female', 'Other']
                        .map(
                          (gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFF2F4F7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              /// Submit Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF007AFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text('Complete Profile'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
//
// class CompleteProfileScreen extends StatefulWidget {
//   const CompleteProfileScreen({super.key});
//
//   @override
//   State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
// }
//
// class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
//   final TextEditingController _nameController = TextEditingController(
//     text: "Ahrar Qamar",
//   );
//   final TextEditingController _phoneController = TextEditingController();
//   String? _selectedGender;
//
//   // Store submitted data
//   String? name;
//   String? phoneNumber;
//   String? gender;
//
//   void _submitProfile() {
//     setState(() {
//       name = _nameController.text;
//       phoneNumber = _phoneController.text;
//       gender = _selectedGender;
//     });
//
//     // For now just print to console
//     print("Name: $name");
//     print("Phone Number: $phoneNumber");
//     print("Gender: $gender");
//
//     // You can also show a snackbar or navigate from here
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const BackButton(),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             children: [
//               const Text(
//                 'Edit',
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 'Don’t worry only you can see your personal data. No one else will be able to see it',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(color: Colors.grey),
//               ),
//               const SizedBox(height: 20),
//               Stack(
//                 alignment: Alignment.bottomRight,
//                 children: const [
//                   CircleAvatar(
//                     radius: 45,
//                     backgroundColor: Color(0xFFEDEDED),
//                     child: Icon(Icons.person, size: 50, color: Colors.grey),
//                   ),
//                   CircleAvatar(
//                     radius: 14,
//                     backgroundColor: Colors.white,
//                     child: Icon(Icons.edit, size: 16, color: Colors.blue),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 30),
//               const Align(alignment: Alignment.centerLeft, child: Text('Name')),
//               const SizedBox(height: 5),
//               TextField(
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: const Color(0xFFF2F4F7),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 15),
//               const Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text('Phone Number'),
//               ),
//               const SizedBox(height: 5),
//               IntlPhoneField(
//                 decoration: InputDecoration(
//                   labelText: 'Phone Number',
//                   filled: true,
//                   fillColor: const Color(0xFFF2F4F7),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//                 initialCountryCode: 'US',
//                 // You can change this to 'EG', 'IN', etc.
//                 onChanged: (phone) {
//                   setState(() {
//                     phoneNumber = phone.completeNumber;
//                   });
//                   print("Full Phone Number: ${phone.completeNumber}");
//                 },
//               ),
//               const SizedBox(height: 15),
//               const Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text('Gender'),
//               ),
//               const SizedBox(height: 5),
//               DropdownButtonFormField<String>(
//                 value: _selectedGender,
//                 items:
//                     ['Male', 'Female', 'Other']
//                         .map(
//                           (gender) => DropdownMenuItem(
//                             value: gender,
//                             child: Text(gender),
//                           ),
//                         )
//                         .toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedGender = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: const Color(0xFFF2F4F7),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: _submitProfile,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF007AFF),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                   ),
//                   child: const Text(
//                     'Submit',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
