import 'package:clean_rakna/Features/Auth/presentation/SignIn/widgets/signin_view_body_consumer.dart';
import 'package:clean_rakna/core/services/get_it_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/auth_repo.dart';
import '../manager/signin_cubit.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(
        getIt<AuthRepo>(),
      ),
      child: const SigninViewBodyConsumer(),
    );
  }
}
