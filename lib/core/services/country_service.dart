import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:banking/core/models/country.dart';

class CountryService {
  static const _baseUrl =
      "https://restcountries.com/v3.1/region/africa?fields=name,cca2,idd,flag";

  static Future<List<Country>> fetchAfricanCountries() async {
    try {
      final response = await http
          .get(Uri.parse(_baseUrl))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode != 200) {
        throw Exception("Server error: ${response.statusCode}");
      }

      final List<dynamic> data = jsonDecode(response.body);

      final countries = data.map<Country>((json) {
        final Map<String, dynamic>? idd = json["idd"];
        String dialCode = "";

        if (idd != null) {
          final root = idd["root"] ?? "";
          final suffixes = idd["suffixes"];
          if (suffixes is List && suffixes.isNotEmpty) {
            dialCode = "$root${suffixes.first}";
          }
        }

        return Country(
          name: json["name"]?["common"] ?? "",
          code: json["cca2"] ?? "",
          dialCode: dialCode,
          flag: json["flag"] ?? "",
        );
      }).where((c) => c.name.isNotEmpty).toList();

      countries.sort((a, b) => a.name.compareTo(b.name));

      return countries;
    } catch (e) {
      throw Exception("Failed to fetch countries: $e");
    }
  }
}