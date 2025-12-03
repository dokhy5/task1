import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/detales_page/data/models/poductmodel/poductmodel.dart';
import 'package:task1/detales_page/presentation/manger/detils_item/ProductCubit.dart';
import 'package:task1/detales_page/presentation/manger/detils_item/ProductState.dart';
import 'package:task1/detales_page/presentation/views/widgets/brand_row.dart';
import 'package:task1/detales_page/presentation/views/widgets/custom_header.dart';
import 'package:task1/detales_page/presentation/views/widgets/custom_tabs.dart';
import 'package:task1/detales_page/presentation/views/widgets/description_row.dart';
import 'package:task1/detales_page/presentation/views/widgets/item_row.dart';
import 'package:task1/detales_page/presentation/views/widgets/price_discount_row.dart';
import 'package:task1/detales_page/presentation/views/widgets/quantity_counter.dart';
import 'package:task1/detales_page/presentation/views/widgets/similar_items_header.dart';
import 'package:task1/detales_page/presentation/views/widgets/similar_product_card.dart';

class DetilsPageBody extends StatefulWidget {
  final int productId;
  const DetilsPageBody({super.key, required this.productId});

  @override
  State<DetilsPageBody> createState() => _DetilsPageBodyState();
}

class _DetilsPageBodyState extends State<DetilsPageBody> {
  int currentTab = 0;

  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().fetchProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductFailure) {
              return Center(child: Text(state.failure.errMessage));
            } else if (state is ProductDetailsSuccess) {
              final Poductmodel product = state.product;

              // fallback للقيم الفارغة
              final images =
                  (product.image != null && product.image!.isNotEmpty)
                      ? [product.image!]
                      : ['https://via.placeholder.com/150'];
              final reviews = product.reviews ?? [];

              double oldPrice = double.tryParse(product.price ?? '0') ?? 0;
              double newPrice =
                  double.tryParse(product.discountPrice ?? '0') ?? 0;
              double discount =
                  oldPrice != 0
                      ? ((oldPrice - newPrice).abs() / oldPrice * 100)
                      : 0;

              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    const CustomHeader(),
                    const SizedBox(height: 24),
                    CustomTabs(
                      selectedIndex: currentTab,
                      onTap: (index) {
                        setState(() => currentTab = index);
                      },
                    ),
                    const SizedBox(height: 16),
                    ProductImageCardWithImages(images: images),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        product.name ?? 'Product Name',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const SizedBox(height: 18),
                    PriceDiscountRow(
                      discount: '${discount.round()}%',
                      oldPrice: '$oldPrice KWD',
                      newPrice: '$newPrice KWD',
                    ),
                    const SizedBox(height: 18),
                    const Divider(),
                    BrandRow(
                      brandName: product.brand ?? 'Brand',
                      onMorePressed: () {},
                    ),
                    const Divider(),
                    const SizedBox(height: 15),
                    ItemRow(
                      sku: product.id?.toString() ?? '',
                      rating: product.averageRating ?? 0.0,
                      reviewsCount: reviews.length,
                    ),
                    const SizedBox(height: 15),
                    DescriptionRow(
                      description: product.description ?? 'No description',
                    ),
                    const SizedBox(height: 15),
                    const SimilarItemsHeader(),
                    const SizedBox(height: 15),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: reviews.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 0.48,
                          ),
                      itemBuilder: (context, index) {
                        final image =
                            images.isNotEmpty
                                ? images[0]
                                : 'https://via.placeholder.com/150';
                        final name = product.name ?? 'Product Name';

                        return SimilarProductCard(
                          imagePath: image,
                          title: name,
                          oldPrice: '$oldPrice',
                          newPrice: '$newPrice',
                          onBuyPressed: () {},
                          onFavoritePressed: () {},
                        );
                      },
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
      bottomNavigationBar: const BuyNowBar(),
    );
  }
}

/// نسخة محسنة من ProductImageCard لقبول قائمة الصور
class ProductImageCardWithImages extends StatefulWidget {
  final List<String> images;
  const ProductImageCardWithImages({super.key, required this.images});

  @override
  State<ProductImageCardWithImages> createState() =>
      _ProductImageCardWithImagesState();
}

class _ProductImageCardWithImagesState
    extends State<ProductImageCardWithImages> {
  int currentIndex = 0;
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 320,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.images.length,
            onPageChanged: (index) {
              setState(() => currentIndex = index);
            },
            itemBuilder: (context, index) {
              final imageUrl =
                  widget.images[index].isNotEmpty
                      ? widget.images[index]
                      : 'https://via.placeholder.com/150';
              return Container(
                padding: const EdgeInsets.all(4),
                child: Image.network(
                  imageUrl,
                  width: 260,
                  height: 300,
                  fit: BoxFit.contain,
                  errorBuilder:
                      (context, error, stackTrace) =>
                          Image.network('https://via.placeholder.com/150'),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.favorite_border, size: 28),
              Icon(Icons.share_outlined, size: 28),
            ],
          ),
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.images.length, (index) {
            bool isActive = index == currentIndex;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: isActive ? 10 : 8,
              height: isActive ? 10 : 8,
              decoration: BoxDecoration(
                color:
                    isActive ? Colors.orange : Colors.orange.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ],
    );
  }
}
