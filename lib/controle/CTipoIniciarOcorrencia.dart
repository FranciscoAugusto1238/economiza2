import 'package:economiza2/modelo/bd/bd_core.dart';
import 'package:economiza2/modelo/beans/tipoIniciarOcorrencia.dart';

class CTipoIniciarOcorrencia{

  Future<int> insert(TipoIniciarOcorrencia g) async {
    int id = await BdCore.instance.insert(g.toMap(),BdCore.tableTipoIniciarOcorrencia);
    print('linha inserida id: $id');
    return id;
  }
  Future<int> update(TipoIniciarOcorrencia g) async {
    final linhasAfetadas = await BdCore.instance.update(g.toMap(),BdCore.tableTipoIniciarOcorrencia);
    print('atualizadas $linhasAfetadas linha(s)');
    return linhasAfetadas;
  }
  Future<int> deletar(int id) async {
    final linhaDeletada = await BdCore.instance.delete(id, BdCore.tableTipoIniciarOcorrencia);
    print('Deletada(s) $linhaDeletada linha(s): linha $id');
    return linhaDeletada;
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    final todasLinhas = await BdCore.instance.queryAllRows(BdCore.tableTipoIniciarOcorrencia);
    print('Consulta todas as linhas:');
    todasLinhas.forEach((row) => print(row));
    return todasLinhas;
  }

  Future<List<TipoIniciarOcorrencia>> getAllList() async {
    final todasLinhas = await BdCore.instance.queryAllRows(BdCore.tableTipoIniciarOcorrencia);
    List<TipoIniciarOcorrencia> lg = List.generate(todasLinhas.length, (i) {
      return TipoIniciarOcorrencia(
          todasLinhas[i]['id'],
          todasLinhas[i]['endereco'],
          todasLinhas[i]['numero'],
          todasLinhas[i]['bairro'],
          todasLinhas[i]['descricao'],
      );
    });
    return lg;
  }

  Future<TipoIniciarOcorrencia> get(int id) async {
    String sql = ""
        "SELECT * "
        "FROM tipogasto"
        "WHERE id = $id;";
    final todasLinhas = await BdCore.instance.querySQL(sql);
    List<TipoIniciarOcorrencia> lg = List.generate(todasLinhas.length, (i) {
      return TipoIniciarOcorrencia(
        todasLinhas[i]['id'],
        todasLinhas[i]['endereco'],
        todasLinhas[i]['numero'],
        todasLinhas[i]['bairro'],
        todasLinhas[i]['descricao'],
      );
    });
    late TipoIniciarOcorrencia c;
    try {
      c = lg.elementAt(0);
    }catch(_){}
    return c;
  }

}
