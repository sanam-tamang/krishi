// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
    required this.controller,
    this.focusNode,
    this.onChanged,
    required this.onSubmit,
    required this.hintText,
  }) : super(key: key);
  final TextEditingController controller;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final VoidCallback onSubmit;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildSearchBox(context)),
        IconButton(
            onPressed: () {
              controller.clear();
            },
            icon: const Icon(Icons.close))
      ],
    );
  }

  Container _buildSearchBox(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        onChanged: onChanged,
        onEditingComplete: () => onSubmit,
        onSubmitted: (data) => onSubmit,
        decoration: InputDecoration(
            suffixIcon:
                IconButton(onPressed: onSubmit, icon: const Icon(Icons.search)),
            hintText: hintText,
            border: InputBorder.none),
      ),
    );
  }
}
