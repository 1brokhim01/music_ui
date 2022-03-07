import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:home30/core/constants/color_const.dart';
import 'package:home30/core/constants/text_const.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with TickerProviderStateMixin {
  AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlay = false;
  bool isFirst = true;
  Duration _position = Duration(seconds: 0);
  Duration _maxDuration = Duration(seconds: 0);
  List<String> musicList = [
    "https://dl.music-hit.com/mp3/41878.mp3?blatnoi-udar_-_dolya-vorovskaya.mp3",
    "https://a1.dlshare.net/sdg/5f/50/8e/129109417_118301632.mp3?name=komar-zapretnaya-zona--rep-eto-delo-chesti.mp3",
    "https://cdn2.sefon.pro/download/rXQCKt5JraVMhLfmjjd1jA/1646591898/268/Xcho%20-%20%D0%AD%D1%81%D0%BA%D0%B8%D0%B7%D1%8B.mp3"
  ];
  @override
  void initState() {
    super.initState();
    _audioPlayer.onDurationChanged.listen((Duration d) {
      debugPrint("Max Duration: $d");
      setState(() {
        _maxDuration = d;
      });
    });
    _audioPlayer.onAudioPositionChanged.listen((Duration p) {
      debugPrint("Current position: $p");
      setState(() {
        _position = p;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 1,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://images.unsplash.com/photo-1526218626217-dc65a29bb444?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2luZ2VyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 1,
          color: ColorConst.kPrimary_purple_opacitty,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu_outlined,
                          color: ColorConst.kPrimary_white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.settings,
                          color: ColorConst.kPrimary_white,
                        )),
                  ],
                ),
                txt("FROM PLAYLIST", 18, ColorConst.kPrimary_purple_txt),
                txt("PlayList Name", 18, ColorConst.kPrimary_purple_txt),
                const SizedBox(
                  height: 60,
                ),
                const Center(
                  child: CircleAvatar(
                      radius: 90,
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1526218626217-dc65a29bb444?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2luZ2VyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60")),
                ),
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: Column(
                    children: [
                      txt("TRACK NAME", 18, ColorConst.kPrimary_white),
                      txt("Artist Name", 18, ColorConst.kPrimary_white),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.chevron_left_outlined,
                          size: 45,
                        ),
                        color: ColorConst.kPrimary_white),
                    IconButton(
                      onPressed: () async {
                        if (isPlay) {
                          await play("${musicList[0]}");
                        } else {
                          pouse();
                        }
                      },
                      icon: isPlay
                          ? Icon(Icons.play_circle_outline_outlined,
                              size: 35, color: ColorConst.kPrimary_white)
                          : Icon(Icons.pause_circle_outline_sharp,
                              size: 35, color: ColorConst.kPrimary_white),
                    ),
                    IconButton(
                        onPressed: () async {
                          setState(() {
                            var press = 0 + 1;
                            for (var i in musicList) {
                              if (press == 0) {
                                _audioPlayer.play(
                                    "https://dl.music-hit.com/mp3/41878.mp3?blatnoi-udar_-_dolya-vorovskaya.mp3");
                              } else if (press == 1) {
                                _audioPlayer.play(
                                    "https://cdn2.sefon.pro/download/rXQCKt5JraVMhLfmjjd1jA/1646591898/268/Xcho%20-%20%D0%AD%D1%81%D0%BA%D0%B8%D0%B7%D1%8B.mp3");
                              } else if (press == 2) {
                                _audioPlayer.play(
                                    "https://cdn2.sefon.pro/download/rXQCKt5JraVMhLfmjjd1jA/1646591898/268/Xcho%20-%20%D0%AD%D1%81%D0%BA%D0%B8%D0%B7%D1%8B.mp3");
                              }
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.chevron_right_outlined,
                          size: 45,
                        ),
                        color: ColorConst.kPrimary_white),
                  ],
                ),
                Slider(
                  activeColor: ColorConst.kPrimary_white,
                  value: _position.inSeconds.toDouble(),
                  min: 0.0,
                  max: _maxDuration.inSeconds.toDouble(),
                  onChanged: (v) {},
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("$_position"),
                      Text("$_maxDuration"),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  play(String url) async {
    int? result;
    if (isFirst) {
      int result = await _audioPlayer.play(url);
      isFirst = !isFirst;
      if (result == 1) {
        debugPrint("Music play bo'ldi");
        isPlay = !isPlay;
      } else {
        debugPrint("Music pouse bo'ldi");
      }
    } else {
      isPlay = !isPlay;
      _audioPlayer.resume();
    }
    setState(() {});
  }

  Future pouse() async {
    await _audioPlayer.pause();
    isPlay = !isPlay;
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }
}
