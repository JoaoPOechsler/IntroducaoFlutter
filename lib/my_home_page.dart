import 'package:flutter/material.dart';
import 'package:introducao_flutter/fiscal.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _incrementando = true;
  int _contador = 0;
  List<int> _historico = [];
  int _total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Car meet App'),
      ),
      drawer: _buildDrawer(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementarOuDecrementar,
        tooltip: _incrementando ? 'Incremento' : 'Decremento',
        child: _incrementando ? Icon(Icons.add) : Icon(Icons.remove),
      ),
    );
  }

  Center _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Contador:',
            style: TextStyle(
              fontSize: 46.0,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
          Text(
            '$_contador',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26.0,
            ),
          ),
          const SizedBox(height: 40.0),
          const Text(
            'Histórico:',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 46.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              _historico.isEmpty ? '(Nenhum)' : _historico.join(' , '),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26.0,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 80.0),
          const Text(
            'Total:',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 46.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              '$_total',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26.0,
                color: Colors.white,
              ),
            ),
          ),
          // Icon(Icons.info, size: 60.0, color: Colors.purple),
        ],
      ),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      backgroundColor: Color(0xFF383838),
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.clear),
              title: Text('Zerar Contador'),
              onTap: _zerar),
          ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.swap_calls),
              title: Text('Inverter Contador'),
              onTap: _inverter),
          ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.memory),
              title: Text('Memorizar Contador'),
              onTap: _memorizar),
        ],
      ),
    );
  }

  void _incrementarOuDecrementar() {
    // mainNotaFiscal();
    setState(() {
      if (_incrementando) {
        _contador++;
      } else {
        _contador--;
      }
    });
  }

  void _zerar() {
    Navigator.of(context).pop();
    setState(() {
      _contador = 0;
      _historico.clear();
    });
  }

  void _inverter() {
    Navigator.of(context).pop();
    setState(() {
      _incrementando = !_incrementando;
    });
  }

  void _memorizar() {
    Navigator.of(context).pop();
    setState(() {
      _historico.add(_contador);

      if (_historico.isEmpty) {
        _total = 0;
      } else {
        setState(() {
          _total = _historico.reduce((a, b) => a + b);
        });
      }
    });
  }
}
