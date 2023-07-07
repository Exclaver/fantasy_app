import 'package:fantasyapp/widgets/app_text.dart';
import 'package:flutter/material.dart';

class CategoryContainer extends StatefulWidget {
  const CategoryContainer({
    super.key,
    required this.text,
    this.onPressed,
    required this.isSelected,
  });
  final String text;
  final void Function()? onPressed;
  final bool isSelected;

  @override
  State<CategoryContainer> createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: widget.isSelected
                ? Colors.deepPurple
                : const Color.fromARGB(106, 120, 73, 202),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          onPressed: widget.onPressed,
          child: Center(
            child: AppText(
              text: widget.text,
              color: Colors.white,
              size: 17,
            ),
          ),
        ));
  }
}
