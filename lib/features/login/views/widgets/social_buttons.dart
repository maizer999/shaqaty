import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _socialBtn('Google', size),
        _socialBtn('Facebook', size),
      ],
    );
  }

  Widget _socialBtn(String label, Size size) {
    return Container(
      width: size.width * 0.4,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.white),
      ),
      child: Center(
        child: Text(label, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
