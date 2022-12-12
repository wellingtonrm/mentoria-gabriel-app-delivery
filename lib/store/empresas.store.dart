import 'package:mobx/mobx.dart';

part 'empresas.store.g.dart';

class EmpresaStore = _EmpresaStoreBase with _$EmpresaStore;

abstract class _EmpresaStoreBase with Store {
  @observable
  var id = 1;

  @action
  void addId(String id) => id = id;
}
