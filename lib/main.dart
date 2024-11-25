import 'package:flutter/material.dart';
import 'package:flutter_test_contact/di/module_dependencies.dart';
import 'package:flutter_test_contact/domain/usecase/check_is_login_usecase.dart';
import 'package:flutter_test_contact/domain/usecase/insert_dummy_data_usecase.dart';
import 'package:flutter_test_contact/domain/usecase/params/params.dart';
import 'package:flutter_test_contact/libraries/database/entity/contact_entity.dart';
import 'package:flutter_test_contact/presentation/features/dashboard/dashboard_page.dart';
import 'package:flutter_test_contact/presentation/features/home/home_page.dart';
import 'package:flutter_test_contact/presentation/features/login/login_page.dart';
import 'package:flutter_test_contact/utils/dummy_util.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ContactEntityAdapter());
  await ModuleDependency().init();
  await _initializeContacts();

  final bool isLoggedIn = await _checkLoginState();

  runApp(
    MyApp(
      isLoggedIn: isLoggedIn,
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SafeArea(
        child: isLoggedIn ? const DashboardPage() : const LoginPage(),
      ),
    );
  }
}

Future<void> _initializeContacts() async {
  var useCase = GetIt.instance<InsertDummyDataUseCase>();

  await useCase.call(CreateContactsParams(contacts: dummyContacts()));
}

Future<bool> _checkLoginState() async {
  final useCase = GetIt.instance<CheckIsLoginUseCase>();
  return await useCase.call(NoParams());
}
