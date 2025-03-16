import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.textbutton, required this.onpressed, this.isLoading=false});
  final String textbutton;
  final VoidCallback onpressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          minimumSize: Size(400, 45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        onPressed: onpressed,
        child: isLoading == true ? CircularProgressIndicator(color: Colors.white,) : Text(
          textbutton,
          style: TextStyle(
              fontSize: 24,  color: Colors.white),
        ),
      ),
    );
  }
}
