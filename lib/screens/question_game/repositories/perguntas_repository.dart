import 'package:vacinandoedu_app/screens/question_game/pages/questions_model.dart';

class PerguntasRepository {
  List<Question> perguntas = [
    Question(
      id: '1',
      title: "Qual é o principal benefício da vacinação para a saúde pública?",
      options: const {
        'Redução da expectativa de vida': false,
        'Aumento da resistência a doenças': true,
        'Aumento da taxa de infecção': false,
        'Diminuição da eficácia dos medicamentos': false
      },
      nivel: 1,
      fase: 1,
    ),
    Question(
      id: '2',
      title:
          "Qual é o nome dado à imunidade adquirida através da vacinação em uma grande parte da população?",
      options: const {
        'Imunidade coletiva': true,
        'Imunidade genética': false,
        'Imunidade natural': false,
        'Imunidade passiva': false,
      },
      nivel: 1,
      fase: 1,
    ),
    Question(
      id: '3',
      title:
          "Qual é o objetivo do Programa Nacional de Imunizações (PNI) no Brasil?",
      options: const {
        'Promover a venda de medicamentos': false,
        'Garantir acesso gratuito às vacinas': true,
        'Aumentar o custo dos serviços de saúde': false,
        'Reduzir o acesso às vacinas': false,
      },
      nivel: 1,
      fase: 1,
    ),
    Question(
      id: '4',
      title: "Qual é o principal objetivo da vacinação?",
      options: const {
        'Tratar doenças': false,
        'Diagnosticar doenças': false,
        'Prevenir doenças': true,
        'Eliminar doenças': false,
      },
      nivel: 1,
      fase: 1,
    ),
    Question(
      id: '5',
      title: "Qual é o principal benefício da vacinação para a saúde pública?",
      options: const {
        'Redução da expectativa de vida': false,
        'Aumento da resistência a doenças': true,
        'Aumento da taxa de infecção': false,
        'Diminuição da eficácia dos medicamentos': false
      },
      nivel: 1,
      fase: 2,
    ),
    Question(
      id: '6',
      title:
          "Qual é o nome dado à imunidade adquirida através da vacinação em uma grande parte da população?",
      options: const {
        'Imunidade coletiva': true,
        'Imunidade genética': false,
        'Imunidade natural': false,
        'Imunidade passiva': false,
      },
      nivel: 1,
      fase: 2,
    ),
    Question(
      id: '7',
      title:
          "Qual é o objetivo do Programa Nacional de Imunizações (PNI) no Brasil?",
      options: const {
        'Promover a venda de medicamentos': false,
        'Garantir acesso gratuito às vacinas': true,
        'Aumentar o custo dos serviços de saúde': false,
        'Reduzir o acesso às vacinas': false,
      },
      nivel: 1,
      fase: 2,
    ),
    Question(
      id: '8',
      title: "Qual é o principal objetivo da vacinação?",
      options: const {
        'Tratar doenças': false,
        'Diagnosticar doenças': false,
        'Prevenir doenças': true,
        'Eliminar doenças': false,
      },
      nivel: 1,
      fase: 2,
    ),
    Question(
        id: '9',
        title: "Quais doenças podem ser prevenidas por meio da vacinação?",
        options: const {
          'Resfriado comum': false,
          'Diabetes tipo 2': false,
          'Sarampo': true,
          'Artrite reumatoide': false
        },
        nivel: 1,
        fase: 2),
    Question(
        id: '10',
        title:
            "Qual vírus causou a pandemia global declarada pela Organização Mundial da Saúde (OMS) em 2019?",
        options: const {
          'SARS-CoV-2(Coronavírus)': true,
          'Ebola': false,
          'Zika': false,
          'H1N1(Influenza A)': false,
        },
        nivel: 1,
        fase: 2),
    Question(
        id: '11',
        title: "Qual é o agente causador da dengue",
        options: const {
          'Vírus da Dengue': true,
          'Vírus Zika': false,
          'Vírus Ebola': false,
          'Vírus Influenza': false,
        },
        nivel: 1,
        fase: 2),
    Question(
        id: '12',
        title:
            "Além de evitar o acúmulo de água parada, qual outra medida é importante para prevenir a dengue?",
        options: const {
          'Tomar aspirina regularmente': false,
          'Consumir alimentos gordurosos': false,
          'Usar repelentes de insetos': true,
          'Evitar o consumo de água potável': false,
        },
        nivel: 1,
        fase: 2),
    Question(
        id: '13',
        title: "Qual é o papel do farmacêutico na cadeia de vacinação?",
        options: const {
          'Armazenar e preparar vacinas': true,
          'Diagnosticar doenças': false,
          'Administrar vacinas': false,
          'Conduzir cirurgias': false
        },
        nivel: 2,
        fase: 1),
    Question(
        id: '14',
        title: "Qual é a função do enfermeiro vacinador?",
        options: const {
          'Diagnosticar doenças': false,
          'Preparar vacinas': false,
          'Administrar vacinas': true,
          'Prescrever tratamentos': false,
        },
        nivel: 2,
        fase: 1),
    Question(
        id: '15',
        title:
            "Quais são as responsabilidades do médico em relação à vacinação?",
        options: const {
          'Administrar vacinas': false,
          'Prescrever vacinas': true,
          'Desenvolver novas vacinas': false,
          'Criar políticas de vacinação': false,
        },
        nivel: 2,
        fase: 1),
    Question(
        id: '16',
        title:
            "Qual é o documento oficial utilizado no Brasil para registrar todas as vacinas recebidas ao longo da vida?",
        options: const {
          'Certidão de Nascimento': false,
          'Carteira de Identidade': false,
          'Carteira de Vacinação': true,
          'Carteira de Trabalho': false,
        },
        nivel: 2,
        fase: 1),
    Question(
        id: '17',
        title: "Qual é o papel do farmacêutico na cadeia de vacinação?",
        options: const {
          'Armazenar e preparar vacinas': true,
          'Diagnosticar doenças': false,
          'Administrar vacinas': false,
          'Conduzir cirurgias': false
        },
        nivel: 2,
        fase: 2),
    Question(
        id: '18',
        title: "Qual é a função do enfermeiro vacinador?",
        options: const {
          'Diagnosticar doenças': false,
          'Preparar vacinas': false,
          'Administrar vacinas': true,
          'Prescrever tratamentos': false,
        },
        nivel: 2,
        fase: 2),
    Question(
        id: '19',
        title:
            "Quais são as responsabilidades do médico em relação à vacinação?",
        options: const {
          'Administrar vacinas': false,
          'Prescrever vacinas': true,
          'Desenvolver novas vacinas': false,
          'Criar políticas de vacinação': false,
        },
        nivel: 2,
        fase: 2),
    Question(
        id: '20',
        title:
            "Qual é o documento oficial utilizado no Brasil para registrar todas as vacinas recebidas ao longo da vida?",
        options: const {
          'Certidão de Nascimento': false,
          'Carteira de Identidade': false,
          'Carteira de Vacinação': true,
          'Carteira de Trabalho': false,
        },
        nivel: 2,
        fase: 2),
    Question(
        id: '21',
        title: "Onde os registros de vacinas são feitos no Brasil?",
        options: const {
          'Nos hospitais': false,
          'Nas escolas': false,
          'Nos postos de saúde': true,
          'Nas farmácias': false
        },
        nivel: 2,
        fase: 2),
    Question(
        id: '22',
        title: "Qual é a função do técnico de enfermagem durante a vacinação?",
        options: const {
          'Realizar exames médicos': false,
          'Administrar vacinas': true,
          'Prescrever medicamentos': false,
          'Gerenciar registros médicos': false
        },
        nivel: 2,
        fase: 2),
    Question(
        id: '23',
        title:
            "Qual é o nome da doença respiratória causada pelo vírus que desencadeou a pandemia em 2019?",
        options: const {
          'Dengue': false,
          'COVID-19': true,
          'Febre amarela': false,
          'Tuberculose': false
        },
        nivel: 2,
        fase: 2),
    Question(
        id: '24',
        title: "Quais são os possíveis efeitos colaterais comuns da vacinação?",
        options: const {
          'Dor de cabeça e febre baixa': true,
          'Crescimento de cabelo': false,
          'Perda de apetite': false,
          'Visão turva': false,
        },
        nivel: 2,
        fase: 2),
  ];
}
