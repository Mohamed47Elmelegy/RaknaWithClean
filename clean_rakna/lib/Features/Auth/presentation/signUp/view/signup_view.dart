import 'package:clean_rakna/Features/Auth/presentation/signUp/widgets/signup_view_body_consumer.dart';
import 'package:clean_rakna/core/services/get_it_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/auth_repo.dart';
import '../manager/signup_cubit.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SignupCubit(getIt<AuthRepo>()),
        child: const SignupViewBodyConsumer());
  }
}
