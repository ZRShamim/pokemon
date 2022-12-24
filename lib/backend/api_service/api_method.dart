// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:poke_api/backend/api_components/logger.dart';
import 'package:http/http.dart' as http;
import 'package:poke_api/components/custom_snackbar/custom_snackbar.dart';

final log = logger(ApiMethod);

class ApiMethod {
  // Get method
  Future<Map<String, dynamic>?> get(String url, {int code = 200}) async {
    log.i(
        '|📍📍📍|----------------- [[ GET ]] method details start -----------------|📍📍📍|');

    log.i(url);

    log.i(
        '|📍📍📍|----------------- [[ GET ]] method details ended -----------------|📍📍📍|');

    try {
      final response = await http
          .get(
            Uri.parse(url),
          )
          .timeout(const Duration(seconds: 20));

      log.i(
          '|📒📒📒|-----------------[[ GET ]] method response start -----------------|📒📒📒|');

      log.i(response.body.toString());
      log.i(response.statusCode);

      log.i(
          '|📒📒📒|-----------------[[ GET ]] method response end -----------------|📒📒📒|');

      if (response.statusCode == code) {
        return jsonDecode(response.body);
      } else {
        log.e('🐞🐞🐞 Error Alert On Status Code 🐞🐞🐞');

        log.e('unknown error hitted in status code' +
            jsonDecode(response.body).toString());

        // ErrorResponse res = ErrorResponse.fromJson(jsonDecode(response.body));

        // CustomSnackBar.error(res.message.errors);
        CustomSnackBar.error('Something Went Wrong! Try again');
        return null;
      }
    } on SocketException {
      log.e('🐞🐞🐞 Error Alert on Socket Exception 🐞🐞🐞');

      CustomSnackBar.error('Check your Internet Connection and try again!');

      return null;
    } on TimeoutException {
      log.e('🐞🐞🐞 Error Alert Timeout Exception🐞🐞🐞');

      log.e('Time out exception$url');

      CustomSnackBar.error('Something Went Wrong! Try again');

      return null;
    } on http.ClientException catch (err, stackrace) {
      log.e('🐞🐞🐞 Error Alert Client Exception🐞🐞🐞');

      log.e('client exception hitted');

      log.e(err.toString());

      log.e(stackrace.toString());

      return null;
    } catch (e) {
      log.e('🐞🐞🐞 Other Error Alert 🐞🐞🐞');

      log.e('❌❌❌ unlisted error received');

      log.e("❌❌❌ $e");

      return null;
    }
  }

