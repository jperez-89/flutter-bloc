import 'package:flutter/material.dart';
import 'package:blocs_app/data.dart';
import 'package:url_launcher/url_launcher.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  String? _selectedCountryKey;

  @override
  Widget build(BuildContext context) {
    //? Accedemos al nombre de la ruta actual
    print(
        '===> Nombre de la ruta actual ${ModalRoute.of(context)?.settings.name}');

    return Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: const Text('Test Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _selectedCountryKey,
                    hint: const Text('Select a country'),
                    items: CommonsConstants.LINK.keys.map((String key) {
                      return DropdownMenuItem<String>(
                        value: key,
                        child: Text(key.toUpperCase()),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      print(newValue);
                      setState(() {
                        _selectedCountryKey = newValue;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    const Text(
                      'BAC Country Link:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    if (_selectedCountryKey != null)
                      TextButton(
                        onPressed: () async {
                          final urlString =
                              CommonsConstants.LINK[_selectedCountryKey]!;
                          print(urlString);
                          final url = Uri.parse(urlString);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          }
                        },
                        child: Text(
                          CommonsConstants.LINK[_selectedCountryKey]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    else
                      const Text(
                        'Select a country to see the link',
                        style: TextStyle(
                            fontSize: 12, fontStyle: FontStyle.italic),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // ===================================

        bottomNavigationBar: ColoredBox(
          color: Colors.green,
          child: SafeArea(
            top: false,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    backgroundColor: Colors.blue[600],
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
        // ===================================
        );
  }
}
