import 'package:flutter/material.dart';
import 'package:movies/core/resources/strings_Manager.dart';

class UiUtils {
  static void showAlertDialog(
    BuildContext context, {
    required String title,
    required String message,
    required String confirmText,
    String? cancelText,
    required VoidCallback onConfirm,
    Color? confirmColor,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              cancelText ?? StringsManager.cancel,
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onConfirm();
            },
            child: Text(
              confirmText,
              style: TextStyle(color: confirmColor ?? Theme.of(context).colorScheme.error),
            ),
          ),
        ],
      ),
    );
  }

  static void showMessage(BuildContext context, String message, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              isError ? Icons.error : Icons.check_circle,
              color:isError ? Theme.of(context).colorScheme.primary:Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
            ),
          ],
        ),
        backgroundColor: isError 
            ? Theme.of(context).colorScheme.error 
            : Theme.of(context).colorScheme.secondary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}
