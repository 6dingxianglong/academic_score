
class commonCreditData{
  String? _name;
  int? _weigth;
  int? _score;

  commonCreditData(name,weigth,score){
    this._name= name;
    this._weigth=int.parse(weigth) ;
    this._score=int.parse(score) ;
  }

  String? getName(){return _name;}
  int? getWeigth(){return _weigth;}
  int? getScore(){return _score;}
}