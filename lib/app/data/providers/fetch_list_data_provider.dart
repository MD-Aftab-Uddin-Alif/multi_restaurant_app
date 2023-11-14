import 'package:multi_restaurant_app/package_routes.dart';
import 'package:http/http.dart' as http;

Future<void> fetchListDataProvider({
  required String functionName,
  required String listFor,
  required String apiUrl,
  required Function(dynamic) dataCallback,
  forcePrint,
}) async {
  try {
    http.Response response = await http.get(
      Uri.parse(apiUrl),
      headers: ApiUrl.apiHeader,
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final status = responseData['status'];
      final message = responseData['message'];

      DP.status('Response Received for $listFor', functionName,
          forcePrint: AppConstant.isAllDebugging || forcePrint);
      DP.debug('$listFor Data Fetched,  ${response.body}}', functionName,
          forcePrint: AppConstant.isAllDebugging || forcePrint);

      if (status == 'success') {
        if (responseData['data'] != null && responseData['data'].isNotEmpty) {
          dataCallback(responseData['data']);
        } else {
          DP.status('$listFor Data is Empty', functionName,
              forcePrint: AppConstant.isAllDebugging || forcePrint);
        }
      } else {
        DP.warning(
          '$listFor Data Fetching Failed from the Server Side. \nMessage: $message',
          functionName,
        );
      }
    } else {
      DP.error(
          '$listFor Data Fetching Failed. \nStatus Code: ${response.statusCode}; Status body: ${response.body}',
          functionName);
    }
  } catch (e) {
    DP.fatal('Something went Wrong while fetching data, ${e.toString()}',
        functionName);
  }
}
