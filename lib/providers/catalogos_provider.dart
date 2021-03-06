import 'dart:convert';

import 'package:chat/global/environment.dart';
import 'package:chat/models/catalogo.dart';
import 'package:chat/models/catalogo_response.dart';
import 'package:chat/models/catalogos_products_response.dart';
import 'package:chat/models/catalogos_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class CatalogosApiProvider {
  final String _endpoint = '${Environment.apiUrl}/catalogo/catalogos/';

  final _storage = new FlutterSecureStorage();

  Future<CatalogosProductsResponse> getCatalogosProductsUser(
      String userId, String userAuthId) async {
    final urlFinal = _endpoint + 'user/$userId' + '/userAuth/$userAuthId';

    final token = await this._storage.read(key: 'token');

    try {
      final resp = await http.get(urlFinal,
          headers: {'Content-Type': 'application/json', 'x-token': token});

      final catalogosResponse = catalogosProductsResponseFromJson(resp.body);
      return catalogosResponse;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CatalogosProductsResponse.withError("$error");
    }
  }

  Future<CatalogosResponse> getMyCatalogos(String userId) async {
    final urlFinal = _endpoint + 'user/$userId';

    final token = await this._storage.read(key: 'token');

    try {
      final resp = await http.get(urlFinal,
          headers: {'Content-Type': 'application/json', 'x-token': token});

      final catalogosResponse = catalogosResponseFromJson(resp.body);
      return catalogosResponse;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CatalogosResponse.withError("$error");
    }
  }

  Future<CatalogosProductsResponse> getMyCatalogosProducts(
      String userId) async {
    final urlFinal = _endpoint + 'products/user/$userId';

    final token = await this._storage.read(key: 'token');

    try {
      final resp = await http.get(urlFinal,
          headers: {'Content-Type': 'application/json', 'x-token': token});

      final jsonResponse = json.decode(resp.body);

      print(jsonResponse);

      final catalogosResponse = catalogosProductsResponseFromJson(resp.body);

      print(catalogosResponse);
      return catalogosResponse;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CatalogosProductsResponse.withError("$error");
    }
  }

  final String _endpointRoom = '${Environment.apiUrl}/catalogo/catalogo/';

  Future<Catalogo> getCatalogo(String catalogoId) async {
    final urlFinal = _endpointRoom + '$catalogoId';

    final token = await this._storage.read(key: 'token');

    try {
      final resp = await http.get(urlFinal,
          headers: {'Content-Type': 'application/json', 'x-token': token});

      final catalogoResponse = catalogoResponseFromJson(resp.body);
      return catalogoResponse.catalogo;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return new Catalogo(id: '0');
    }
  }
}
