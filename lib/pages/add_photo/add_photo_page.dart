import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shartflix/cubit/addphoto/photo_cubit.dart';
import 'package:shartflix/cubit/addphoto/photo_state.dart';
import 'package:shartflix/routes/page_routes.dart';
import 'package:shartflix/themes/app_colors.dart';
import 'package:shartflix/utils/size.dart';
import 'package:shartflix/widgets/button/default_button.dart';
import 'package:shartflix/widgets/button/my_back_button.dart';

class AddPhotoPage extends StatelessWidget {
  AddPhotoPage({Key? key}) : super(key: key);

  final ImagePicker picker = ImagePicker();

  Future<void> _pickAndUploadImage(BuildContext context) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      context.read<PhotoCubit>().uploadPhoto(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = ScreenSize.getSize(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocConsumer<PhotoCubit, PhotoState>(
        listener: (context, state) {
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Hata: ${state.error}')),
            );
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.07),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    const MyBackButton(),
                    SizedBox(width: size.width * 0.21),
                    Text(
                      "Profil Detayı",
                      style: TextStyle(
                        color: AppColors.profilPageTopTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Fotoğraflarınızı Yükleyin",
                style: TextStyle(
                    color: AppColors.addPhotoTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: size.height * 0.0020),
              Text(
                "Resources out incentivize\n relaxation floor loss cc.",
                style: TextStyle(
                    color: AppColors.addPhotoDescTextColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w200),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height * 0.040),
              _addPhoto(context, size, state),
              const Spacer(),
              DefaultButton(
                text: "Devam Et",
                onTap: () {
                  if (state.user != null) {
                    PageRoutes.goToHome(context);
                  }
                },
              ),
              const SizedBox(height: 30),
            ],
          );
        },
      ),
    );
  }

GestureDetector _addPhoto(BuildContext context, Size size, PhotoState state) {
  final imageUrl = state.user?.photoUrl; // Kullanıcıdan gelen URL

  return GestureDetector(
    onTap: () => _pickAndUploadImage(context),
    child: Container(
      width: size.width * 0.4,
      height: size.height * 0.18,
      decoration: BoxDecoration(
        color: AppColors.addPhotoButtonBackgroundColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 1, color: AppColors.addPhotoStrokeColor),
        image: imageUrl != null
            ? DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: state.isUploading
          ? const Center(child: CircularProgressIndicator())
          : imageUrl == null
              ? Icon(
                  Icons.add,
                  color: AppColors.addPhotoIconColor,
                  size: 50,
                )
              : null, // Eğer image varsa icon gösterme
    ),
  );
}
}
