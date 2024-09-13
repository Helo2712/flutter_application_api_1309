class Dados {
  String _cep = "";
 
  String _bairro = "";
  String _estado ="";
  String _regiao = "";
  String _logadouro = "";

   get cep => this._cep;

 set cep( value) => this._cep = value;

  get bairro => this._bairro;

 set bairro( value) => this._bairro = value;

  get estado => this._estado;

 set estado( value) => this._estado = value;

  get regiao => this._regiao;

 set regiao( value) => this._regiao = value;

  get logadouro => this._logadouro;

 set logadouro( value) => this._logadouro = value;

  Dados();

  Dados.fromjson(Map<String, dynamic> json):
  _cep = json['cep'],
  _bairro = json['bairro'],
  _estado = json['estado'],
  _regiao = json['regiao'],
 _logadouro = json['logradouro'];

}