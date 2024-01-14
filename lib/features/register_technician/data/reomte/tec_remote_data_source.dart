import 'package:dio/dio.dart';
import 'package:golden_soft_test/core/config/end_piont.dart';
import 'package:golden_soft_test/core/constant/constant_app.dart';
import 'package:golden_soft_test/core/params/reigster_tec_params.dart';
import 'package:golden_soft_test/features/register_technician/data/model/category_tec_model.dart';
import 'package:golden_soft_test/features/register_technician/data/model/register_rmodel.dart';
import 'package:golden_soft_test/features/register_technician/data/model/sub_category_tec_model.dart';

class TecRemoteDataSource {
  Dio dio = Dio();
  Future<RegisterResponseModel> registerTec(RegisterTecParams params) async {
    final response = await dio.post(
      ConstantApp.baseUrl + EndPoint.register,
      data: params.toFormData(),
      options: Options(contentType: 'multipart/form-data'),
    );
    return RegisterResponseModel.fromJson(response.data);
  }

  Future<List<SubCategoryTecModel>> getSubCategory(int id) async {
    final response =
        await dio.get('${ConstantApp.baseUrl}${EndPoint.subCategory}${id}');
    final List<dynamic> data = response.data['data'];
    return data.map((item) => SubCategoryTecModel.fromJson(item)).toList();
  }

  Future<List<CategoryTecModel>> getCategory() async {
    final response = await dio.get(ConstantApp.baseUrl + EndPoint.category);
    final List<dynamic> data = response.data['data'];
    return data.map((item) => CategoryTecModel.fromJson(item)).toList();
  }
}
