unit uDm;

interface

uses
  System.SysUtils, System.Classes, System.JSON, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Authenticator.Basic,
  REST.Response.Adapter,System.Net.HTTPClientComponent,Datasnap.DBClient,
  Data.DB,System.IOUtils,System.IniFiles;


type
   TCommand = (fcPut, fcPatch, fcPost, fcGet, fcRemove);

   TRetornoWS = class
    private
    FRetorno: string;
    FCodigo: Integer;
    procedure SetCodigo(const Value: Integer);
    procedure SetRetorno(const Value: string);
    public
      property Codigo :Integer read FCodigo write SetCodigo;
      property Retorno : string read FRetorno write SetRetorno;
  end;

type
  Tdm = class(TDataModule)
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTClient1: TRESTClient;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    HTTPBasicAuthenticator1: THTTPBasicAuthenticator;

  function VerificaInternet: Boolean;


    function SendData2(const ACommand: TCommand;
      Params: TRESTRequestParameterList; ADataOwner: boolean;
      URL: string): TRetornoWS;

    function buscaCEP(cep: string): TStringList;
  

    { Private declarations }
  private
    function SendData(const ACommand: TCommand;
      Params: TRESTRequestParameterList; ADataOwner: boolean;
      URL: string): TRetornoWS;





  public
     nPaginas:integer;
     sCpf:string;
     sCadastrado:string;
     sFrete,sCod,sValor : string;
     rValorMin : Real;
     token:string;


 //   const sCnpj= '24395280';
     // const sValorMin = 200;
//    const sCnpj = '00262676';
    const sCnpj = '43172320';
    const URI = 'https://sridesconto.wposcash.com.br';
  //  const URI = 'http://192.168.0.2:3001';
//  const URI = 'http://127.0.0.1:3001';
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

uses
  System.Net.HttpClient, FMX.Dialogs,Unit1;

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ Tdm }



function TDM.buscaCEP(cep: string): TStringList;
var
  obj, data: TJSONObject;
  RESTClient: TRESTClient;
  RESTRequest: TRESTRequest;
  RESTResponse: TRESTResponse;
  Endereco: TStringList;
begin
  RESTClient := TRESTClient.Create(nil);
  RESTRequest := TRESTRequest.Create(nil);
  RESTResponse := TRESTResponse.Create(nil);
  RESTRequest.Client := RESTClient;
  RESTRequest.Response := RESTResponse;
//  RESTClient1.BaseURL := 'https://ddd.pricez.com.br/cep/' + CEP + '.json';
  RESTClient.BaseURL := 'https://viacep.com.br/ws/'+cep+'/json/';
  RESTRequest.Execute;
  obj := RESTResponse.JSONValue as TJSONObject;
  try
    Endereco := TStringList.Create;
    if Assigned(obj) then
    begin
      //data := obj.Values['payload'] as TJSONObject;
      if obj.Count <> 0 then
      begin
        Endereco.Add(obj.Values['logradouro'].Value);
        Endereco.Add(obj.Values['bairro'].Value);
        Endereco.Add(obj.Values['uf'].Value);
        Endereco.Add(obj.Values['localidade'].Value);

      end;
      Result := Endereco;
    end;
  finally
    FreeAndNil(obj);
  end;

  //exemplo
  {
  "cep": "01001-000",
  "logradouro": "Pra?a da S?",
  "complemento": "lado ?mpar",
  "bairro": "S?",
  "localidade": "S?o Paulo",
  "uf": "SP",
  "ibge": "3550308",
  "gia": "1004",
  "ddd": "11",
  "siafi": "7107"
}

end;

function TDm.SendData(const ACommand: TCommand;
  Params: TRESTRequestParameterList; ADataOwner: boolean;
  URL: string): TRetornoWS;
  var
  Retorno:TRetornoWS;
