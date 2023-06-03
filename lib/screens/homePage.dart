import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:test_task/bloc/get_image/get_image_bloc.dart';
import 'package:test_task/screens/no_internet/no_internet_image.dart';
import '../cubit/connectivity/connectivity_cubit.dart';
import '../data/model/image_model/image_db_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

int count = 10;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var images = Hive.box('images');

    return BlocListener<ConnectivityCubit, ConnectivityState>(
      listener: (context, state) {
        if (state.connectivityResult == ConnectivityResult.none) {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const NoInternetImage()));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: const Text("Home Page"),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const NoInternetImage(),
                  ),
                );
              },
              child: const Icon(Icons.signal_wifi_connected_no_internet_4),
            ),
          ],
        ),
        body: BlocConsumer<GetImageBloc, MultiStateState>(
          builder: (context, state) {
            if (state is GettingDataInProgress) {
              images.clear();
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is GettingDataInSuccess) {
              return Padding(
                padding: const EdgeInsets.all(14),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: count,
                  itemBuilder: (context, index) {
                    print("***************Index$index");
                    print("***************Count$count");
                    if (index <= count - 1) {
                       return Container(
                         margin: const EdgeInsets.only(bottom: 15),
                         alignment: Alignment.center,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
                           border: Border.all(width: 1, color: Colors.grey),
                         ),
                         child: Column(
                           children: [
                             const SizedBox(height: 15),
                             Text(
                               state.image[index].title,
                               style: const TextStyle(
                                   fontWeight: FontWeight.w400, fontSize: 15),
                             ),
                             const SizedBox(height: 15),
                             Image(
                                 image: NetworkImage(state.image[index].url),
                                 width: 100),
                             const SizedBox(height: 15),
                           ],
                         ),
                       );


                    } else {
                      print("***************Else Count$count");
                      Opacity(
                        opacity: index <= count - 1 ? 0.0 :1.0,
                        child: InkWell(
                          onTap: (){
                            count + 10;
                            print(count);
                          },
                          child: Container(
                            color: Colors.red,
                            height: 100,
                            width: 40,
                          ),
                        ),
                      );
                    }
                  },
                ),
              );
            }
            if (state is GettingDataInFailury) {
              return Center(
                child: Text(
                  state.errorText,
                  style: const TextStyle(fontSize: 24, color: Colors.red),
                ),
              );
            }
            return const Text("dds");
          },
          listener: (context, state) {
            if (state is GettingDataInSuccess) {
              for (var i = 0; i < state.image.length; i++) {
                if (i == 0) {}
                images.add(ImageDbModel(
                    url: state.image[i].url, title: state.image[i].title));
              }
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          child: const Icon(Icons.signal_wifi_4_bar),
        ),
      ),
    );
  }
}
