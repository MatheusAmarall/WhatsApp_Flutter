import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List mensagens = [
    {
      'nome': 'Matheus Amaral',
      'data': '04 nov',
      'quantidadeNotificacoes': 3,
      'mensagem': 'Boa tarde'
    },
    {
      'nome': 'Leticia Teixeira',
      'data': '05 nov',
      'quantidadeNotificacoes': 0,
      'mensagem': 'LoremIpsum'
    },
    {
      'nome': 'João Antônio',
      'data': '07 nov',
      'quantidadeNotificacoes': 4,
      'mensagem': 'LoremIpsum'
    },
    {
      'nome': 'Celso Pereira',
      'data': '04 nov',
      'quantidadeNotificacoes': 4,
      'mensagem': 'LoremIpsum'
    },
  ];

  List<Widget> listaDeListTiles = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF25D366),
          title: Text("WhatsApp"),
          actions: [
            Icon(Icons.search),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Icon(Icons.more_vert),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight + 10),
            child: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(icon: Icon(Icons.camera_alt)),
                Tab(text: 'CHAT'),
                Tab(text: 'STATUS'),
                Tab(text: 'CALLS'),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Camera')),
            Center(
                child: Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: mensagens.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(''),
                      backgroundColor: Color.fromARGB(255, 7, 94, 84),
                    ),
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(mensagens[index]["nome"]),
                        ),
                        Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    mensagens[index]["data"],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                    ),
                                  ),
                                  mensagens[index]["quantidadeNotificacoes"] > 0
                                      ? Container(
                                          width: 18,
                                          height: 18,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.green,
                                          ),
                                          child: Center(
                                            child: Text(
                                              mensagens[index]
                                                      ["quantidadeNotificacoes"]
                                                  .toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox()
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(mensagens[index]["mensagem"]),
                  );
                },
              ),
            )),
            Center(child: Text('Status')),
            Center(child: Text('calls')),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xFF25D366),
          child: Icon(Icons.message),
        ),
      ),
    );
  }
}
