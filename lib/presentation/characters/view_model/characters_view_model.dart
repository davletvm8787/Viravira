import 'package:assarickym/data/models/character_model.dart';
import 'package:assarickym/data/repository/character_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../app/base/base_model.dart';
import '../../../app/base/base_view_model.dart';

@Injectable()
class CharactersViewModel extends BaseViewModel {
  final CharacterRepository _characterRepository;
  CharactersViewModel(this._characterRepository);

  StateModel<List<Character>> characterList =
      StateModel<List<Character>>.loading();

  void setLoadingState() {
    characterList = StateModel.loading();
    notifyListeners();
  }

  void getCharacterList() {
    _characterRepository.getCharacters().then((value) {
      characterList = value.toStateModel();
      notifyListeners();
    });
  }

  int selectedIndex = 0;
  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
