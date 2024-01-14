import 'package:flutter/material.dart';
import 'package:golden_soft_test/core/app_manager/service_locator/injection.dart';
import 'package:golden_soft_test/features/register_technician/presentation/page/register_technician.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  initializeGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:RegisterTechnician() ,
    );
  }
}