  // Param get method
  Future<Map<String, dynamic>?> paramGet(String url, Map<String, dynamic> body,
      {int code = 200}) async {
    log.i(
        '|Get param📍📍📍|----------------- [[ GET ]] param method Details Start -----------------|📍📍📍|');

    log.i("##body given --> ");

    log.i(body);

    log.i("##url list --> $url");

    log.i(
        '|Get param📍📍📍|----------------- [[ GET ]] param method details ended ** ---------------|📍📍📍|');

    try {
      final response = await http
          .get(
            Uri.parse(url).replace(queryParameters: body),
          )
          .timeout(const Duration(seconds: 15));

      log.i(
          '|📒📒📒| ----------------[[ Get ]] Peram Response Start---------------|📒📒📒|');

      log.i(response.body.toString());

      log.i(
          '|📒📒📒| ----------------[[ Get ]] Peram Response End **-----------------|📒📒📒|');

      if (response.statusCode == code) {
        return jsonDecode(response.body);
      } else {
        log.e('🐞🐞🐞 Error Alert 🐞🐞🐞');

        log.e(
            'unknown error hitted in status code' + jsonDecode(response.body));

        // ErrorResponse res = ErrorResponse.fromJson(jsonDecode(response.body));

        // CustomSnackBar.error(res.message.errors);

        return null;
      }
    } on SocketException {
      log.e('🐞🐞🐞 Error Alert on Socket Exception 🐞🐞🐞');

      CustomSnackBar.error('Check your Internet Connection and try again!');

      return null;
    } on TimeoutException {
      log.e('🐞🐞🐞 Error Alert 🐞🐞🐞');

      log.e('Time out exception$url');

      CustomSnackBar.error('Something Went Wrong! Try again');

      return null;
    } on http.ClientException catch (err, stackrace) {
      log.e('🐞🐞🐞 Error Alert 🐞🐞🐞');

      log.e('client exception hitted');

      log.e(err.toString());

      log.e(stackrace.toString());

      return null;
    } catch (e) {
      log.e('🐞🐞🐞 Error Alert 🐞🐞🐞');

      log.e('#url->$url||#body -> $body');

      log.e('❌❌❌ unlisted error received');

      log.e("❌❌❌ $e");

      return null;
    }
  }

//   // Post Method
//   Future<Map<String, dynamic>?> post(String url, Map<String, dynamic> body,
//       {int code = 201}) async {
//     try {
//       log.i(
//           '|📍📍📍|-----------------[[ POST ]] method details start -----------------|📍📍📍|');

//       log.i(url);

//       log.i(body);

//       log.i(
//           '|📍📍📍|-----------------[[ POST ]] method details end ------------|📍📍📍|');

//       final response = await http
//           .post(
//             Uri.parse(url),
//             body: jsonEncode(body),
//             headers: isBasic ? basicHeaderInfo() : await bearerHeaderInfo(),
//           )
//           .timeout(const Duration(seconds: 30));

//       log.i(
//           '|📒📒📒|-----------------[[ POST ]] method response start ------------------|📒📒📒|');

//       log.i(response.body.toString());

//       log.i(response.statusCode);

//       log.i(
//           '|📒📒📒|-----------------[[ POST ]] method response end --------------------|📒📒📒|');

//       if (response.statusCode == code) {
//         return jsonDecode(response.body);
//       } else {
//         log.e('🐞🐞🐞 Error Alert On Status Code 🐞🐞🐞');

//         log.e('unknown error hitted in status code ' +
//             jsonDecode(response.body).toString());

//         ErrorResponse res = ErrorResponse.fromJson(jsonDecode(response.body));

//         CustomSnackBar.error(res.message.errors);

//         // CustomSnackBar.error(
//         //     jsonDecode(response.body)['message']['error'].toString());
//         return null;
//       }
//     } on SocketException {
//       log.e('🐞🐞🐞 Error Alert on Socket Exception 🐞🐞🐞');

//       CustomSnackBar.error('Check your Internet Connection and try again!');

//       return null;
//     } on TimeoutException {
//       log.e('🐞🐞🐞 Error Alert Timeout Exception🐞🐞🐞');

//       log.e('Time out exception$url');

//       CustomSnackBar.error('Something Went Wrong! Try again');

//       return null;
//     } on http.ClientException catch (err, stackrace) {
//       log.e('🐞🐞🐞 Error Alert Client Exception🐞🐞🐞');

//       log.e('client exception hitted');

//       log.e(err.toString());

//       log.e(stackrace.toString());

//       return null;
//     } catch (e) {
//       log.e('🐞🐞🐞 Other Error Alert 🐞🐞🐞');

//       log.e('❌❌❌ unlisted error received');

//       log.e("❌❌❌ $e");

//       return null;
//     }
//   }

//   // post method
//   Future<Map<String, dynamic>?> paramPost(String url, Map<String, dynamic> body,
//       {int code = 200}) async {
//     log.i(
//         '|Post param📍📍📍|----------------- [[ Post ]] param method Details Start -----------------|📍📍📍|');

//     log.i("##body given --> ");

//     log.i(body);

//     log.i("##url list --> $url");

//     log.i(
//         '|Post param📍📍📍|----------------- [[ Post ]] param method details ended ** ---------------|📍📍📍|');

//     try {
//       final response = await http
//           .post(
//             Uri.parse(url).replace(queryParameters: body),
//             headers: isBasic ? basicHeaderInfo() : await bearerHeaderInfo(),
//           )
//           .timeout(const Duration(seconds: 15));

//       log.i(
//           '|📒📒📒| ----------------[[ Post ]] Peram Response Start---------------|📒📒📒|');

//       log.i(response.body.toString());

//       log.i(
//           '|📒📒📒| ----------------[[ Post ]] Peram Response End **-----------------|📒📒📒|');

//       if (response.statusCode == code) {
//         return jsonDecode(response.body);
//       } else {
//         log.e('🐞🐞🐞 Error Alert 🐞🐞🐞');

//         log.e(
//             'unknown error hitted in status code' + jsonDecode(response.body));

//         ErrorResponse res = ErrorResponse.fromJson(jsonDecode(response.body));

//         CustomSnackBar.error(res.message.errors);

//         return null;
//       }
//     } on SocketException {
//       log.e('🐞🐞🐞 Error Alert on Socket Exception 🐞🐞🐞');

//       CustomSnackBar.error('Check your Internet Connection and try again!');

//       return null;
//     } on TimeoutException {
//       log.e('🐞🐞🐞 Error Alert 🐞🐞🐞');

//       log.e('Time out exception$url');

//       CustomSnackBar.error('Something Went Wrong! Try again');

//       return null;
//     } on http.ClientException catch (err, stackrace) {
//       log.e('🐞🐞🐞 Error Alert 🐞🐞🐞');

//       log.e('client exception hitted');

//       log.e(err.toString());

//       log.e(stackrace.toString());

//       return null;
//     } catch (e) {
//       log.e('🐞🐞🐞 Error Alert 🐞🐞🐞');

//       log.e('#url->$url||#body -> $body');

//       log.e('❌❌❌ unlisted error received');

//       log.e("❌❌❌ $e");

//       return null;
//     }
//   }

//   // Post Method
//   Future<Map<String, dynamic>?> multipart(
//       String url, Map<String, String> body, String filepath, String filedName,
//       {int code = 200}) async {
//     try {
//       log.i(
//           '|📍📍📍|-----------------[[ Multipart ]] method details start -----------------|📍📍📍|');

//       log.i(url);

//       log.i(body);
//       log.i(filepath);

//       log.i(
//           '|📍📍📍|-----------------[[ Multipart ]] method details end ------------|📍📍📍|');

//       final request = http.MultipartRequest(
//         'POST',
//         Uri.parse(url),
//       )
//         ..fields.addAll(body)
//         ..headers.addAll({
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer ${PrefUtils.getToken()}'
//         })
//         ..files.add(await http.MultipartFile.fromPath(filedName, filepath));
//       var response = await request.send();
//       var jsonData = await http.Response.fromStream(response);

//       log.i(
//           '|📒📒📒|-----------------[[ POST ]] method response start ------------------|📒📒📒|');

//       log.i(jsonData.body.toString());

//       log.i(response.statusCode);

//       log.i(
//           '|📒📒📒|-----------------[[ POST ]] method response end --------------------|📒📒📒|');

//       if (response.statusCode == code) {
//         return jsonDecode(jsonData.body) as Map<String, dynamic>;
//       } else {
//         log.e('🐞🐞🐞 Error Alert On Status Code 🐞🐞🐞');

//         log.e('unknown error hitted in status code ' +
//             jsonDecode(jsonData.body).toString());

//         ErrorResponse res = ErrorResponse.fromJson(jsonDecode(jsonData.body));

//         CustomSnackBar.error(res.message.errors);

//         // CustomSnackBar.error(
//         //     jsonDecode(response.body)['message']['error'].toString());
//         return null;
//       }
//     } on SocketException {
//       log.e('🐞🐞🐞 Error Alert on Socket Exception 🐞🐞🐞');

//       CustomSnackBar.error('Check your Internet Connection and try again!');

//       return null;
//     } on TimeoutException {
//       log.e('🐞🐞🐞 Error Alert Timeout Exception🐞🐞🐞');

//       log.e('Time out exception$url');

//       CustomSnackBar.error('Something Went Wrong! Try again');

//       return null;
//     } on http.ClientException catch (err, stackrace) {
//       log.e('🐞🐞🐞 Error Alert Client Exception🐞🐞🐞');

//       log.e('client exception hitted');

//       log.e(err.toString());

//       log.e(stackrace.toString());

//       return null;
//     } catch (e) {
//       log.e('🐞🐞🐞 Other Error Alert 🐞🐞🐞');

//       log.e('❌❌❌ unlisted error received');

//       log.e("❌❌❌ $e");

//       return null;
//     }
//   }

//   Future<Map<String, dynamic>?> multipartTwoimage(
//       String url,
//       Map<String, String> body,
//       String logoFilepath,
//       String logoFiledName,
//       String thumbFilepath,
//       String thumbFiledName,
//       {int code = 200}) async {
//     try {
//       log.i(
//           '|📍📍📍|-----------------[[ Multipart ]] method details start -----------------|📍📍📍|');

//       log.i(url);

//       log.i(body);
//       log.i(logoFilepath);
//       log.i(thumbFilepath);

//       log.i(
//           '|📍📍📍|-----------------[[ Multipart ]] method details end ------------|📍📍📍|');

//       final request = http.MultipartRequest(
//         'POST',
//         Uri.parse(url),
//       )
//         ..fields.addAll(body)
//         ..headers.addAll({
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer ${PrefUtils.getToken()}'
//         })
//         ..files.add(
//           await http.MultipartFile.fromPath(
//             logoFiledName,
//             logoFilepath,
//           ),
//         )
//         ..files.add(
//           await http.MultipartFile.fromPath(
//             thumbFiledName,
//             thumbFilepath,
//           ),
//         );
//       var response = await request.send();
//       var jsonData = await http.Response.fromStream(response);

//       log.i(
//           '|📒📒📒|-----------------[[ POST ]] method response start ------------------|📒📒📒|');

//       log.i(jsonData.body.toString());

//       log.i(response.statusCode);

//       log.i(
//           '|📒📒📒|-----------------[[ POST ]] method response end --------------------|📒📒📒|');

//       if (response.statusCode == code) {
//         return jsonDecode(jsonData.body) as Map<String, dynamic>;
//       } else {
//         log.e('🐞🐞🐞 Error Alert On Status Code 🐞🐞🐞');

//         log.e('unknown error hitted in status code ' +
//             jsonDecode(jsonData.body).toString());

//         ErrorResponse res = ErrorResponse.fromJson(jsonDecode(jsonData.body));

//         CustomSnackBar.error(res.message.errors);

//         // CustomSnackBar.error(
//         //     jsonDecode(response.body)['message']['error'].toString());
//         return null;
//       }
//     } on SocketException {
//       log.e('🐞🐞🐞 Error Alert on Socket Exception 🐞🐞🐞');

//       CustomSnackBar.error('Check your Internet Connection and try again!');

//       return null;
//     } on TimeoutException {
//       log.e('🐞🐞🐞 Error Alert Timeout Exception🐞🐞🐞');

//       log.e('Time out exception$url');

//       CustomSnackBar.error('Something Went Wrong! Try again');

//       return null;
//     } on http.ClientException catch (err, stackrace) {
//       log.e('🐞🐞🐞 Error Alert Client Exception🐞🐞🐞');

//       log.e('client exception hitted');

//       log.e(err.toString());

//       log.e(stackrace.toString());

//       return null;
//     } catch (e) {
//       log.e('🐞🐞🐞 Other Error Alert 🐞🐞🐞');

//       log.e('❌❌❌ unlisted error received');

//       log.e("❌❌❌ $e");

//       return null;
//     }
//   }

//   // Delete method
//   Future<Map<String, dynamic>?> delete(String url,
//       {int code = 202, bool isLogout = false}) async {
//     log.i(
//         '|📍📍📍|-----------------[[ DELETE ]] method details start-----------------|📍📍📍|');

//     log.i(url);

//     log.i(
//         '|📍📍📍|-----------------[[ DELETE ]] method details end ------------------|📍📍📍|');

//     try {
//       var headers = isBasic ? basicHeaderInfo() : await bearerHeaderInfo();

//       if (isLogout) {
// // headers

// // ..addAll({"fcm_token": await FirebaseMessaging.instance.getToken()});

//       }

//       log.i(headers);

//       final response = await http
//           .delete(
//             Uri.parse(url),
//             headers: headers,
//           )
//           .timeout(const Duration(seconds: 30));

//       log.i(
//           '|📒📒📒|----------------- [[ DELETE ]] method response start-----------------|📒📒📒|');

//       log.i(response.body.toString());

//       log.i(response.statusCode);

//       log.i(
//           '|📒📒📒|----------------- [[ DELETE ]] method response start-----------------|📒📒📒|');

//       if (response.statusCode == code) {
// // LocalStorage.clear();

//         return jsonDecode(response.body);
//       } else {
//         log.e('🐞🐞🐞 Error Alert 🐞🐞🐞');

//         log.e(
//             'unknown error hitted in status code' + jsonDecode(response.body));

//         ErrorResponse res = ErrorResponse.fromJson(jsonDecode(response.body));

//         CustomSnackBar.error(res.message.errors);

//         return null;
//       }
//     } on SocketException {
//       log.e('🐞🐞🐞 Error Alert on Socket Exception 🐞🐞🐞');

//       CustomSnackBar.error('Check your Internet Connection and try again!');

//       return null;
//     } on TimeoutException {
//       log.e('🐞🐞🐞 Error Alert 🐞🐞🐞');

//       log.e('Time out exception$url');

//       CustomSnackBar.error('Something Went Wrong! Try again');

//       return null;
//     } on http.ClientException catch (err, stackrace) {
//       log.e('🐞🐞🐞 Error Alert 🐞🐞🐞');

//       log.e('client exception hitted');

//       log.e(err.toString());

//       log.e(stackrace.toString());

//       return null;
//     } catch (e) {
//       log.e('🐞🐞🐞 Error Alert 🐞🐞🐞');

//       log.e('❌❌❌ unlisted error received');

//       log.e("❌❌❌ $e");

//       return null;
//     }
//   }

//   Future<Map<String, dynamic>?> put(String url, Map<String, dynamic> body,
//       {int code = 202}) async {
//     try {
//       log.i(
//           '|📍📍📍|-------------[[ PUT ]] method details start-----------------|📍📍📍|');

//       log.i(url);

//       log.i(body);

//       log.i(
//           '|📍📍📍|-------------[[ PUT ]] method details end ------------|📍📍📍|');

//       final response = await http
//           .put(
//             Uri.parse(url),
//             body: jsonEncode(body),
//             headers: isBasic ? basicHeaderInfo() : await bearerHeaderInfo(),
//           )
//           .timeout(const Duration(seconds: 30));

//       log.i(
//           '|📒📒📒|-----------------[[ PUT ]] AKA Update method response start-----------------|📒📒📒|');

//       log.i(response.body);

//       log.i(response.statusCode);

//       log.i(
//           '|📒📒📒|-----------------[[ PUT ]] AKA Update method response End -----------------|📒📒📒|');

//       if (response.statusCode == code) {
//         return jsonDecode(response.body);
//       } else {
//         log.e('🐞🐞🐞 Error Alert 🐞🐞🐞');

//         log.e(
//             'unknown error hitted in status code' + jsonDecode(response.body));

//         ErrorResponse res = ErrorResponse.fromJson(jsonDecode(response.body));

//         CustomSnackBar.error(res.message.errors);

//         return null;
//       }
//     } on SocketException {
//       log.e('🐞🐞🐞 Error Alert on Socket Exception 🐞🐞🐞');

//       CustomSnackBar.error('Check your Internet Connection and try again!');

//       return null;
//     } on TimeoutException {
//       log.e('🐞🐞🐞 Error Alert 🐞🐞🐞');

//       log.e('Time out exception$url');

//       CustomSnackBar.error('Request Timed out! Try again');

//       return null;
//     } on http.ClientException catch (err, stackrace) {
//       log.e('🐞🐞🐞 Error Alert 🐞🐞🐞');

//       log.e('client exception hitted');

//       log.e(err.toString());

//       log.e(stackrace.toString());

//       return null;
//     } catch (e) {
//       log.e('🐞🐞🐞 Error Alert 🐞🐞🐞');

//       log.e('unlisted catch error received');

//       log.e(e.toString());

//       return null;
//     }
//   }

//   // social Post Method
//   Future<Map<String, dynamic>?> googlePost(
//       String url, Map<String, dynamic> body,
//       {int code = 200}) async {
//     try {
//       log.i(
//           '|📍📍📍|-----------------[[ POST ]] method details start -----------------|📍📍📍|');

//       log.i(url);

//       // log.i(body);

//       log.i(
//           '|📍📍📍|-----------------[[ POST ]] method details end ------------|📍📍📍|');

//       final response = await http
//           .post(
//             Uri.parse(url),
//             body: jsonEncode(body),
//             headers: isBasic ? basicHeaderInfo() : await bearerHeaderInfo(),
//           )
//           .timeout(const Duration(seconds: 30));

//       log.i(
//           '|📒📒📒|-----------------[[ POST ]] method response start ------------------|📒📒📒|');

//       log.i(response.body.toString());

//       log.i(response.statusCode);

//       log.i(
//           '|📒📒📒|-----------------[[ POST ]] method response end --------------------|📒📒📒|');

//       if (response.statusCode == code) {
//         return jsonDecode(response.body);
//       } else {
//         log.e('🐞🐞🐞 Error Alert On Status Code 🐞🐞🐞');

//         // log.e('unknown error hitted in status code ' +
//         //     jsonDecode(response.body).toString());

//         // ErrorResponse res = ErrorResponse.fromJson(jsonDecode(response.body));

//         // CustomSnackBar.error(res.message.error.toString());

//         // CustomSnackBar.error(
//         //     jsonDecode(response.body)['message']['error'].toString());
//         return null;
//       }
//     } on SocketException {
//       log.e('🐞🐞🐞 Error Alert on Socket Exception 🐞🐞🐞');

//       CustomSnackBar.error('Check your Internet Connection and try again!');

//       return null;
//     } on TimeoutException {
//       log.e('🐞🐞🐞 Error Alert Timeout Exception🐞🐞🐞');

//       log.e('Time out exception$url');

//       CustomSnackBar.error('Something Went Wrong! Try again');

//       return null;
//     } on http.ClientException catch (err, stackrace) {
//       log.e('🐞🐞🐞 Error Alert Client Exception🐞🐞🐞');

//       log.e('client exception hitted');

//       log.e(err.toString());

//       log.e(stackrace.toString());

//       return null;
//     } catch (e) {
//       log.e('🐞🐞🐞 Other Error Alert 🐞🐞🐞');

//       log.e('❌❌❌ unlisted error received');

//       log.e("❌❌❌ $e");

//       return null;
//     }
//   }

//   // Post Method
//   Future<Map<String, dynamic>?> socialPost(
//       String url, Map<String, dynamic> body,
//       {int code = 200}) async {
//     try {
//       log.i(
//           '|📍📍📍|-----------------[[ POST ]] method details start -----------------|📍📍📍|');

//       log.i(url);

//       log.i(body);

//       log.i(
//           '|📍📍📍|-----------------[[ POST ]] method details end ------------|📍📍📍|');

//       final response = await http
//           .post(
//             Uri.parse(url),
//             body: jsonEncode(body),
//             headers: isBasic ? basicHeaderInfo() : await bearerHeaderInfo(),
//           )
//           .timeout(const Duration(seconds: 30));

//       log.i(
//           '|📒📒📒|-----------------[[ POST ]] method response start ------------------|📒📒📒|');

//       log.i(response.body.toString());

//       log.i(response.statusCode);

//       log.i(
//           '|📒📒📒|-----------------[[ POST ]] method response end --------------------|📒📒📒|');

//       if (response.statusCode == code) {
//         return jsonDecode(response.body);
//       } else {
//         log.e('🐞🐞🐞 Error Alert On Status Code 🐞🐞🐞');

//         log.e('unknown error hitted in status code ' +
//             jsonDecode(response.body).toString());

//         ErrorResponse res = ErrorResponse.fromJson(jsonDecode(response.body));

//         CustomSnackBar.error(res.message.errors);

//         // CustomSnackBar.error(
//         //     jsonDecode(response.body)['message']['error'].toString());
//         return null;
//       }
//     } on SocketException {
//       log.e('🐞🐞🐞 Error Alert on Socket Exception 🐞🐞🐞');

//       CustomSnackBar.error('Check your Internet Connection and try again!');

//       return null;
//     } on TimeoutException {
//       log.e('🐞🐞🐞 Error Alert Timeout Exception🐞🐞🐞');

//       log.e('Time out exception$url');

//       CustomSnackBar.error('Something Went Wrong! Try again');

//       return null;
//     } on http.ClientException catch (err, stackrace) {
//       log.e('🐞🐞🐞 Error Alert Client Exception🐞🐞🐞');

//       log.e('client exception hitted');

//       log.e(err.toString());

//       log.e(stackrace.toString());

//       return null;
//     } catch (e) {
//       log.e('🐞🐞🐞 Other Error Alert 🐞🐞🐞');

//       log.e('❌❌❌ unlisted error received');

//       log.e("❌❌❌ $e");

//       return null;
//     }
//   }
}
