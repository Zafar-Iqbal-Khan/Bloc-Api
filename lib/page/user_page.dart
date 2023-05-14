import 'package:api_bloc/model/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user/bloc/user_bloc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final UserBloc _userBloc = UserBloc();

  @override
  void initState() {
    _userBloc.add(GetUserList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildListUser();
  }

  Widget _buildListUser() {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: BlocProvider(
            create: (context) => _userBloc,
            child: BlocConsumer<UserBloc, UserState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is UserError) {
                  return Center(
                    child: Text(state.error!),
                  );
                } else if (state is UserInitial) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is UserLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is UserLoaded) {
                  return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      UserProfileModal? userModel = state.usersList;
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                                "Full Name: ${userModel!.fullName.toString()}"),
                          ),
                          ListTile(
                            title: Text("Email: ${userModel.email.toString()}"),
                          ),
                          ListTile(
                            title: Text(
                                "Created By: ${userModel.createdBy.toString()}"),
                          ),
                          ListTile(
                            title: Text(
                                "Passport Number: ${userModel.passportNo.toString()}"),
                          ),
                          ListTile(
                            title: Text(
                                "Has Work Permit: ${userModel.hasWorkPermit.toString()}"),
                          ),
                          ListTile(
                            title: Text(
                                "Id: ${userModel.identificationId.toString()}"),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  return Container();
                }
              },
            )),
      ),
    );
  }
}
