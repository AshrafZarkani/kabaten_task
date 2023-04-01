import 'package:flutter/material.dart';
import 'package:kabaten_task/core/constants/constants.dart';
import 'package:kabaten_task/core/extensions/build_context_x.dart';
import 'package:kabaten_task/modules/profile_screen/data/models/user_profile_model.dart';

class ProfileScreenContentBody extends StatelessWidget {
  const ProfileScreenContentBody({Key? key, this.profileData})
      : super(key: key);
  final ProfileDetailsData? profileData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Center(
            child: ClipOval(
              child: Image.network(
                profileData?.profilePicture ?? StaticStrings.staticNetworkLogo,
                width: context.screenWidth * 0.4,
                height: context.screenWidth * 0.4,
              ),
            ),
          ),
          Visibility(
            visible: profileData?.email != null,
            child: ListTile(
              title: const Text("Email"),
              subtitle: Text(profileData?.email ?? ""),
            ),
          ),
          Visibility(
            visible: profileData?.fullName != null,
            child: ListTile(
              title: const Text("Full Name"),
              subtitle: Text(profileData?.fullName ?? ""),
            ),
          ),
          Visibility(
            visible: profileData?.dob != null,
            child: ListTile(
              title: const Text("Date of birth"),
              subtitle: Text(profileData?.dob ?? ""),
            ),
          ),
          Visibility(
            visible: profileData?.country != null,
            child: ListTile(
              title: const Text("Country"),
              subtitle: Text(profileData?.country ?? ""),
            ),
          ),
          Visibility(
            visible: profileData?.city != null,
            child: ListTile(
              title: const Text("City"),
              subtitle: Text(profileData?.city ?? ""),
            ),
          ),
          Visibility(
            visible: profileData?.bio != null,
            child: ListTile(
              title: const Text("BIO"),
              subtitle: Text(profileData?.bio ?? ""),
            ),
          ),
          Visibility(
            visible: profileData?.roleInTeam != null,
            child: ListTile(
              title: const Text("Role in team"),
              subtitle: Text(profileData?.roleInTeam ?? ""),
            ),
          ),
          Visibility(
            visible: profileData?.nationality != null,
            child: ListTile(
              title: const Text("Nationality"),
              subtitle: Text(profileData?.nationality ?? ""),
            ),
          ),
          SizedBox(
            height: context.screenHeight * 0.15,
          )
        ],
      ),
    );
  }
}
