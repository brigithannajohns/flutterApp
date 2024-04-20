import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

Widget logoImage(String fileName) {
  return Container(
    width: 90,
    height: 90,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        fileName,
        fit: BoxFit.cover,
      ),
    ),
  );
}

TextField reusableTextField(String text, IconData icon,
    bool isPasswordController, TextEditingController controller) {
  return TextField(
      controller: controller,
      obscureText: isPasswordController,
      enableSuggestions: !isPasswordController,
      autocorrect: !isPasswordController,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white.withOpacity(0.9)),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white70),
        labelText: text,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
      keyboardType: isPasswordController
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress);
}

Container signinSignupButton(
    BuildContext context, bool islogin, Function ontap) {
  return Container(
    width: 100,
    height: 50,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        ontap();
      },
      child: Text(
        islogin ? 'LogIn' : 'Signup',
        style: TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return Colors.white;
        } else {
          return Colors.black;
        }
      })),
    ),
  );
}
