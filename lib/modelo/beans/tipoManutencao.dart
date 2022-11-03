class TipoManutencao{
  //necessário este interrogação para inserir valor nulo
  late int ?id;
  late String endereco;
  late String numero;
  late String bairro;
  late String descricao;


  // criando um construtor
  TipoManutencao( this.id, this.endereco, this.numero, this.bairro,this.descricao);

  TipoManutencao.map(dynamic obj) {
    this.id = obj['id'];
    this.endereco = obj['endereco'];
    this.numero = obj['numero'];
    this.bairro = obj['bairro'];
    this.descricao = obj['descricao'];


  }

  Map<String, dynamic> toMap() {
    var mapa = new Map<String, dynamic>();
    mapa["id"] = id;
    mapa["endereco"] = endereco;
    mapa["numero"] = numero;
    mapa["bairro"] = bairro;
    mapa["descricao"] = descricao;

    if (id != null){
      mapa["id"] = id;
    }
    return mapa;
  }

  TipoManutencao.fromMap(Map<String, dynamic> mapa) {
    this.id = mapa['id'];
    this.endereco = mapa['endereco'];
    this.numero = mapa['numero'];
    this.bairro = mapa['bairro'];
    this.descricao = mapa['descricao'];
  }
}