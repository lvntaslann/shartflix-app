import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/cubit/auth/auth_cubit.dart';
import 'package:shartflix/routes/page_routes.dart';
import 'package:shartflix/themes/app_colors.dart';
import 'package:shartflix/widgets/button/my_back_button.dart';
import 'package:shartflix/widgets/bottomdialog/limited_offer_bottom_sheet.dart';
import '../../cubit/favorite_movie/favorite_movie_cubit.dart';
import '../../utils/name_id_refactor.dart';
import '../../utils/size.dart';
import '../../widgets/button/add_photo_button.dart';
import '../../widgets/button/limitted_offer_button.dart';
import '../../widgets/favourite_movie.dart';
import '../../widgets/text/name_and_id.dart';
import '../../widgets/icon/photo_icon.dart';

class ProfilPage extends StatefulWidget {
  ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().fetchProfile();
    context.read<FavoriteMovieCubit>().fetchFavorites();
  }

  void _showLimitedOfferBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: const LimitedOfferBottomSheet(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthCubit>().state;
    final favoriteState = context.watch<FavoriteMovieCubit>().state;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: ScreenSize.getSize(context).height * 0.07),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const MyBackButton(),
                SizedBox(width: ScreenSize.getSize(context).width * 0.19),
                Text("Profil Detayı",
                    style: TextStyle(
                        color: AppColors.profilPageTopTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
                SizedBox(width: ScreenSize.getSize(context).width * 0.04),
                GestureDetector(
                  onTap: () => _showLimitedOfferBottomSheet(),
                  child: const LimittedOfferButton(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: [
                PhotoIcon(
                  url: authState.user?.photoUrl ??
                      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                ),
                SizedBox(width: ScreenSize.getSize(context).width * 0.05),
                NameAndId(
                  name: NameIdRefactor.capitalizeFirstLetter(
                      authState.user?.name ?? "Bilinmiyor"),
                  id: "id: ${NameIdRefactor.shortenId(authState.user?.id ?? '')}",
                ),
                SizedBox(width: ScreenSize.getSize(context).width * 0.16),
                AddPhotoButton(
                  onTap: () {
                    PageRoutes.goAddPhoto(context);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: ScreenSize.getSize(context).height * 0.03),
          const Padding(
            padding: EdgeInsets.only(left: 50),
            child: Text(
              "Beğendiğim filmler",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          FavouriteMovie(favorites: favoriteState.favorites),
        ],
      ),
    );
  }
}


