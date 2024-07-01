import 'package:admin/feature/all_products/presentation/manage/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/get_products_repos.dart';

class AllProductsCubit extends Cubit<AllProductsStates>{
  AllProductsCubit(this.getProductsRepos) :super(InitialAllProductsStates());

  final GetProductsRepos getProductsRepos;

  static AllProductsCubit get(context)=>BlocProvider.of(context);


  void getProducts()async{
    emit(AllProductsLoadingStates());

    var result=await getProductsRepos.fetchProducts();

    result.fold((failure){
      emit(AllProductsErrorStates(errMessage: failure.errMessage));
    }, (products) {
      emit(AllProductsSuccessStates(products: products));
    });
  }
}