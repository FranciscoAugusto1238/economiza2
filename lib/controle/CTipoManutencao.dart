import 'package:economiza2/modelo/bd/bd_core.dart';
import 'package:economiza2/modelo/beans/tipoIniciarOcorrencia.dart';

import '../modelo/beans/tipoManutencao.dart';

class CTipoManutencao{

  Future<int> insert(TipoManutencao g) async {
    int id = await BdCore.instance.insert(g.toMap(),BdCore.tableTipoManutencao);
    print('linha inserida id: $id');
    return id;
  }
  Future<int> update(TipoManutencao g) async {
    final linhasAfetadas = await BdCore.instance.update(g.toMap(),BdCore.tableTipoManutencao);
    print('atualizadas $linhasAfetadas linha(s)');
    return linhasAfetadas;
  }
  Future<int> deletar(int id) async {
    final linhaDeletada = await BdCore.instance.delete(id, BdCore.tableTipoManutencao);
    print('Deletada(s) $linhaDeletada linha(s): linha $id');
    return linhaDeletada;
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    final todasLinhas = await BdCore.instance.queryAllRows(BdCore.tableTipoManutencao);
    print('Consulta todas as linhas:');
    todasLinhas.forEach((row) => print(row));
    return todasLinhas;
  }

  Future<List<TipoManutencao>> getAllList() async {
    final todasLinhas = await BdCore.instance.queryAllRows(BdCore.tableTipoManutencao);
    List<TipoManutencao> lg = List.generate(todasLinhas.length, (i) {
      return TipoManutencao(
        todasLinhas[i]['id'],
        todasLinhas[i]['endereco'],
        todasLinhas[i]['numero'],
        todasLinhas[i]['bairro'],
        todasLinhas[i]['descricao'],
      );
    });
    return lg;
  }

  Future<TipoManutencao> get(int id) async {
    String sql = ""
        "SELECT * "
        "FROM tipogasto"
        "WHERE id = $id;";
    final todasLinhas = await BdCore.instance.querySQL(sql);
    List<TipoManutencao> lg = List.generate(todasLinhas.length, (i) {
      return TipoManutencao(
        todasLinhas[i]['id'],
        todasLinhas[i]['endereco'],
        todasLinhas[i]['numero'],
        todasLinhas[i]['bairro'],
        todasLinhas[i]['descriao'],
      );
    });
    late TipoManutencao c;
    try {
      c = lg.elementAt(0);
    }catch(_){}
    return c;
  }

}
