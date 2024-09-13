import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatelessWidget {
  const InternetExceptionWidget({
    super.key,
    this.onPress,
  });

  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.15,
        ),
        const Icon(
          Icons.cloud_off,
          color: Colors.red,
          size: 50,
        ),
        const Text(
          "We're unable to show results. Please check your data connection.",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        ElevatedButton(
          onPressed: onPress,
          child: const Text("Retry"),
        ),
      ],
    );
  }
}
