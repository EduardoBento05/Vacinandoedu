import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:vacinandoedu_app/constants.dart';
import 'package:vacinandoedu_app/pages/initial_page.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  double _volume = 50.0;
  bool _temaEscuro = false;

  void _alterarVolume(double novoVolume) {
    setState(() {
      _volume = novoVolume;
    });
  }

  void _alterarTema(bool novoTema) {
    setState(() {
      _temaEscuro = novoTema;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: grayHighlight,
        shadowColor: Colors.grey[400],
        centerTitle: true,
        title: const Text('Configurações'),
      ),
      endDrawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                blueStart,
                purpleEnd,
              ],
            ),
          ),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Configurações',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => InitialPage()),
                    (route) => false,
                  );
                },
              ),
              ListTile(
                title: Text('Sound'),
                leading: Icon(Icons.audiotrack),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              blueStart,
              purpleEnd,
            ],
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Volume de Som',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Slider(
              value: _volume,
              min: 0,
              max: 100,
              divisions: 10,
              label: _volume.round().toString(),
              onChanged: (double novoVolume) {
                _alterarVolume(novoVolume);
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Tema:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: Text('Tema escuro'),
              value: _temaEscuro,
              onChanged: (bool novoTema) {
                _alterarTema(novoTema);
              },
            ),
          ],
        ),
      ),
    );
  }
}
