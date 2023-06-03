import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_task/bloc/get_image/get_image_bloc.dart';
import 'package:test_task/data/local_db/local_db_image.dart';
import 'package:test_task/screens/homePage.dart';
import 'bloc/bloc_user_data/get_user_bloc.dart';
import 'cubit/connectivity/connectivity_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(CarAdapter());
  await Hive.openBox('images');
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => GetImageBloc()..add(GetDataFromApiEvent()),
    ),
    BlocProvider(
      create: (context) => GetUserBloc()..add(GetUserFromApiEvent()),
    ),
    BlocProvider(
      create: (context) => ConnectivityCubit(),
    ),

  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}