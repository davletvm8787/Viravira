import 'package:assarickym/data/repository/location_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../app/base/base_model.dart';
import '../../../app/base/base_view_model.dart';
import '../../../data/models/location_model.dart';

@Injectable()
class LocationViewModel extends BaseViewModel {
  final LocationRepository _locationRepository;
  LocationViewModel(this._locationRepository);

  StateModel<List<Location>> locationList =
      StateModel<List<Location>>.loading();

  void setLoadingState() {
    locationList = StateModel.loading();
    notifyListeners();
  }

  void getLocationList() {
    _locationRepository.getLocations().then((value) {
      locationList = value.toStateModel();
      notifyListeners();
    });
  }

  int selectedIndex = 0;
  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
