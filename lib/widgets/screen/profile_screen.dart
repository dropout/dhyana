import 'package:dhyana/model/all.dart';
import 'package:dhyana/widgets/bloc_provider/profile_bloc_provider.dart';
import 'package:dhyana/widgets/profile/profile_view.dart';
import 'package:dhyana/widgets/util/app_back_button.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ProfileBlocProvider(
        child: buildBody(context),
      )
    );
  }

  Widget buildBody(BuildContext context) {
    return const Stack(
      fit: StackFit.expand,
      children: [
        ProfileView(),
        AppBackButton(),
      ],
    );
  }

}
