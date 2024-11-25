import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_contact/domain/usecase/get_contact_by_userid_usecase.dart';
import 'package:flutter_test_contact/domain/usecase/get_session_usecase.dart';
import 'package:flutter_test_contact/domain/usecase/save_session_usecase.dart';
import 'package:flutter_test_contact/presentation/features/contact_details/contact_detail_page.dart';
import 'package:flutter_test_contact/presentation/features/login/login_page.dart';
import 'package:flutter_test_contact/presentation/features/profil/state/profile_bloc.dart';
import 'package:flutter_test_contact/presentation/features/profil/state/profile_event.dart';
import 'package:flutter_test_contact/presentation/features/profil/state/profile_state.dart';
import 'package:flutter_test_contact/presentation/theme/text.dart';
import 'package:flutter_test_contact/presentation/widgets/app_bar_menu.dart';
import 'package:flutter_test_contact/presentation/widgets/avatar_contact.dart';
import 'package:flutter_test_contact/presentation/widgets/bc_default.dart';
import 'package:flutter_test_contact/presentation/widgets/space.dart';
import 'package:get_it/get_it.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(
        getContactByUserIdUseCase: GetIt.instance<GetContactByUserIdUseCase>(),
        getSessionLoginUseCase: GetIt.instance<GetSessionLoginUseCase>(),
        saveSessionLoginUseCase: GetIt.instance<SaveSessionLoginUseCase>(),
      )..add(FetchProfile()),
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileLoggedOut) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const LoginPage()),
              (route) => false,
            );
          } else if (state is ProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: const ProfileBody(),
      ),
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMenu(
        title: "My Profile",
        suffix: InkWell(
          onTap: () => context.read<ProfileBloc>().add(LogoutRequested()),
          child: Text(
            "Logout",
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: black,
            ),
          ),
        ),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileLoaded) {
            final contact = state.contact;
            return Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  AvatarContact(
                    name: contact.firstName,
                    size: 100,
                    fontSize: 40,
                  ),
                  verticalSpace(24),
                  Text(
                    contact.firstName,
                    style: grey2TextStyle.copyWith(fontSize: 15),
                  ),
                  verticalSpace(10),
                  Text(
                    contact.email ?? "No email provided",
                    style: grey2TextStyle.copyWith(fontSize: 15),
                  ),
                  verticalSpace(10),
                  Text(
                    contact.dob ?? "No date of birth",
                    style: grey2TextStyle.copyWith(fontSize: 15),
                  ),
                  verticalSpace(24),
                  BcDefault(
                    titleButton: "Update my detail",
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ContactDetailPage(
                              contact: (context.read<ProfileBloc>().state
                                      as ProfileLoaded)
                                  .contact),
                        ),
                      );

                      // Refresh hanya jika ada perubahan di ContactDetailPage
                      if (result == true) {
                        context.read<ProfileBloc>().add(FetchProfile());
                      }
                    },
                  ),
                ],
              ),
            );
          } else if (state is ProfileError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text("No profile data available."));
          }
        },
      ),
    );
  }
}
