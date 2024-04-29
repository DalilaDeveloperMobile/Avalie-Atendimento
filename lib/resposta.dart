import 'package:fluentui_emoji_icon/fluentui_emoji_icon.dart';
import 'package:flutter/material.dart';

class Resposta extends StatefulWidget {
  final String texto;
  final int nota;
  final void Function() quandoSelecionado;

  const Resposta(this.nota, this.texto, this.quandoSelecionado, {super.key});

  @override
  State<Resposta> createState() => _RespostaState();
}

class _RespostaState extends State<Resposta> {
  Map<String, FluentData> emojis = {
    'Amei': Fluents.flSmilingFaceWithHearts,
    'Perfeito': Fluents.flSmilingFaceWithSunglasses,
    'Triste': Fluents.flSadButRelievedFace,
    'Raiva': Fluents.flAngryFace,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple.shade300,
          foregroundColor: Colors.white,
        ),
        onPressed: widget.quandoSelecionado,
        child: ListTile(
          leading: FluentUiEmojiIcon(
            fl: emojis[widget.texto]!,
            w: 40,
            h: 40,
          ),
          title: Text(
            widget.texto,
            style: const TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          trailing: Text(
            'Potuação: ${widget.nota}',
            style: const TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
