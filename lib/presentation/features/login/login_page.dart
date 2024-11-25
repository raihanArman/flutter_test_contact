import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_contact/domain/usecase/fetch_contact_usecase.dart';
import 'package:flutter_test_contact/domain/usecase/get_contact_by_userid_usecase.dart';
import 'package:flutter_test_contact/domain/usecase/save_session_usecase.dart';
import 'package:flutter_test_contact/presentation/features/home/home_page.dart';
import 'package:flutter_test_contact/presentation/features/login/state/login_bloc.dart';
import 'package:flutter_test_contact/presentation/features/login/state/login_event.dart';
import 'package:flutter_test_contact/presentation/features/login/state/login_state.dart';
import 'package:flutter_test_contact/presentation/theme/text.dart';
import 'package:flutter_test_contact/presentation/widgets/bc_default.dart';
import 'package:flutter_test_contact/presentation/widgets/space.dart';
import 'package:flutter_test_contact/presentation/widgets/tf_default_title.dart';
import 'package:get_it/get_it.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(
        getContactByUserIdUseCase: GetIt.instance<GetContactByUserIdUseCase>(),
        saveSessionLoginUseCase: GetIt.instance<SaveSessionLoginUseCase>(),
      ),
      child: LoginBody(),
    );
  }
}

class LoginBody extends StatelessWidget {
  final TextEditingController loginController = TextEditingController();

  LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => HomePage()),
            );
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Container(
          margin: const EdgeInsets.only(top: 30, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi There!",
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: semibold),
              ),
              Text(
                "Please login to see your contact list",
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
              verticalSpace(20),
              TFDefaultTitle(
                formController: loginController,
                hintText: "09128xxxxxx",
                prefixIcon: "contact.svg",
                isMandatory: true,
                title: "User ID",
              ),
              verticalSpace(20),
              BcDefault(
                titleButton: "Login",
                onTap: () {
                  final userId = loginController.text.trim();
                  if (userId.isNotEmpty) {
                    context
                        .read<LoginBloc>()
                        .add(LoginRequested(userId: userId));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text("Please enter a valid phone number")),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
