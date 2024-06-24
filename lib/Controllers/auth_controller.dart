import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Repositories/auth_repository.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var loadingImg = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    // Fetch data from an API on initialization
    await Future.delayed(const Duration(seconds: 5));
    loadingImg.value = false;
  }

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final response = await http.post(
        Uri.parse('https://uaifly-server-test.azurewebsites.net/api/Login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        await DatabaseService().insertUser({
          'email': data['email'],
          'accessToken': data['accessToken'],
          'userName': data['userName'],
          'name': data['name'],
          'role': data['role'],
        });
        Get.snackbar('Success', 'Usuário Logado com sucesso');
      } else if (response.statusCode == 404) {
        //errorMessage.value = 'Usuário não encontrado';
        Get.snackbar('Erro', 'Usuário não encontrado');
      } else {
        //errorMessage.value = 'Erro ao fazer login';
        Get.snackbar('Erro', 'Erro ao fazer login');
      }
    } catch (e) {
      //errorMessage.value = 'Erro ao fazer login';
      Get.snackbar('Erro', 'Erro ao fazer login');
    } finally {
      isLoading.value = false;
    }
  }
}
