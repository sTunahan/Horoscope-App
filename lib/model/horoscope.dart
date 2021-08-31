class Horoscope {
  final String _horoscopeName;
  final String _horoscopeHistory;
  final String _horoscopeDetail;
  final String _horoscopeSmallImages;
  final String _horoscopeBigImages;

  Horoscope(this._horoscopeName, this._horoscopeHistory, this._horoscopeDetail,
      this._horoscopeSmallImages, this._horoscopeBigImages);

  get horoscopeName => _horoscopeName;
  get horoscopeHistory => _horoscopeHistory;
  get horoscopeDetail => _horoscopeDetail;
  get horoscopeSmallImages => _horoscopeSmallImages;
  get horoscopeBigImages => _horoscopeBigImages;
}
