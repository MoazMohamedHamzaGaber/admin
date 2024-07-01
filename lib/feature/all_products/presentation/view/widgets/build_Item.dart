import 'package:admin/core/loading/image_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../Dashboard/presentation/manage/cubit/cubit.dart';

class BuildItemSearch extends StatelessWidget {
  const BuildItemSearch({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
       // navigateTo(context, AddOrUpdateProductView(isUpdate: true,model: model,uId: uId,));
      },
      child: Container(
        decoration: BoxDecoration(
          color: DashboardCubit.get(context).isDarkTheme
              ? Colors.white24
              : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: 'https://th.bing.com/th/id/OIP.9Izv-aszItToTtEqRMSE0QHaE6?rs=1&pid=ImgDetMain',
                  placeholder: (context, url) => const ImageLoading(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  height: size.height * 0.18,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
               const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 5,
                    child: Text(
                      'model.productTitle',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
               Text(
                '\$model.productPrice',
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
