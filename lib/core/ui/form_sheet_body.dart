import 'package:flutter/material.dart';

/// Body for form sheets shown with `showFleetSheet`: title, scrollable
/// content and a right-aligned action row. Mirrors the AlertDialog slots
/// (`title`, `content`, `actions`) so a dialog form can move to a sheet
/// without touching its fields, validation or save handler.
class FormSheetBody extends StatelessWidget {
  const FormSheetBody({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
  });

  final Widget title;
  final Widget content;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(header: true, child: title),
          const SizedBox(height: 16),
          Flexible(child: content),
          const SizedBox(height: 16),
          Wrap(
            alignment: WrapAlignment.end,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: actions,
          ),
        ],
      ),
    );
  }
}
