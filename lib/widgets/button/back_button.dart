import 'package:flutter/material.dart';

import '../../utils/size.dart';

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: ScreenSize.getSize(context).width*0.10,
        height: ScreenSize.getSize(context).height*0.10,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.10),
          shape: BoxShape.circle,
          border: Border.all(
            width: 1,
            color: Colors.white.withOpacity(0.1)
          )
        ),
        child:const Icon(Icons.arrow_back,color: Colors.white,),
      ),
    );
  }
}