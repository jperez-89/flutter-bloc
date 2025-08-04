import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //? Esta pendiente del estado del UsernameCubit y actualiza la UI cuando el estado cambia.
    //? Instancia de la clase
    // final usernameCubit = context.watch<UsernameCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),
      body: Center(child: BlocBuilder<UsernameCubit, String>(
        // Redibuje si el estado cambia
        // buildWhen: (previous, current) => previous != current,

        // Redibuje siempre
        builder: (context, state) {
          return Text(
            state,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<UsernameCubit>()
              .setUsername(RandomGenerator.getRandomName());

          //? Actualiza el estado del UsernameCubit
          // usernameCubit.setUsername(
          //   RandomGenerator.getRandomName(),
          // );
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