begin
  Retorno:= TRetornoWS.Create;

  RESTClient1.BaseURL := URL;
  case ACommand of
    fcPut:
      begin
        RESTClient1.ContentType := 'application/json';
        RESTClient1.Accept := 'application/json';
        RESTRequest1.Method  := rmPUT;
        RESTRequest1.Params  := Params;
        RESTRequest1.Timeout := 10000;
        RESTRequest1.Execute;
      end;
    fcPost:
      begin
        RESTClient1.ContentType := 'application/json';
        RESTClient1.Accept := 'application/json';
        RESTRequest1.Method := rmPOST;
        RESTRequest1.Params := Params;
        RESTRequest1.Timeout := 10000;
        RESTRequest1.Execute;
      end;
    fcPatch:
      begin
        RESTClient1.ContentType := 'application/json';
        RESTClient1.Accept := 'application/json';
        RESTRequest1.Method := rmPATCH;
        RESTRequest1.Params := Params;
        RESTRequest1.Timeout := 10000;
        RESTRequest1.Execute;
      end;
    fcGet:
      begin
        RESTClient1.ContentType := 'application/json';
        RESTClient1.Accept := 'application/json';
        RESTRequest1.Method := rmGET;
        RESTRequest1.Params := Params;
        RESTRequest1.Timeout := 10000;
        RESTRequest1.Execute;
      end;
    fcRemove:
      begin
        RESTClient1.ContentType := 'application/json';
        RESTClient1.Accept := 'application/json';
        RESTRequest1.Method := rmDELETE;
        RESTRequest1.Params := Params;
        RESTRequest1.Timeout := 10000;
        RESTRequest1.Execute;
      end;
  end;


  Retorno.Codigo := RESTResponse1.StatusCode;
  Retorno.Retorno:= RESTResponse1.JSONText;

  Result := Retorno;


end;

function TDm.SendData2(const ACommand: TCommand;
  Params: TRESTRequestParameterList; ADataOwner: boolean;
  URL: string): TRetornoWS;
  var
  Retorno:TRetornoWS;
begin
  Retorno:= TRetornoWS.Create;

  RESTClient1.BaseURL := URL;
  case ACommand of
    fcPut:
      begin
        RESTClient1.ContentType := 'application/json';
        RESTClient1.Accept := 'application/json';
        RESTRequest1.Method  := rmPUT;
        RESTRequest1.Params  := Params;
        RESTRequest1.Timeout := 10000;
        RESTRequest1.Execute;
      end;
    fcPost:
      begin
        RESTClient1.ContentType := 'application/json';
        RESTClient1.Accept := 'application/json';
        RESTRequest1.Method := rmPOST;
        RESTRequest1.Params := Params;
        RESTRequest1.Timeout := 10000;
        RESTRequest1.Execute;
      end;
    fcPatch:
      begin
        RESTClient1.ContentType := 'application/json';
        RESTClient1.Accept := 'application/json';
        RESTRequest1.Method := rmPATCH;
        RESTRequest1.Params := Params;
        RESTRequest1.Timeout := 10000;
        RESTRequest1.Execute;
      end;
    fcGet:
      begin
        RESTClient1.ContentType := 'application/json';
        RESTClient1.Accept := 'application/json';
        RESTRequest1.Method := rmGET;
        RESTRequest1.Params := Params;
        RESTRequest1.Timeout := 10000;
        RESTRequest1.Execute;
      end;
    fcRemove:
      begin
        RESTClient1.ContentType := 'application/json';
        RESTClient1.Accept := 'application/json';
        RESTRequest1.Method := rmDELETE;
        RESTRequest1.Params := Params;
        RESTRequest1.Timeout := 10000;
        RESTRequest1.Execute;
      end;
  end;


  Retorno.Codigo := RESTResponse1.StatusCode;
  Retorno.Retorno:= RESTResponse1.JSONText;

  Result := Retorno;


end;



{ TRetornoWS }

procedure TRetornoWS.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TRetornoWS.SetRetorno(const Value: string);
begin
  FRetorno := Value;
end;

function Tdm.VerificaInternet():Boolean;
var http:THTTPClient;
begin
  Result := False;

  try

   http := THTTPClient.Create;
    try
      Result := http.Head('https://google.com').StatusCode < 400
    except
    end;

  finally
    http.DisposeOf;
  end;

end;



end.
