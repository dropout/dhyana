import 'package:flutter/material.dart';

class AppErrorCard extends StatelessWidget {
  const AppErrorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                  Radius.circular(8.0)
              ),
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.warning_amber_rounded,
                    size: 64,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Unable to load profile',
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.white,
                            )
                        ),
                        Text(
                            'An unexpected error occured '
                                'while trying to load your profile.',
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                            )
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
        ),
      )
    );
  }
}
