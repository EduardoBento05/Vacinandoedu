import 'package:vacinandoedu_app/models/questions_model.dart';

class PerguntasRepository {
  List<Question> perguntas = [
    Question(
        id: '1',
        title: "Este nível é sobre o que?",
        options: const {
          'A Historia da Vacina': true,
          'COVID': false,
          'Vacininha': false,
          'Futebol': false
        },
        nivel: 1,
        fase: 1),
    Question(
        id: '2',
        title: "Mais de quantos anos a primeira vacina apareceu no mundo?",
        options: const {
          '200': true,
          '100': false,
          '50': false,
          '27': false,
        },
        nivel: 1,
        fase: 1),
    Question(
        id: '3',
        title: "A primeira Vacina foi criada para combater qual doença?",
        options: const {
          'Varíola': true,
          'Sarampo': false,
          'Febre-Amarela': false,
          'Gripe': false,
        },
        nivel: 1,
        fase: 1),
    Question(
        id: '4',
        title: "A Primeira Vacina Surgiu em Que País?",
        options: const {
          'Estados Unidos': false,
          'Brasil': false,
          'Inglaterra': true,
          'China': false,
        },
        nivel: 1,
        fase: 1),
    Question(
        id: '5',
        title:
            "Qual Doença que provoca pequenas feridas por todo corpo, febre alta e fraqueza?",
        options: const {
          'Sarampo': false,
          'COVID': false,
          'Varíola': true,
          'Gripe': false
        },
        nivel: 1,
        fase: 2),
    Question(
        id: '6',
        title: "Como a varíola era transmitida?",
        options: const {
          'AR/goticulas de saliva': true,
          'Coçando a cabeça': false,
          'levantando o braço': false,
          'correndo': false
        },
        nivel: 1,
        fase: 2),
    Question(
        id: '7',
        title: "Que médico combinou a Prática da Variolação?",
        options: const {
          'Edward Jenner': true,
          'Drauzio Varela': false,
          'Oswaldo Cruz': false,
          'Crawford Long': false
        },
        nivel: 1,
        fase: 2),
    Question(
        id: '8',
        title: "A prática da variolação foi desenvolvida em Qual País?",
        options: const {
          'Egito': false,
          'China': true,
          'Grécia': false,
          'Inglaterra': false
        },
        nivel: 1,
        fase: 2),
    Question(
        id: '9',
        title: "Este nível é sobre o que?",
        options: const {
          'A Historia da Vacina': true,
          'COVID': false,
          'Vacininha': false,
          'Futebol': false
        },
        nivel: 1,
        fase: 2),
    Question(
        id: '10',
        title: "Mais de quantos anos a primeira vacina apareceu no mundo?",
        options: const {
          '200': true,
          '100': false,
          '50': false,
          '27': false,
        },
        nivel: 1,
        fase: 2),
    Question(
        id: '11',
        title: "A primeira Vacina foi criada para combater qual doença?",
        options: const {
          'Varíola': true,
          'Sarampo': false,
          'Febre-Amarela': false,
          'Gripe': false,
        },
        nivel: 1,
        fase: 2),
    Question(
        id: '12',
        title: "A Primeira Vacina Surgiu em Que País?",
        options: const {
          'Estados Unidos': false,
          'Brasil': false,
          'Inglaterra': true,
          'China': false,
        },
        nivel: 1,
        fase: 2),
    Question(
        id: '13',
        title:
            "Quantos anos atras a variolação foi desenvolvida pelos Chineses?",
        options: const {
          '1000': true,
          '2000': false,
          '430': false,
          '220': false,
        },
        nivel: 1,
        fase: 3),
    Question(
        id: '14',
        title:
            "Em que animal foi transmitido um dos primeiros casos de Varíola",
        options: const {
          'Papagaio': false,
          'Gato': false,
          'Vaca': true,
          'Cachorro': false
        },
        nivel: 1,
        fase: 3),
    Question(
        id: '15',
        title:
            "Qual Doença que provoca pequenas feridas por todo corpo, febre alta e fraqueza?",
        options: const {
          'Sarampo': false,
          'COVID': false,
          'Varíola': false,
          'Gripe': true
        },
        nivel: 1,
        fase: 3),
    Question(
        id: '16',
        title: "Como a varíola era transmitida?",
        options: const {
          'AR/goticulas de saliva': true,
          'Coçando a cabeça': false,
          'levantando o braço': false,
          'correndo': false
        },
        nivel: 1,
        fase: 3),
    Question(
        id: '17',
        title: "Que médico combinou a Prática da Variolação?",
        options: const {
          'Edward Jenner': true,
          'Drauzio Varela': false,
          'Oswaldo Cruz': false,
          'Crawford Long': false
        },
        nivel: 1,
        fase: 3),
    Question(
        id: '18',
        title: "A prática da variolação foi desenvolvida em Qual País?",
        options: const {
          'Egito': false,
          'China': true,
          'Grécia': false,
          'Inglaterra': false
        },
        nivel: 1,
        fase: 3),
    Question(
        id: '19',
        title: "Este nível é sobre o que?",
        options: const {
          'A Historia da Vacina': true,
          'COVID': false,
          'Vacininha': false,
          'Futebol': false
        },
        nivel: 1,
        fase: 3),
    Question(
        id: '20',
        title: "Mais de quantos anos a primeira vacina apareceu no mundo?",
        options: const {
          '200': true,
          '100': false,
          '50': false,
          '27': false,
        },
        nivel: 1,
        fase: 3),
    Question(
        id: '21',
        title: "A primeira Vacina foi criada para combater qual doença?",
        options: const {
          'Varíola': true,
          'Sarampo': false,
          'Febre-Amarela': false,
          'Gripe': false,
        },
        nivel: 1,
        fase: 3),
    Question(
        id: '22',
        title: "A Primeira Vacina Surgiu em Que País?",
        options: const {
          'Estados Unidos': false,
          'Brasil': false,
          'Inglaterra': true,
          'China': false,
        },
        nivel: 1,
        fase: 3),
    Question(
        id: '23',
        title: "Este nível é sobre o que?",
        options: const {
          'A Historia da Vacina': false,
          'COVID': false,
          'Algumas das Vacinas Mais Importantes': true,
          'Medicina': false
        },
        nivel: 2,
        fase: 1),
    Question(
        id: '24',
        title: "Todas as Vacinas São Importantes?",
        options: const {
          'Sim': true,
          'Talvez': false,
          'Não sei': false,
          'Depende': false,
        },
        nivel: 2,
        fase: 1),
    Question(
        id: '25',
        title: "Quantas Vacinas vocês aprenderam durante as Aulas?",
        options: const {
          '2': false,
          '5': false,
          '6': true,
          '4': false,
        },
        nivel: 2,
        fase: 1),
    Question(
        id: '26',
        title: "O que a vacina bcg combate?",
        options: const {
          'HBV': false,
          'PolioVirus': false,
          'Tuberculose': true,
          'Caxumba': false,
        },
        nivel: 2,
        fase: 1),
    Question(
        id: '27',
        title: "Este nível é sobre o que?",
        options: const {
          'A Historia da Vacina': false,
          'COVID': false,
          'Algumas das Vacinas Mais Importantes': true,
          'Medicina': false
        },
        nivel: 2,
        fase: 2),
    Question(
        id: '28',
        title: "Todas as Vacinas São Importantes?",
        options: const {
          'Sim': true,
          'Talvez': false,
          'Não sei': false,
          'Depende': false,
        },
        nivel: 2,
        fase: 2),
    Question(
        id: '29',
        title: "Quantas Vacinas vocês aprenderam durante as Aulas?",
        options: const {
          '2': false,
          '5': false,
          '6': true,
          '4': false,
        },
        nivel: 2,
        fase: 2),
    Question(
        id: '30',
        title: "O que a vacina BCG combate?",
        options: const {
          'HBV': false,
          'PolioVirus': false,
          'Tuberculose': true,
          'Caxumba': false,
        },
        nivel: 2,
        fase: 2),
    Question(
        id: '31',
        title: "O que a vacina Hepatite B previne?",
        options: const {
          'Caxumba': false,
          'Tuberculose': false,
          'HBV': true,
          'Gripe': false
        },
        nivel: 2,
        fase: 2),
    Question(
        id: '32',
        title: "Quem deve Tomar a vacina de Hepatite B",
        options: const {
          'Adultos': false,
          'Crianças': false,
          'Todos': true,
          'Idosos': false
        },
        nivel: 2,
        fase: 2),
    Question(
        id: '33',
        title: "O que a vacina de Poliomielite  previne?",
        options: const {
          'Caxumba': false,
          'Poliovirus': true,
          'HBC': false,
          'Sarampo': false
        },
        nivel: 2,
        fase: 2),
    Question(
        id: '34',
        title: "Até quando é recomentando tomar doses de Poliomielite?",
        options: const {
          '12 meses': false,
          '13 meses': false,
          '14 meses': false,
          '15 meses': true,
        },
        nivel: 2,
        fase: 2),
    Question(
        id: '35',
        title: "Este nível é sobre o que?",
        options: const {
          'A Historia da Vacina': false,
          'COVID': false,
          'Algumas das Vacinas Mais Importantes': true,
          'Medicina': false
        },
        nivel: 2,
        fase: 3),
    Question(
        id: '36',
        title: "Todas as Vacinas São Importantes?",
        options: const {
          'Sim': true,
          'Talvez': false,
          'Não sei': false,
          'Depende': false,
        },
        nivel: 2,
        fase: 3),
    Question(
        id: '37',
        title: "Quantas Vacinas vocês aprenderam durante as Aulas?",
        options: const {
          '2': false,
          '5': false,
          '6': true,
          '4': false,
        },
        nivel: 2,
        fase: 3),
    Question(
        id: '38',
        title: "O que a vacina BCG combate?",
        options: const {
          'HBV': false,
          'PolioVirus': false,
          'Tuberculose': true,
          'Caxumba': false,
        },
        nivel: 2,
        fase: 3),
    Question(
        id: '39',
        title: "O que a vacina Hepatite B previne?",
        options: const {
          'Caxumba': false,
          'Tuberculose': false,
          'HBV': true,
          'Gripe': false
        },
        nivel: 2,
        fase: 3),
    Question(
        id: '40',
        title: "Quem deve Tomar a vacina de Hepatite B",
        options: const {
          'Adultos': false,
          'Crianças': false,
          'Todos': true,
          'Idosos': false
        },
        nivel: 2,
        fase: 3),
    Question(
        id: '41',
        title: "O que a vacina de Poliomielite  previne?",
        options: const {
          'Caxumba': false,
          'Poliovirus': true,
          'HBC': false,
          'Sarampo': false
        },
        nivel: 2,
        fase: 3),
    Question(
        id: '42',
        title: "Até quando é recomentando tomar doses de Poliomielite?",
        options: const {
          '12 meses': false,
          '13 meses': false,
          '14 meses': false,
          '15 meses': true,
        },
        nivel: 2,
        fase: 3),
    Question(
        id: '43',
        title: "A Tríplice Viral é uma vacina que previne quais Doenças?",
        options: const {
          'Sarampo': false,
          'Todas as alternativas': true,
          'Rubéola': false,
          'Caxumba': false
        },
        nivel: 2,
        fase: 3),
    Question(
        id: '44',
        title: "O virus H1N1 é causadora de qual pandemia?",
        options: const {
          'Gripe Espanhola': false,
          'Gripe Aviária': false,
          'Covid': false,
          'Gripe Suina': true,
        },
        nivel: 2,
        fase: 3),
    Question(
        id: '45',
        title: "Este nível é sobre o que?",
        options: const {
          'A Historia da Vacina': false,
          'Quem são os profissionais que desenvolvem as vacinas': true,
          'Algumas das Vacinas Mais Importantes': false,
          'Medicina': false
        },
        nivel: 3,
        fase: 1),
    Question(
        id: '46',
        title: "Quais Tipos de Profissionais podem desenvolver as Vacinas?",
        options: const {
          'Biomédicos/Imunologistas': true,
          'Médicos': false,
          'Enfermeiros': false,
          'Socorristas': false,
        },
        nivel: 3,
        fase: 1),
    Question(
        id: '47',
        title:
            "Qual Área o biomédico deve se especializar para Produzir Vacinas?",
        options: const {
          'Ortopedia': false,
          'Vacinologia': false,
          'Imunologia': true,
          'Radioterapia': false,
        },
        nivel: 3,
        fase: 1),
    Question(
        id: '48',
        title: "O biomédico imunologista estuda diaramente o que?",
        options: const {
          'Doenças Infeciosas': true,
          'Português': false,
          'Geografia': false,
          'História': false,
        },
        nivel: 3,
        fase: 1),
    Question(
        id: '49',
        title: "Este nível é sobre o que?",
        options: const {
          'A Historia da Vacina': false,
          'Quem são os profissionais que desenvolvem as vacinas': true,
          'Algumas das Vacinas Mais Importantes': false,
          'Medicina': false
        },
        nivel: 3,
        fase: 2),
    Question(
        id: '50',
        title: "Quais Tipos de Profissionais podem desenvolver as Vacinas?",
        options: const {
          'Biomédicos/Imunologistas': true,
          'Médicos': false,
          'Enfermeiros': false,
          'Socorristas': false,
        },
        nivel: 3,
        fase: 2),
    Question(
        id: '51',
        title:
            "Qual Área o biomédico deve se especializar para Produzir Vacinas?",
        options: const {
          'Ortopedia': false,
          'Vacinologia': false,
          'Imunologia': true,
          'Radioterapia': false,
        },
        nivel: 3,
        fase: 2),
    Question(
        id: '52',
        title: "O biomédico imunologista estuda diaramente o que?",
        options: const {
          'Doenças Infeciosas': true,
          'Português': false,
          'Geografia': false,
          'História': false,
        },
        nivel: 3,
        fase: 2),
    Question(
        id: '53',
        title:
            "O biomédico imunologista estuda diaramente quais tipos de tratamento?",
        options: const {
          'Gripe': false,
          'Prevenção de Patologia': true,
          'Matemática': false,
          'Covid': false
        },
        nivel: 3,
        fase: 2),
    Question(
        id: '54',
        title: "O que o Imunologista Estudam?",
        options: const {
          'Resfriados': false,
          'Gripe': false,
          'Educação Física': false,
          'Sistema Imunologico': true,
        },
        nivel: 3,
        fase: 2),
    Question(
        id: '55',
        title:
            "Quais Graduações são necessárias para especializar em imunologia?",
        options: const {
          'Medicina': false,
          'Ciências Biológicas': false,
          'Biomedicina': false,
          'Todas as alternativas': true,
        },
        nivel: 3,
        fase: 2),
    Question(
        id: '56',
        title: "Os imunologistas podem atuar no desenvolvimento das vacinas?",
        options: const {
          'sim': true,
          'não': false,
          'mentira': false,
          'as vezes': false,
        },
        nivel: 3,
        fase: 2),
    Question(
      id: '57',
      title: "Este nível é sobre o que?",
      options: const {
        'A Historia da Vacina': false,
        'Quem são os profissionais que desenvolvem as vacinas': true,
        'Algumas das Vacinas Mais Importantes': false,
        'Medicina': false
      },
      nivel: 3,
      fase: 3,
    ),
    Question(
      id: '58',
      title: "Quais Tipos de Profissionais podem desenvolver as Vacinas?",
      options: const {
        'Biomédicos/Imunologistas': true,
        'Médicos': false,
        'Enfermeiros': false,
        'Socorristas': false,
      },
      nivel: 3,
      fase: 3,
    ),
    Question(
      id: '59',
      title:
          "Qual Área o biomédico deve se especializar para Produzir Vacinas?",
      options: const {
        'Ortopedia': false,
        'Vacinologia': false,
        'Imunologia': true,
        'Radioterapia': false,
      },
      nivel: 3,
      fase: 3,
    ),
    Question(
      id: '60',
      title: "O biomédico imunologista estuda diaramente o que?",
      options: const {
        'Doenças Infeciosas': true,
        'Português': false,
        'Geografia': false,
        'História': false,
      },
      nivel: 3,
      fase: 3,
    ),
    Question(
      id: '61',
      title:
          "O biomédico imunologista estuda diaramente quais tipos de tratamento?",
      options: const {
        'Gripe': false,
        'Prevenção de Patologia': true,
        'Matemática': false,
        'Covid': false
      },
      nivel: 3,
      fase: 3,
    ),
    Question(
      id: '62',
      title: "O que o Imunologista Estudam?",
      options: const {
        'Resfriados': false,
        'Gripe': false,
        'Educação Física': false,
        'Sistema Imunologico': true,
      },
      nivel: 3,
      fase: 3,
    ),
    Question(
      id: '64',
      title:
          "Quais Graduações são necessárias para especializar em imunologia?",
      options: const {
        'Medicina': false,
        'Ciências Biológicas': false,
        'Biomedicina': false,
        'Todas as alternativas': true,
      },
      nivel: 3,
      fase: 3,
    ),
    Question(
      id: '65',
      title: "Os imunologistas podem atuar no desenvolvimento das vacinas?",
      options: const {
        'sim': true,
        'não': false,
        'mentira': false,
        'as vezes': false,
      },
      nivel: 3,
      fase: 3,
    ),
    Question(
      id: '66',
      title: "Quais Profissionais podem desenvolver as vacinas?",
      options: const {
        'Medicos Imunologistas': false,
        'Biomédicos Imunologistas': false,
        'Imunologistas': false,
        'Todas as alternativas': true,
      },
      nivel: 3,
      fase: 3,
    ),
    Question(
      id: '67',
      title: "Quais vacinas esses Profissionais podem desenvolver?",
      options: const {
        'Todas as Alternativas': true,
        'Hepatite B': false,
        'Influenza': false,
        'COVID-19': false,
      },
      nivel: 3,
      fase: 3,
    )
  ];
}
