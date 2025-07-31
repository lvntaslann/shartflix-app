import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shartflix/themes/app_colors.dart';
import 'package:shartflix/utils/size.dart';
import 'package:shartflix/widgets/button/default_button.dart';

class AddPhotoPage extends StatelessWidget {
 AddPhotoPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: ScreenSize.getSize(context).height*0.07),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                const BackButton(),
                          SizedBox(width: ScreenSize.getSize(context).width*0.21),

                const Text("Profil Detayı",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),)
              ],
            ),
          ),
         const Text("Fotoğraflarınızı Yükleyin",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),textAlign: TextAlign.center),
         SizedBox(height: ScreenSize.getSize(context).height*0.0020),
         const Text("Resources out incentivize\n relaxation floor loss cc.",style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.w200),textAlign: TextAlign.center),
          SizedBox(height: ScreenSize.getSize(context).height*0.040),
         Container(
          width: ScreenSize.getSize(context).width*0.4,
          height: ScreenSize.getSize(context).height*0.18,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              width: 1,
              color: Colors.white.withOpacity(0.1)
            )
          ),
          child:Icon(Icons.add,color: Colors.white.withOpacity(0.5),size:50,) ,
         ),
                   SizedBox(height: ScreenSize.getSize(context).height*0.45),

         DefaultButton(text: "Devam Et", onTap: (){})
        ],
      ),
    );
  }
}

