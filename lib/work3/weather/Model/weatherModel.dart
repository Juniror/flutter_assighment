class Weathermodel {
  String aqi;
  String city;
  String temperature;

  Weathermodel({required this.aqi, required this.city, required this.temperature});
  String getAqi(){
    return aqi;
  }
  String getCity(){
    return city;
  }
  String getTemperature(){
    return temperature;
  }
}