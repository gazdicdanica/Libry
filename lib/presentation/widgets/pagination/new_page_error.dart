import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';

class NewPageErrorIndicator extends StatelessWidget {
  const NewPageErrorIndicator({
    super.key,
    required this.onTryAgain,
  }) ;

  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTryAgain,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 10,),
          Icon(
            Icons.refresh,
            size: 40,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 10),
          Text(
            t.libraries_error,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10,)
        ],
      ),
    );
  }
}