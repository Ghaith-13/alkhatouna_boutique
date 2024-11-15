// ignore_for_file: file_names, non_constant_identifier_names

import 'package:alkhatouna/features/cart/data/datasources/cart_ds.dart';
import 'package:alkhatouna/features/cart/data/models/add_adress_model.dart';
import 'package:alkhatouna/features/cart/data/models/check_out_model.dart';
import 'package:alkhatouna/features/cart/data/models/delete_address_model.dart';
import 'package:alkhatouna/features/cart/data/models/get_address_model.dart';
import 'package:alkhatouna/features/cart/data/models/get_cart_model.dart';
import 'package:alkhatouna/features/cart/data/models/make_default_model.dart';
import 'package:alkhatouna/features/cart/data/models/remove_from_cart_model.dart';
import 'package:alkhatouna/features/cart/data/models/send_check_out.dart';

class CartRepo {
  final CartDS dataSource;

  CartRepo({required this.dataSource});

  Future<GetAdressModel> getAddress() async {
    GetAdressModel MyOrdersResponse = GetAdressModel.fromJson(
      await dataSource.getAddress(),
    );
    return MyOrdersResponse;
  }

  Future<AddAdressModel> addAdress(
      {required Map<String, String> body, String? addressID}) async {
    AddAdressModel response = AddAdressModel.fromJson(
      await dataSource.addAdress(body, addressID),
    );
    return response;
  }

  Future<MakeDefaultModel> makeAdressDefault(
      {required String addressID}) async {
    MakeDefaultModel response = MakeDefaultModel.fromJson(
      await dataSource.makeAdressDefault(addressID),
    );
    return response;
  }

  Future<DeleteAddressModel> deleteAddress({required String addressID}) async {
    DeleteAddressModel response = DeleteAddressModel.fromJson(
      await dataSource.deleteAddress(addressID),
    );
    return response;
  }

  Future<RemoveFromCartModel> removeFromCart(
      {required Map<String, String> body}) async {
    RemoveFromCartModel response = RemoveFromCartModel.fromJson(
      await dataSource.removeFromCart(body),
    );
    return response;
  }

  Future<GetCartModel> getCarts() async {
    GetCartModel response = GetCartModel.fromJson(
      await dataSource.getCarts(),
    );
    return response;
  }

  Future<CheckOutModel> getCheckOut(
      bool fromPromoCode, String promoCode, String benefit) async {
    CheckOutModel response = CheckOutModel.fromJson(
      await dataSource.getCheckOut(fromPromoCode, promoCode, benefit),
    );
    return response;
  }

  Future<SendCheckOut> sendOrder(
      String promoCode, String paymentMethod, String selectedBenefitId) async {
    SendCheckOut response = SendCheckOut.fromJson(
      await dataSource.sendOrder(promoCode, paymentMethod, selectedBenefitId),
    );
    return response;
  }
}
