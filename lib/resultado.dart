import 'package:fluentui_emoji_icon/fluentui_emoji_icon.dart';
import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  const Resultado(this.pontuacao, this.quandoReiniciarQuestionario,
      {super.key});

  @override
  State<Resultado> createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  Map<String, FluentData> emojis = {
    'Atendimento Amável!': Fluents.flSmilingFaceWithHearts,
    'Atendimento Perfeito!': Fluents.flSmilingFaceWithSunglasses,
    'Atendimento Bem Sucedido!': Fluents.flSmilingFaceWithSunglasses,
    'Atendimento Triste!': Fluents.flSadButRelievedFace,
    'Atendimento Raivoso!': Fluents.flAngryFace,
  };

  String get fraseResultado {
    if (widget.pontuacao == 0 || widget.pontuacao < 5) {
      return 'Atendimento Raivoso!';
    } else if (widget.pontuacao == 5 || widget.pontuacao < 17) {
      return 'Atendimento Triste!';
    } else if (widget.pontuacao == 9 || widget.pontuacao < 20) {
      return 'Atendimento Amável!';
    } else if (widget.pontuacao == 10 || widget.pontuacao < 30) {
      return 'Atendimento Perfeito!';
    } else {
      return 'Atendimento Bem Sucedido!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FluentUiEmojiIcon(
          fl: emojis[fraseResultado]!,
          w: 40,
          h: 40,
        ),
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(
              fontSize: 26,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextButton(
          onPressed: widget.quandoReiniciarQuestionario,
          child: const Text(
            'Reiniciar?',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
