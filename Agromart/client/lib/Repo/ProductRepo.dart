import 'package:client/Models/CropModels.dart';
import 'package:client/Models/ProductModel.dart';
import 'package:client/Service/Apihelper.dart';

class Productrepo {
  static final Api = Apihelper.getApiIntance();
  static Future<List<CropProduct>> alldata() async {
    try {
      var res = await Api.get("/api/product/Allproduct");
      var data = res.data;
      if (data['sucess'] == true && data['Data'] == true) {
        List<dynamic> result = data['result'];
        List<CropProduct> products = result
            .map((item) => CropProduct.fromJson(item as Map<String, dynamic>))
            .toList();
        return products;
      } else {
        throw Exception('Failed to fetch products');
      }
    } catch (error) {
      print("Error fetching data: $error");
      return [];
    }
  }

  static Future<List<CropProduct>> getdata(String type) async {
    try {
      var res = await Api.get("/api/product/categorieproducts?crop=$type");
      var data = res.data;
      if (data['Data'] == true) {
        List<dynamic> result = data['result'];
        List<CropProduct> products = result
            .map((item) => CropProduct.fromJson(item as Map<String, dynamic>))
            .toList();
        return products;
      } else {
        throw Exception('Failed to fetch products');
      }
    } catch (error) {
      print("Error fetching data: $error");
      return [];
    }
  }

  static Future<bool> addProduct(Productmodel product) async {
    try {
      final cropdata = product.toJson();
      var res = await Api.post("/api/product/addproduct", data: cropdata);
      print(res);
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }
}

//  final cropdata={
//         "cropname":product.cropName,
//       };