import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixelsapp/core/presentation/widgets/qtext.dart';


class CustomInputDecoration {
  final String? hint;
  final String? label;
  final double? borderraduis;

  CustomInputDecoration({
    this.hint,
    this.label,
    this.borderraduis,
  });

  ///outline decoration
  outlineBorder() {
    return InputDecoration(
      fillColor: Colors.grey.shade100,
      filled: true,
      hintText: hint,
      label: label != null ? QText(label!) : null,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade100,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderraduis ?? 50),
        borderSide: BorderSide(
          color: Colors.grey.shade200,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderraduis ?? 50),
        borderSide: BorderSide(
          color: Colors.grey.shade200,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderraduis ?? 50),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderraduis ?? 50),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
    );
  }

  ///outline decoration with icon
  outlineBorderWithIcon(String icon) {
    return InputDecoration(
      fillColor: Colors.grey.shade100,
      filled: true,
      hintText: hint,
      label: label != null ? QText(label!) : null,
      labelStyle: TextStyle(color: Colors.black, fontSize: 10),
      hintStyle: GoogleFonts.plusJakartaSans(
          color: Colors.black87, fontWeight: FontWeight.w500),
      prefixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Image.asset(
              icon,
              height: 21,
            ),
          ),
          const SizedBox(
            height: 38,
            child: VerticalDivider(width: 1, thickness: 1),
          ),
          const SizedBox(
            width: 8,
          )
        ],
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
    );
  }
}
