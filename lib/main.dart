import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Avalie a sua satisfação quanto a capacidade'
          ' do atendente em resolver seu problema?',
      'respostas': [
        {'texto': 'Raiva', 'pontuacao': 0},
        {'texto': 'Triste', 'pontuacao': 5},
        {'texto': 'Amei', 'pontuacao': 9},
        {'texto': 'Perfeito', 'pontuacao': 10},
      ],
    },
    {
      'texto':
          'Avalie a sua satisfação quanto você achou que o atendente demonstrou'
              ' preocupação com seu problema?',
      'respostas': [
        {'texto': 'Raiva', 'pontuacao': 0},
        {'texto': 'Triste', 'pontuacao': 5},
        {'texto': 'Amei', 'pontuacao': 9},
        {'texto': 'Perfeito', 'pontuacao': 10},
      ],
    },
    {
      'texto':
          'Avalie a sua satisfação quanto a rapidez e eficiência do atendimento fornecido?',
      'respostas': [
        {'texto': 'Raiva', 'pontuacao': 0},
        {'texto': 'Triste', 'pontuacao': 5},
        {'texto': 'Amei', 'pontuacao': 9},
        {'texto': 'Perfeito', 'pontuacao': 10},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avalie',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple.shade100,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.deepPurple.withOpacity(0.5),
          centerTitle: true,
          title: const Text(
            'Avalie Atendimento',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
