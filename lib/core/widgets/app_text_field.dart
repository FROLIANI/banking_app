import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final String hint;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  /// ✅ floating validation error under input
  final String? errorText;

  /// Optional
  final TextInputAction textInputAction;
  final Iterable<String>? autofillHints;

  const AppTextField({
    super.key,
    required this.hint,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.onChanged,
    this.errorText,
    this.textInputAction = TextInputAction.next,
    this.autofillHints,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final FocusNode _focusNode;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocus);
  }

  void _handleFocus() {
    if (!mounted) return;
    setState(() => _focused = _focusNode.hasFocus);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocus);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasError = (widget.errorText != null && widget.errorText!.trim().isNotEmpty);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            color: const Color(0xFFEFF6F6),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: hasError
                  ? const Color(0xFFE53935)
                  : _focused
                  ? const Color(0xFF4B5CC4)
                  : Colors.transparent,
              width: hasError || _focused ? 1.2 : 1.0,
            ),
            boxShadow: _focused && !hasError
                ? [
              BoxShadow(
                color: const Color(0xFF4B5CC4).withOpacity(0.18),
                blurRadius: 14,
                spreadRadius: 0,
                offset: const Offset(0, 6),
              ),
            ]
                : [],
          ),
          child: TextField(
            focusNode: _focusNode,
            controller: widget.controller,
            obscureText: widget.obscureText,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            autofillHints: widget.autofillHints,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: const TextStyle(color: Colors.black38),
              filled: true,
              fillColor: Colors.transparent,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),

        /// ✅ floating error under input
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 180),
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          child: hasError
              ? Padding(
            key: ValueKey(widget.errorText),
            padding: const EdgeInsets.only(top: 8, left: 6),
            child: Text(
              widget.errorText!,
              style: const TextStyle(
                fontSize: 12.5,
                height: 1.3,
                color: Color(0xFFE53935),
                fontWeight: FontWeight.w600,
              ),
            ),
          )
              : const SizedBox(key: ValueKey("no-error"), height: 0),
        ),
      ],
    );
  }
}