import 'package:flutter/material.dart';
import 'package:full_store_app/controllers/product_detailes_controller.dart';
import 'package:full_store_app/views/product_detailes/widgets/addtocart_section.dart';
import 'package:full_store_app/views/product_detailes/widgets/color_section.dart';
import 'package:full_store_app/views/product_detailes/widgets/describtion_section.dart';
import 'package:full_store_app/views/product_detailes/widgets/product_detailes_appBar.dart';
import 'package:full_store_app/views/product_detailes/widgets/product_images.dart';
import 'package:get/get.dart';

class ProductDetailesView extends StatelessWidget {
  const ProductDetailesView({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailesController controller = Get.put(ProductDetailesController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProductDetailesAppBar(
              ratting: 0,
            ),
            ProductImages(
              item: controller.product,
            ),
            DescribtionSection(
              product: controller.product,
            ),
            const ColorSection(),
            const AddToCartSection(),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
