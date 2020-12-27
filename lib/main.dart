import 'package:flutter/material.dart';

//-------------BOŞ UYGULAMA ÇERÇEVESİ-------------------------------------------
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Chat App",
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat App"),
      ),
      body: AnaEkran(),
    );
  }
}
//-------------BOŞ UYGULAMA ÇERÇEVESİ-------------------------------------------

//******************************************************************************

//-------------ANA EKRAN SINIFI-------------------------------------------

class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();
  List<MesajBalonu> mesajLitesi = [];

  //Gelen mesajları mesaj listesine ekler.
  listeyeEkle(String gelenMesaj) {
    setState(() {
      MesajBalonu mesajNesnesi = MesajBalonu(mesaj: gelenMesaj);
      mesajLitesi.insert(0, mesajNesnesi);
      t1.clear();
    });
  }

  //Gönderilecek metni girdiğimiz alt kısım.
  Widget metinGirisAlani() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(onSubmitted: listeyeEkle,
              controller: t1,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => listeyeEkle(t1.text),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              reverse: true,    //gelen listeyi tersten yazdırır.
              itemCount: mesajLitesi.length,
                itemBuilder: (context, indexNum) => mesajLitesi[indexNum]),
          ),
          Divider(
            thickness: 1,
          ),
          metinGirisAlani(),
        ],
      ),
    );
  }
}

String isim = "Kullanıcı";

//-------------ANA EKRAN SINIFI-------------------------------------------

//******************************************************************************

//-------------MESAJ BALONU SINIFI-------------------------------------------

class MesajBalonu extends StatelessWidget {
  String mesaj;

  //Constructor
  MesajBalonu({this.mesaj});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            child: Text(isim[0]),
          ),
          Column(
            children: <Widget>[
              Text(isim),
              Text(mesaj),
            ],
          ),
        ],
      ),
    );
  }
}
//-------------MESAJ BALONU SINIFI-------------------------------------------