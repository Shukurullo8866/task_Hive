import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc_user_data/get_user_bloc.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
      ),
      body: BlocConsumer<GetUserBloc, UserStateState>(
        builder: (context, state) {
          if (state is GettingDataInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GettingDataInSuccess) {
            return Padding(
              padding: const EdgeInsets.only(top: 14),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.user.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 15),
                            const SizedBox(height: 15),
                            Text(state.user[index].name.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 15)),
                            const SizedBox(height: 15),
                            Text(state.user[index].username.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 15)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
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
        listener: (context, state) {},
      ),
    );
  }
}
