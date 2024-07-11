import 'dart:io';

import 'package:karingo_v2/features/profile/domain/models/profile_model.dart';
import 'package:karingo_v2/interface/repo_interface.dart';

abstract class ProfileRepositoryInterface implements RepositoryInterface{

  Future<dynamic> getProfileInfo();
  Future<dynamic> updateProfile(ProfileModel userInfoModel, String pass, File? file, String token);
}