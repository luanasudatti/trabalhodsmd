import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TelaInicial(),
  ));
}

// 🔹 TELA INICIAL (CURRÍCULO)
class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            // 🔹 Barra superior
            Container(
              height: 80,
              width: double.infinity,
              color: Color(0xFF9B8ACB),
            ),

            SizedBox(height: 20),

            // 🔹 Foto (círculo)
            CircleAvatar(
              radius: 60,
              backgroundColor: Color(0xFF7E74A8),
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),

            SizedBox(height: 10),

            // 🔹 Nome (edita aqui)
            Text(
              "Luanis",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 40),

            // 🔹 Botões
            botao(context, "Experiência", TelaExperiencia()),
            botao(context, "Projetos", TelaProjetos()),
            botao(context, "Escolaridade", TelaEscolaridade()),
          ],
        ),
      ),
    );
  }

  // 🔹 Botão reutilizável
  Widget botao(BuildContext context, String texto, Widget tela) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40), // Diminuiu a largura aumentando o padding horizontal
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => tela),
          );
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFF9B8ACB),
            borderRadius: BorderRadius.circular(10), // Adicionado borda arredondada para ficar mais bonito
          ),
          child: Text(
            texto,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 🔹 EXPERIÊNCIA
// ==========================================

class Experiencia {
  String empresa;
  String cargo;
  String periodo;

  Experiencia(this.empresa, this.cargo, this.periodo);
}

class TelaExperiencia extends StatefulWidget {
  @override
  State<TelaExperiencia> createState() => _TelaExperienciaState();
}

class _TelaExperienciaState extends State<TelaExperiencia> {
  // Pré-carregando dois exemplos
  List<Experiencia> lista = [
    Experiencia("Empresa Tech S.A.", "Desenvolvedor Júnior", "Jan 2022 - Dez 2022"),
    Experiencia("Startup Inovadora", "Estagiário de TI", "Fev 2021 - Nov 2021"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Experiência"),
        backgroundColor: Color(0xFF9B8ACB),
      ),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(lista[index].empresa, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                "Cargo: ${lista[index].cargo}\nPeríodo: ${lista[index].periodo}",
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    lista.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF9B8ACB),
        child: Icon(Icons.add),
        onPressed: () async {
          final nova = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TelaAddExperiencia()),
          );

          if (nova != null) {
            setState(() {
              lista.add(nova);
            });
          }
        },
      ),
    );
  }
}

class TelaAddExperiencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController empresa = TextEditingController();
    TextEditingController cargo = TextEditingController();
    TextEditingController periodo = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Nova Experiência"),
        backgroundColor: Color(0xFF9B8ACB),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: empresa,
              decoration: InputDecoration(labelText: "Empresa"),
            ),
            TextField(
              controller: cargo,
              decoration: InputDecoration(labelText: "Cargo"),
            ),
            TextField(
              controller: periodo,
              decoration: InputDecoration(labelText: "Período"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF9B8ACB)),
              child: Text("Salvar"),
              onPressed: () {
                if (empresa.text.isNotEmpty && cargo.text.isNotEmpty && periodo.text.isNotEmpty) {
                  Navigator.pop(
                    context,
                    Experiencia(empresa.text, cargo.text, periodo.text),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 🔹 PROJETOS
// ==========================================

class Projeto {
  String nome;
  String descricao;
  String tecnologias;

  Projeto(this.nome, this.descricao, this.tecnologias);
}

class TelaProjetos extends StatefulWidget {
  @override
  State<TelaProjetos> createState() => _TelaProjetosState();
}

class _TelaProjetosState extends State<TelaProjetos> {
  // Pré-carregando dois exemplos
  List<Projeto> lista = [
    Projeto("App de Tarefas", "Aplicativo para gerenciar tarefas diárias.", "Flutter, Firebase"),
    Projeto("Site Portfólio", "Meu site pessoal com meus projetos.", "HTML, CSS, JS"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Projetos"),
        backgroundColor: Color(0xFF9B8ACB),
      ),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(lista[index].nome, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                "Descrição: ${lista[index].descricao}\nTecnologias: ${lista[index].tecnologias}",
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    lista.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF9B8ACB),
        child: Icon(Icons.add),
        onPressed: () async {
          final novo = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TelaAddProjeto()),
          );

          if (novo != null) {
            setState(() {
              lista.add(novo);
            });
          }
        },
      ),
    );
  }
}

class TelaAddProjeto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController nome = TextEditingController();
    TextEditingController descricao = TextEditingController();
    TextEditingController tecnologias = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Projeto"),
        backgroundColor: Color(0xFF9B8ACB),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nome,
              decoration: InputDecoration(labelText: "Nome do Projeto"),
            ),
            TextField(
              controller: descricao,
              decoration: InputDecoration(labelText: "Descrição"),
            ),
            TextField(
              controller: tecnologias,
              decoration: InputDecoration(labelText: "Tecnologias Usadas"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF9B8ACB)),
              child: Text("Salvar"),
              onPressed: () {
                if (nome.text.isNotEmpty && descricao.text.isNotEmpty && tecnologias.text.isNotEmpty) {
                  Navigator.pop(
                    context,
                    Projeto(nome.text, descricao.text, tecnologias.text),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 🔹 ESCOLARIDADE
// ==========================================

class Escolaridade {
  String instituicao;
  String curso;
  String periodo;

  Escolaridade(this.instituicao, this.curso, this.periodo);
}

class TelaEscolaridade extends StatefulWidget {
  @override
  State<TelaEscolaridade> createState() => _TelaEscolaridadeState();
}

class _TelaEscolaridadeState extends State<TelaEscolaridade> {
  // Pré-carregando dois exemplos
  List<Escolaridade> lista = [
    Escolaridade("Universidade Federal", "Ciência da Computação", "2019 - 2023"),
    Escolaridade("Escola Técnica", "Técnico em Informática", "2016 - 2018"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Escolaridade"),
        backgroundColor: Color(0xFF9B8ACB),
      ),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(lista[index].instituicao, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                "Curso: ${lista[index].curso}\nPeríodo: ${lista[index].periodo}",
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    lista.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF9B8ACB),
        child: Icon(Icons.add),
        onPressed: () async {
          final nova = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TelaAddEscolaridade()),
          );

          if (nova != null) {
            setState(() {
              lista.add(nova);
            });
          }
        },
      ),
    );
  }
}

class TelaAddEscolaridade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController instituicao = TextEditingController();
    TextEditingController curso = TextEditingController();
    TextEditingController periodo = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Nova Escolaridade"),
        backgroundColor: Color(0xFF9B8ACB),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: instituicao,
              decoration: InputDecoration(labelText: "Instituição"),
            ),
            TextField(
              controller: curso,
              decoration: InputDecoration(labelText: "Curso"),
            ),
            TextField(
              controller: periodo,
              decoration: InputDecoration(labelText: "Período"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF9B8ACB)),
              child: Text("Salvar"),
              onPressed: () {
                if (instituicao.text.isNotEmpty && curso.text.isNotEmpty && periodo.text.isNotEmpty) {
                  Navigator.pop(
                    context,
                    Escolaridade(instituicao.text, curso.text, periodo.text),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
