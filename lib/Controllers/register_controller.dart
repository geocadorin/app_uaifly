import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> register(String firstName, String lastName, String email,
      String dateBirth, String password) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final response = await http.post(
        Uri.parse('https://uaifly-server-test.azurewebsites.net/api/Users'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'dateBirth': dateBirth,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        Get.snackbar('Sucesso', 'Usuário criado com sucesso');
        Get.offNamed('/login');
      } else {
        errorMessage.value = 'Usuário não pode ser criado';
        Get.snackbar('Erro', errorMessage.value);
      }
    } catch (e) {
      errorMessage.value = 'Usuário não pode ser criado';
      Get.snackbar('Erro', errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }
}
