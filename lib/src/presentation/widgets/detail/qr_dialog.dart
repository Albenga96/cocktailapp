import 'package:cocktailapp/src/config/themes/cocktails_sizes.dart';
import 'package:cocktailapp/src/domain/entities/cocktail_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrDialog extends StatelessWidget {
  const QrDialog({
    Key? key,
    required this.cocktailDetailsEntity,
  }) : super(key: key);

  final CocktailDetailsEntity cocktailDetailsEntity;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              height: CocktailSizes.sizeHuge * 2,
              width: CocktailSizes.sizeHuge * 2,
              child: QrImage(
                data: cocktailDetailsEntity.drinkId,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
