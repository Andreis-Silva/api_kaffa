class Post {
  int _id;
  String _currentDateTime;
  String _utcOffset;
  bool _isDayLightSavingsTime;
  String _dayOfTheWeek;
  String _timeZoneName;
  int _currentFileTime;
  String _ordinalDate;
  String _serviceResponse;

  Map toJson(){

    return  {
      "id": this._id,
      "currentDateTime": this._currentDateTime,
      "utcOffset": this._utcOffset,
      "isDayLightSavingsTime": this._isDayLightSavingsTime,
      "dayOfTheWeek": this._dayOfTheWeek,
      "timeZoneName": this._timeZoneName,
      "currentFileTime": this._currentFileTime,
      "ordinalDate": this._ordinalDate,
      "serviceResponse": this._serviceResponse
    };
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get utcOffset => _utcOffset;

  set utcOffset(String value) {
    _utcOffset = value;
  }

  String get currentDateTime => _currentDateTime;

  set currentDateTime(String value) {
    _currentDateTime = value;
  }

  bool get isDayLightSavingsTime => _isDayLightSavingsTime;

  set isDayLightSavingsTime(bool value) {
    _isDayLightSavingsTime = value;
  }

  String get dayOfTheWeek => _dayOfTheWeek;

  set dayOfTheWeek(String value) {
    _dayOfTheWeek = value;
  }

  String get timeZoneName => _timeZoneName;

  set timeZoneName(String value) {
    _timeZoneName = value;
  }

  int get currentFileTime => _currentFileTime;

  set currentFileTime(int value) {
    _currentFileTime = value;
  }

  String get ordinalDate => _ordinalDate;

  set ordinalDate(String value) {
    _ordinalDate = value;
  }

  String get serviceResponse => _serviceResponse;

  set serviceResponse(String value) {
    _serviceResponse = value;
  }
}