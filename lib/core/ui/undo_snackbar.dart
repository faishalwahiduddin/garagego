import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

/// How long a delete stays undoable.
const kUndoWindow = Duration(seconds: 5);

/// "Deleted · Undo" snackbar shown right after a single-item delete. A mis-tap
/// on a trash icon is recoverable without a confirm dialog in the way.
///
/// [message] defaults to the generic "Deleted" copy.
void showUndoSnackBar(
  BuildContext context, {
  required VoidCallback onUndo,
  String? message,
}) {
  final l10n = AppLocalizations.of(context)!;
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message ?? l10n.itemDeleted),
        duration: kUndoWindow,
        // An action makes snackbars sticky by default; this one must expire.
        persist: false,
        action: SnackBarAction(label: l10n.undo, onPressed: onUndo),
      ),
    );
}
