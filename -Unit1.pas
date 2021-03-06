unit Unit1;

interface

{$DEFINE __TTASK__}

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.TabControl, FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation,
  System.Actions, FMX.ActnList, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.Effects, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteDef, FireDAC.UI.Intf, FireDAC.FMXUI.Wait,System.NetEncoding,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,Loading,
  FireDAC.Comp.UI, Datasnap.DBClient, IdBaseComponent, uFancyDialog, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, FMX.ScrollBox,System.IniFiles,
  FMX.Memo,System.IOUtils,System.JSON,FMX.DialogService,uFormat,


  System.Character,
  System.Generics.Collections,
  System.UIConsts,
  FMX.EditBox, FMX.NumberBox,
  System.Threading,
  FMX.Surfaces, u99Permissions, ufrmCamera, FMX.Memo.Types,
  IdAuthentication, FireDAC.Phys.SQLiteWrapper.Stat, FMX.WebBrowser, REST.Types,
  REST.Client, REST.Authenticator.Basic, REST.Response.Adapter,
  Data.Bind.Components, Data.Bind.ObjectScope;




  const

  NORMAL = false;
  BOLD = true;

  GER7_VENDA = '1';
  GER7_CANCELAMENTO = '2';
  GER7_FUNCOES = '3';

  GER7_DESABILITA_IMPRESSAO = '0';
  GER7_HABILITA_IMPRESSAO = '1';

  GER7_CREDITO = '1';
  GER7_DEBITO = '2';
  GER7_VOUCHER = '4';

  GER7_SEMPARCELAMENTO = '0';
  GER7_PARCELADO_LOJA = '1';
  GER7_PARCELADO_ADM = '2';

type
  TForm1 = class(TForm)
    TabControl1: TTabControl;
    tbLogin: TTabItem;
    tbMenu: TTabItem;
    tbVenda: TTabItem;
    tbProdutos: TTabItem;
    tbConfig: TTabItem;
    tbVendaAbertas: TTabItem;
    Layout1: TLayout;
    S: TImage;
    Layout3: TLayout;
    Image9: TImage;
    RoundRect1: TRoundRect;
    Label18: TLabel;
    RoundRect2: TRoundRect;
    edtLogin: TEdit;
    Image10: TImage;
    RoundRect3: TRoundRect;
    edtSenha: TEdit;
    Image11: TImage;
    Image21: TImage;
    Layout2: TLayout;
    Image1: TImage;
    Layout4: TLayout;
    Image2: TImage;
    Image4: TImage;
    Layout14: TLayout;
    SpeedButton1: TSpeedButton;
    ActionList1: TActionList;
    abreMenu: TChangeTabAction;
    Layout5: TLayout;
    q: TVertScrollBox;
    Layout6: TLayout;
    Label1: TLabel;
    edtLoja: TEdit;
    Layout7: TLayout;
    Layout8: TLayout;
    Label3: TLabel;
    edtServidor: TEdit;
    Layout9: TLayout;
    Label4: TLabel;
    chbImpressora: TSwitch;
    abreConfig: TChangeTabAction;
    ToolBar1: TToolBar;
    Label2: TLabel;
    StyleBook1: TStyleBook;
    Layout10: TLayout;
    ToolBar3: TToolBar;
    Label5: TLabel;
    SpeedButton4: TSpeedButton;
    Edit2: TEdit;
    btnPesquisaProduto: TSpeedButton;
    lvProdutos: TListView;
    Image15: TImage;
    ToolBar2: TToolBar;
    Label6: TLabel;
    Layout11: TLayout;
    Rectangle1: TRectangle;
    ShadowEffect1: TShadowEffect;
    Layout12: TLayout;
    Label7: TLabel;
    Rectangle2: TRectangle;
    ShadowEffect2: TShadowEffect;
    Image5: TImage;
    abreVenda: TChangeTabAction;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDConnection1: TFDConnection;
    fdqCarga: TFDQuery;
    Image6: TImage;
    abreProduto: TChangeTabAction;
    voltaVenda: TChangeTabAction;
    voltaMenu: TChangeTabAction;
    cdsPedido: TClientDataSet;
    cdsPedidoEMPRESA: TIntegerField;
    cdsPedidoCOD_ORCAMENTO: TIntegerField;
    cdsPedidoDATA: TDateTimeField;
    cdsPedidoDOCUMENTO: TStringField;
    cdsPedidoCAIXA: TStringField;
    cdsPedidoCOD_COLABORADOR: TIntegerField;
    cdsPedidoTIPO_MOVIMENTO: TIntegerField;
    cdsPedidoRESPONSAVEL: TIntegerField;
    cdsPedidoCFOP: TStringField;
    cdsPedidoCANCELADO: TStringField;
    cdsPedidoVALOR: TFloatField;
    cdsPedidoFORMA_PAGAMENTO: TIntegerField;
    cdsPedidoFATURADO: TStringField;
    cdsPedidoDESCONTO: TFloatField;
    cdsPedidoTOTAL: TFloatField;
    cdsItensVenda: TClientDataSet;
    cdsItensVendaEMPRESA: TIntegerField;
    cdsItensVendaDATA: TDateTimeField;
    cdsItensVendaDOCUMENTO: TStringField;
    cdsItensVendaCOD_PRODUTO: TStringField;
    cdsItensVendaDESCRICAO: TStringField;
    cdsItensVendaVENDA: TFloatField;
    cdsItensVendaQTD: TFloatField;
    cdsItensVendaDESCONTO: TFloatField;
    cdsItensVendaITEM: TStringField;
    cdsItensVendaTOTAL: TFloatField;
    cdsItensVendaUNIDADE: TStringField;
    cdsItensVendaCOD_COLABORADOR: TIntegerField;
    cdsItensVendaHORA: TDateTimeField;
    cdsItensVendaPEDIDO: TIntegerField;
    cdsItensVendaOBS: TStringField;
    cdsColaborador: TClientDataSet;
    cdsColaboradorCOD_COLABORADOR: TIntegerField;
    cdsColaboradorNOME: TStringField;
    cdsColaboradorFUNCAO: TIntegerField;
    cdsColaboradorCOMISSAO: TFloatField;
    cdsColaboradorACESSO: TStringField;
    cdsColaboradorLOGIN: TStringField;
    cdsColaboradorSENHA: TStringField;
    cdsProdutos: TClientDataSet;
    cdsProdutosCOD_PRODUTO: TStringField;
    cdsProdutosDESCRICAO: TStringField;
    cdsProdutosUNIDADE: TStringField;
    cdsProdutosCOD_NCM: TStringField;
    cdsProdutosCEST: TStringField;
    cdsProdutosST: TStringField;
    cdsProdutosICMS_IN: TFMTBCDField;
    cdsProdutosCFOP_IN: TStringField;
    cdsProdutosCSTPC: TIntegerField;
    cdsProdutosALI_PIS_DEBITO: TFMTBCDField;
    cdsProdutosALI_COFINS_DEBITO: TFMTBCDField;
    cdsProdutosCOMPRA: TFMTBCDField;
    cdsProdutosVENDA: TFMTBCDField;
    cdsProdutosESTOQUE: TFMTBCDField;
    cdsProdutosCOD_GRUPO: TIntegerField;
    cdsProdutosCOD_SUBGRUPO: TIntegerField;
    cdsProdutosLOCALIZACAO: TStringField;
    cdsGrupos: TClientDataSet;
    cdsGruposEMPRESA: TIntegerField;
    cdsGruposCOD_GRUPO: TIntegerField;
    cdsGruposDESCRICAO: TStringField;
    IdHTTP1: TIdHTTP;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    rctOpcaidade: TRectangle;
    RctModal: TRectangle;
    ShadowEffect3: TShadowEffect;
    Label8: TLabel;
    edtQtd: TEdit;
    Image8: TImage;
    rctModalCpf: TRectangle;
    ShadowEffect4: TShadowEffect;
    Label9: TLabel;
    lbCliente: TLabel;
    Label10: TLabel;
    edtDesconto: TEdit;
    lvProdutosPedidos: TListView;
    imgExcluir: TImage;
    lbNvenda: TLabel;
    lbTotal: TLabel;
    Image13: TImage;
    chbVendedor: TSwitch;
    Label11: TLabel;
    lbusuario: TLabel;
    Image7: TImage;
    Layout13: TLayout;
    ToolBar4: TToolBar;
    Label12: TLabel;
    SpeedButton2: TSpeedButton;
    Edit1: TEdit;
    SpeedButton3: TSpeedButton;
    lvPedidos: TListView;
    Image16: TImage;
    abreVendas: TChangeTabAction;
    Memo1: TMemo;
    cdsVendas: TClientDataSet;
    imgItens: TImage;
    Image17: TImage;
    ToolBar5: TToolBar;
    Label13: TLabel;
    SpeedButton5: TSpeedButton;
    Layout15: TLayout;
    lvFinalizadora: TListView;
    Rectangle3: TRectangle;
    Label14: TLabel;
    imgReal: TImage;
    imgCartao: TImage;
    AbrePagamento: TChangeTabAction;
    rctRecebimento: TRectangle;
    edtValor: TEdit;
    Label25: TLabel;
    Image22: TImage;
    ShadowEffect5: TShadowEffect;
    Layout19: TLayout;
    layout_valor: TLayout;
    Layout20: TLayout;
    lbl_tecla7: TLabel;
    Layout21: TLayout;
    lbl_tecla8: TLabel;
    Layout22: TLayout;
    lbl_tecla9: TLabel;
    lbl_tecla4: TLayout;
    Label30: TLabel;
    Layout23: TLayout;
    lbl_tecla5: TLabel;
    Layout24: TLayout;
    lbl_tecla6: TLabel;
    Layout25: TLayout;
    lbl_tecla1: TLabel;
    Layout26: TLayout;
    lbl_tecla2: TLabel;
    Layout27: TLayout;
    lbl_tecla3: TLabel;
    Layout28: TLayout;
    lbl_tecla00: TLabel;
    Image26: TImage;
    Layout29: TLayout;
    lbl_tecla0: TLabel;
    Layout30: TLayout;
    img_backspace: TImage;
    lb_valor: TLabel;
    Layout16: TLayout;
    Image18: TImage;
    Layout17: TLayout;
    Image19: TImage;
    Label15: TLabel;
    Image23: TImage;
    Image24: TImage;
    rctAnimacao: TRectangle;
    AniIndicator1: TAniIndicator;
    Label16: TLabel;
    rctEmail: TRectangle;
    Image25: TImage;
    Image27: TImage;
    ShadowEffect6: TShadowEffect;
    Edit3: TEdit;
    cdsVendasCOD_ORCAMENTO: TIntegerField;
    cdsVendasDATA: TDateField;
    cdsVendasDOCUMENTO: TStringField;
    cdsVendasCAIXA: TStringField;
    cdsVendasCOD_COLABORADOR: TIntegerField;
    cdsVendasRESPONSAVEL: TIntegerField;
    cdsVendasTIPO_MOVIMENTO: TIntegerField;
    cdsVendasCANCELADO: TStringField;
    cdsVendasVALOR: TFloatField;
    cdsVendasICMS: TFloatField;
    cdsVendasCREDITO: TFloatField;
    cdsVendasFEDERAL: TFloatField;
    cdsVendasFORMA_PAGAMENTO: TIntegerField;
    cdsVendasFATURADO: TStringField;
    cdsVendasDESCONTO: TFloatField;
    cdsVendasTOTAL: TFloatField;
    cdsVendasSELO: TStringField;
    cdsVendasTRANSPORTADORA: TIntegerField;
    cdsVendasBRUTO: TFloatField;
    cdsVendasLIQUIDO: TFloatField;
    cdsVendasCOMISSAO: TFloatField;
    cdsVendasFRETE: TStringField;
    cdsVendasPLACA: TStringField;
    cdsVendasQUANTIDADE: TFloatField;
    cdsVendasESPECIE: TStringField;
    cdsVendasCAIXA_TESOURARIA: TIntegerField;
    cdsVendasCOD_VENDEDOR: TIntegerField;
    cdsVendasENTREGA: TStringField;
    cdsVendasCOD_CADASTRO: TIntegerField;
    cdsVendasRAZAO: TStringField;
    cdsVendasCNPJ: TStringField;
    cdsVendasTIPO: TStringField;
    cdsVendasAREA: TStringField;
    cdsVendasLIMITE: TFMTBCDField;
    cdsVendasPRAZO: TIntegerField;
    cdsVendasATUAL_VENC: TDateField;
    cdsVendasTIPO_FATURA: TStringField;
    cdsVendasULTIMO_VENC: TDateField;
    Image28: TImage;
    imgEditar: TImage;
    btnFechar: TRectangle;
    btnDesistir: TRectangle;
    Label17: TLabel;
    Label19: TLabel;
    rctSalvar: TRectangle;
    Label20: TLabel;
    rctCancelar: TRectangle;
    Label21: TLabel;
    Image3: TImage;
    rctAbertura: TRectangle;
    Layout18: TLayout;
    Image29: TImage;
    Image30: TImage;
    Timer1: TTimer;
    LayoutQtd: TLayout;
    Rectangle12: TRectangle;
    Rectangle13: TRectangle;
    lbDescricao: TLabel;
    Image31: TImage;
    lbQtd: TLabel;
    imgMais: TImage;
    imgMenos: TImage;
    Rectangle14: TRectangle;
    Label26: TLabel;
    Rectangle15: TRectangle;
    Rectangle16: TRectangle;
    ListView2: TListView;
    Image32: TImage;
    Label22: TLabel;
    imgRedonda: TImage;
    LayoutQtdFracionado: TLayout;
    Rectangle17: TRectangle;
    Rectangle18: TRectangle;
    Label28: TLabel;
    Image33: TImage;
    lbl_valor: TLabel;
    Image34: TImage;
    Image35: TImage;
    Layout31: TLayout;
    Layout32: TLayout;
    Label23: TLabel;
    Layout33: TLayout;
    Label24: TLabel;
    Layout34: TLayout;
    Label27: TLabel;
    Layout35: TLayout;
    Label31: TLabel;
    Layout36: TLayout;
    Label29: TLabel;
    Layout37: TLayout;
    Label32: TLabel;
    Layout38: TLayout;
    Label33: TLabel;
    Layout39: TLayout;
    Label34: TLabel;
    Layout40: TLayout;
    Label35: TLabel;
    Layout41: TLayout;
    Label36: TLabel;
    Layout42: TLayout;
    Label37: TLabel;
    Layout43: TLayout;
    Image36: TImage;
    Rectangle19: TRectangle;
    Label38: TLabel;
    Layout44: TLayout;
    Rectangle24: TRectangle;
    Label39: TLabel;
    Rectangle20: TRectangle;
    Rectangle21: TRectangle;
    ListView3: TListView;
    Layout45: TLayout;
    Rectangle22: TRectangle;
    Rectangle23: TRectangle;
    Label40: TLabel;
    Image37: TImage;
    edtObs2: TEdit;
    Layout46: TLayout;
    Rectangle4: TRectangle;
    edtquantidade: TEdit;
    Layout47: TLayout;
    Label41: TLabel;
    Layout48: TLayout;
    Label42: TLabel;
    Label43: TLabel;
    Layout49: TLayout;
    Rectangle5: TRectangle;
    Edit4: TEdit;
    Label44: TLabel;
    Rectangle6: TRectangle;
    SpeedButton6: TSpeedButton;
    Label45: TLabel;
    Rectangle7: TRectangle;
    WebBrowser1: TWebBrowser;
    Layout50: TLayout;
    ToolBar6: TToolBar;
    Image20: TImage;
    cdsClientes: TClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField3: TIntegerField;
    Label46: TLabel;
    SpeedButton7: TSpeedButton;
    Label47: TLabel;
    ToolBar7: TToolBar;
    Label48: TLabel;
    Image38: TImage;
    tbCadCliente: TTabItem;
    edtNome: TEdit;
    edtCEP: TEdit;
    edtEndereco: TEdit;
    edtNumero: TEdit;
    edtBairro: TEdit;
    edtCidade: TEdit;
    edtTelefone: TEdit;
    Label50: TLabel;
    Label51: TLabel;
    Rectangle9: TRectangle;
    Label52: TLabel;
    ToolBar8: TToolBar;
    Label49: TLabel;
    Image39: TImage;
    edtCpfCliente: TEdit;
    Rectangle52: TRectangle;
    Label53: TLabel;
    cdsCliente: TClientDataSet;
    StringField3: TStringField;
    IntegerField1: TIntegerField;
    Layout52: TLayout;
    Label55: TLabel;
    Rectangle8: TRectangle;
    edtcpf: TEdit;
    HTTPBasicAuthenticator1: THTTPBasicAuthenticator;
    procedure Label18Click(Sender: TObject);
    procedure RoundRect1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure conexao();
    procedure Image6Click(Sender: TObject);
    procedure atualizaProdutos();
    procedure RetornaVenda(venda:integer);
    procedure CargaProduto(busca: string; ind_clear: boolean; delay : integer);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Edit2ChangeTracking(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure lvProdutosItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Image12Click(Sender: TObject);
    procedure LancaVenda();
    function LancaItem(loja, resp: Integer; codProduto: String; desconto,
  qtd: Real; Total: String): Real;
    procedure listaItensMesa();
    procedure formatarMoeda(componente: TObject; var key: char);
    procedure edtDescontoKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure Image13Click(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure lvProdutosPedidosItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    function cancelaItem(loja:Integer;item:Integer;npedido:integer):Real;
    procedure atualizaColaborador();
    procedure Image7Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure listaVendas();
    procedure SpeedButton3Click(Sender: TObject);
    function inserirVenda():Integer;
    procedure RetornaItens(ID:Integer);
    procedure inserirItem(codproduto:String;rQtd,rDesconto:Real);
    function pegarItem(codVenda:integer):integer;
    procedure atualizaTotal(icodVenda:Integer);
    procedure listaDeVendas();
    procedure carregaFinalizadora();
    procedure SpeedButton5Click(Sender: TObject);
    procedure lvFinalizadoraItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure Tecla_Numero(lbl : TObject);
    procedure lbl_tecla0Click(Sender: TObject);
    procedure Image26Click(Sender: TObject);
    procedure Image18Click(Sender: TObject);
    procedure img_backspaceClick(Sender: TObject);
    procedure enviaVenda();
    procedure gerarNota();
    procedure Image19Click(Sender: TObject);
    procedure Image24Click(Sender: TObject);
    procedure Image17Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure buscaVendas();

    {$IFNDEF __TTASK__}
    procedure timerTEFTimer(Sender: TObject);
    {$ENDIF}
    procedure RandomValor;
    procedure lvPedidosItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure btnFecharClick(Sender: TObject);
    procedure btnDesistirClick(Sender: TObject);
    procedure rctSalvarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure rctCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Rectangle14Click(Sender: TObject);
    procedure Image31Click(Sender: TObject);
    procedure imgMaisClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Image32Click(Sender: TObject);
    procedure FDConnection1AfterConnect(Sender: TObject);
    procedure lvProdutosUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure lvProdutosPedidosUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Rectangle19Click(Sender: TObject);
    procedure Image33Click(Sender: TObject);
    procedure Edit4Typing(Sender: TObject);
    procedure edtquantidadeTyping(Sender: TObject);
    procedure Rectangle6Click(Sender: TObject);
    procedure EnviaRecebimento();
    procedure listarItens(busca: string; ind_clear: boolean; delay : integer);
    procedure Rectangle7Click(Sender: TObject);
    procedure Image20Click(Sender: TObject);
    procedure Rectangle52Click(Sender: TObject);
    procedure Rectangle9Click(Sender: TObject);
    procedure edtCEPExit(Sender: TObject);

  private
    permissao:T99permissions;
    { Private declarations }
    {$IFDEF __TTASK__}
    bTask:ITask;
    procedure lancaItemDireto(cod: String);
    procedure addListaProduto(codigo,descricao:String;preco:Real);
    function SetAsBase64(const ASource: string): TBitmap;
    function LerPerfil: string;
    procedure Tecla_Backspace;
    procedure ClickCancel(Sender: TObject);
    procedure ClickOK(Sender: TObject);
    procedure ClickYes(Sender: TObject);
    procedure ClickNo(Sender: TObject);
    procedure ClickSim(Sender: TObject);
    procedure ClickNao(Sender: TObject);

    procedure atualizaCliente(cod : string);
    procedure ClickSimCliente(Sender: TObject);
    procedure Sim(Sender: TObject);
    procedure Nao(Sender: TObject);

    {$ELSE}
    timerTEF:TTimer;
    {$ENDIF}
  public
    { Public declarations }
    iCod_Cadastro,iLoja:Integer;
    sEndereco:String;
    iCod,icodVenda:Integer;
    codproduto:string;
    sVenda : string;
    codusuario:integer;
    rTotal,rDesconto:Real;
    tipoPagamento:string;
    sEmail:string;
    cdsProdtemp:TClientDataSet;
    cdsClientestemp:TClientDataSet;
    desc:string;
    valor:Real;
    diag:TFancyDialog;
  end;

var
  Form1: TForm1;

implementation




{$R *.fmx}

uses uDm;






procedure TForm1.atualizaColaborador;
const sListaProduto = '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:uSRIIntf-ISRI">'
   +'<soapenv:Header/>'
   +'<soapenv:Body>'
   +'<urn:expCadColaborador soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">'
   +'<loja xsi:type="xsd:int">?l?</loja>'
   +'</urn:expCadColaborador>'
   +'</soapenv:Body>'
   +'</soapenv:Envelope>';
var sErro, sNumPedido,sRetorno, sCupom, sLinha, sCab : string;
    iTermino, iPosInicial, iPosFinal, i, iTamanho, iItem :integer;
    LItem : TListViewItem;
    Retorno , Solicit: TStringStream;
    sListaPedido: string;
begin

  try

  Retorno := TStringStream.Create(EmptyStr);
  sListaPedido:= sListaProduto;
  sListaPedido:= StringReplace(sListaPedido,'?l?',IntToStr(iLoja),[rfReplaceAll]);
  Solicit := TStringStream.Create(sListaPedido, TEncoding.UTF8);

  IdHTTP1.Request.ContentType := 'text/xml';
  IdHTTP1.Request.Charset := 'utf-8';
  IdHTTP1.Request.CustomHeaders.Values['SOAPAction'] := 'urn:uSRIIntf-ISRI#expCadColaborador';
  IdHTTP1.ProtocolVersion := pv1_1;
  IdHTTP1.HTTPOptions := IdHTTP1.HTTPOptions + [hoKeepOrigProtocol];
    try

      //IdHTTP1.Post('http://sriservicos.com.br/integrasri/IntegraSRI.dll/soap/ICliente',Solicit, Retorno);
      IdHTTP1.Post('http://'+sEndereco+'/soap/ISRI',Solicit, Retorno);

    except
      exit;
    end;

    sRetorno:= Retorno.DataString;



    sRetorno := StringReplace(sRetorno,'&gt;','>',[rfReplaceAll,rfIgnoreCase]);
    sRetorno := StringReplace(sRetorno,'&lt;','<',[rfReplaceAll,rfIgnoreCase]);


    iPosInicial := Pos('<xml xsi:type="xsd:string">',sRetorno)+29;
    iPosFinal   := Pos('</xml>',sRetorno);
    sRetorno := copy(sRetorno,iPosInicial,iPosFinal-iPosInicial);



    Retorno := TStringStream.Create(sRetorno);

    cdsColaborador.Close;
    cdsColaborador.CreateDataSet;

    cdsColaborador.LoadFromStream(Retorno);

    with fdqCarga do
     begin
       Close;
       sql.Clear;
       sql.Add('DELETE FROM COLABORADOR');
       ExecSQL;
     end;


    cdsColaborador.First;
    while not cdsColaborador.eof do
      begin
        with fdqCarga do
         begin
           Close;
           sql.Clear;
           sql.Add('INSERT INTO COLABORADOR VALUES');
           sql.Add('(:CODIGO,:NOME,:SENHA,:FUNCAO)');
           ParamByName('CODIGO').AsInteger := cdsColaboradorCOD_COLABORADOR.AsInteger;
           ParamByName('NOME').AsString := cdsColaboradorNOME.AsString;
           ParamByName('SENHA').AsString := cdsColaboradorSENHA.AsString;
            ParamByName('FUNCAO').AsString :='';
           ExecSQL;

         end;
         cdsColaborador.Next;
      end;


  except
    ShowMessage('Falha no processo de importa??o');
  end;

end;





procedure TForm1.atualizaProdutos;
const sListaProduto = '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:uRestorIntf-IRestor">'
                     +'<soapenv:Header/>'
                     +'<soapenv:Body>'
                     +'<urn:importaCadProd soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">'
                     +'<loja xsi:type="xsd:int">?*?</loja>'
                     +'</urn:importaCadProd>'
                     +'</soapenv:Body>'
                     +'</soapenv:Envelope>';
 var sErro, sNumPedido,sRetorno, sCupom, sLinha, sCab : string;
    iTermino, iPosInicial, iPosFinal, i, iTamanho, iItem :integer;
    LItem : TListViewItem;
    Retorno , Solicit: TStringStream;
    sListaPedido: string;
    iCont:Integer;
begin
         iCont := 1;
  try

  Retorno := TStringStream.Create(EmptyStr);
  sListaPedido:= sListaProduto;
  sListaPedido:= StringReplace(sListaPedido,'?*?',IntToStr(iLoja),[rfReplaceAll]);
  Solicit := TStringStream.Create(sListaPedido, TEncoding.UTF8);

  IdHTTP1.Request.ContentType := 'text/xml';
  IdHTTP1.Request.Charset := 'utf-8';
  IdHTTP1.ConnectTimeout  := 5000;
  IdHTTP1.Request.CustomHeaders.Values['SOAPAction'] := 'urn:uRestorIntf-IRestor#importaCadProd';
  IdHTTP1.ProtocolVersion := pv1_1;
  IdHTTP1.HTTPOptions := IdHTTP1.HTTPOptions + [hoKeepOrigProtocol];
    try
     // IdHTTP1.Post('http://sriservicos.com.br/integrasri/IntegraSRI.dll/soap/ISRI',Solicit, Retorno);
      IdHTTP1.Post('http://'+sEndereco+'/soap/ISRI',Solicit, Retorno);
    except
      exit;
    end;

    sRetorno:= Retorno.DataString;




    {if Retorno = sNumPedido
       then exit;

       Retorno := sNumPedido;
     }

    sRetorno := StringReplace(sRetorno,'&gt;','>',[rfReplaceAll,rfIgnoreCase]);
    sRetorno := StringReplace(sRetorno,'&lt;','<',[rfReplaceAll,rfIgnoreCase]);


    iPosInicial := Pos('<xml xsi:type="xsd:string">',sRetorno)+29;
    iPosFinal   := Pos('</xml>',sRetorno);
    sRetorno := copy(sRetorno,iPosInicial,iPosFinal-iPosInicial);


    Retorno := TStringStream.Create(sRetorno);
    cdsProdutos.Close;
    cdsProdutos.CreateDataSet;

    {cdsProdutos.Filtered := False;
    cdsProdutos.Filter := 'TIPO = 0 or 4';
    cdsProdutos.Filtered := True;}
    cdsProdtemp.LoadFromStream(Retorno);
   // cdsProdutos.LoadFromStream(Retorno);


      with fdqCarga do
       begin
         close;
         sql.Clear;
         sql.Add('DELETE FROM PRODUTOS');
         ExecSQL;
       end;


     if not cdsProdtemp.IsEmpty then
      begin

        cdsProdtemp.First;


           while not cdsProdtemp.eof do
            begin
              with fdqCarga do
               begin
                 Close;
                 sql.Clear;
                 sql.Add('INSERT INTO produtos');
                 sql.Add('(cod_produto');
                 sql.Add(',descricao');
                 sql.Add(',venda');
                 sql.Add(',cod_interno)');
                 sql.Add('VALUES');
                 sql.Add('(:cod_produto');
                 sql.Add(',:descricao');
                 sql.Add(',:venda');
                 sql.Add(',:cod_interno)');
                 ParamByName('cod_produto').AsString   := cdsProdtemp.FieldByName('COD_PRODUTO').AsString;
                 ParamByName('descricao').AsString     := cdsProdtemp.FieldByName('DESCRICAO').AsString;
                 ParamByName('venda').AsFloat          := cdsProdtemp.FieldByName('VENDA').AsFloat;
                 ParamByName('cod_interno').AsInteger  := iCont;
                 ExecSQL;

               end;
               iCont := iCont+1;
               cdsProdtemp.Next;
            end;

      end;

  except

    diag.Show(TIconDialog.Error,'Falha da importa??o de produtos','' )
  end;


end;

procedure TForm1.atualizaTotal(icodVenda:Integer);
var tb:TFDQuery;
begin

   tb := TFDQuery.Create(self);
   tb.Connection := FDConnection1;

   with tb do
    begin
      Close;
      SQL.Clear;
      sql.Add('SELECT SUM(TOTAL)  AS TOTAL,SUM(DESCONTO) AS DESCONTO FROM ITENS_VENDA WHERE ID_VENDA = :ID ');
      ParamByName('ID').AsInteger := icodVenda;
      Open();

    end;

    lbTotal.Text := 'Total :  R$ '+FormatFloat('0.00',tb.FieldByName('TOTAL').AsFloat);

    rTotal    := tb.FieldByName('TOTAL').AsFloat;
    rDesconto := tb.FieldByName('DESCONTO').AsFloat;

    with tb do
     begin
      Close;
      SQL.Clear;
      sql.Add('UPDATE VENDA SET VALOR = :VALOR , DESCONTO = :DESC WHERE ID = :ID ');
      ParamByName('VALOR').AsFloat := rTotal;
      ParamByName('ID').AsInteger  := icodVenda;
      ParamByName('DESC').AsFloat  := rDesconto;
      ExecSQL;

     end;


   if Assigned(tb) then
      FreeAndNil(tb);

end;

procedure TForm1.buscaVendas;
const sListaProduto = '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:uPOSIntf-IPOS">'
                     +'<soapenv:Header/>'
                     +'<soapenv:Body>'
                     +'<urn:listaBalcao soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">'
                     +'<loja xsi:type="xsd:int">?lja?</loja>'
                     +'<vendedor xsi:type="xsd:int">?cvd?</vendedor>'
                     +'</urn:listaBalcao>'
                     +'</soapenv:Body>'
                     +'</soapenv:Envelope>';

var sErro, sNumPedido,sRetorno,sRetorno2, sCupom, sLinha, sCab : string;
    iTermino, iPosInicial, iPosFinal,iPosInicial2, iPosFinal2, i, iTamanho, iItem :integer;
    LItem : TListViewItem;
    Retorno ,Retorno2, Solicit: TStringStream;
    sListaPedido: string;
begin

  try

    Retorno := TStringStream.Create(EmptyStr);
    sListaPedido:= sListaProduto;
    sListaPedido:= StringReplace(sListaPedido,'?lja?',IntToStr(iLoja),[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?cvd?',IntToStr(codusuario),[rfReplaceAll]);
    Solicit := TStringStream.Create(sListaPedido, TEncoding.UTF8);

    IdHTTP1.Request.ContentType := 'text/xml';
    IdHTTP1.Request.Charset := 'utf-8';
    IdHTTP1.ConnectTimeout := 5000;
    IdHTTP1.Request.CustomHeaders.Values['SOAPAction'] := 'urn:uPOSIntf-IPOS#listaBalcao';
    IdHTTP1.ProtocolVersion := pv1_1;
    IdHTTP1.HTTPOptions := IdHTTP1.HTTPOptions + [hoKeepOrigProtocol];
    try
    //  IdHTTP1.Post('http://192.168.0.3:8080/soap/IPOS',Solicit, Retorno);
      IdHTTP1.Post('http://'+sEndereco+'/soap/IRESTOR',Solicit, Retorno);
    except
      exit;
    end;

    sRetorno:= Retorno.DataString;


    sRetorno := StringReplace(sRetorno,'&gt;','>',[rfReplaceAll,rfIgnoreCase]);
    sRetorno := StringReplace(sRetorno,'&lt;','<',[rfReplaceAll,rfIgnoreCase]);


    iPosInicial := Pos('<?xml version="1.0" standalone="yes"?>  ',sRetorno)+40;
    iPosFinal   := Pos('</xml>',sRetorno);

    sRetorno := copy(sRetorno,iPosInicial,iPosFinal-iPosInicial);
    Retorno := TStringStream.Create(sRetorno);
    cdsVendas.Close;
    cdsVendas.CreateDataSet;

    cdsVendas.LoadFromStream(Retorno);
    lvPedidos.Items.Clear;
   // listaVendas;

  except

    diag.Show(TIconDialog.Error,'Falha no lan?amento da venda','' )
  end;



end;

function TForm1.cancelaItem(loja, item, npedido: integer): Real;
 const sListaProduto = '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:uRestorIntf-IRestor">'
+'<soapenv:Header/>'
+'<soapenv:Body>'
+'<urn:CancelaItem soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">'
+'<loja xsi:type="xsd:int">?nloja?</loja>'
+'<iNrItem xsi:type="xsd:int">?nit?</iNrItem>'
+'<iPedido xsi:type="xsd:int">?npdd?</iPedido>'
+'</urn:CancelaItem>'
+'</soapenv:Body>'
+'</soapenv:Envelope>';

var sErro, sNumPedido,sRetorno, sCupom, sLinha, sCab : string;
    iTermino, iPosInicial, iPosFinal, i, iTamanho, iItem :integer;
    LItem : TListViewItem;
    Retorno , Solicit: TStringStream;
    sListaPedido: string;
begin

  try

  Retorno := TStringStream.Create(EmptyStr);
  sListaPedido:= sListaProduto;
  sListaPedido:= StringReplace(sListaPedido,'?nloja?',IntToStr(loja),[rfReplaceAll]);
  sListaPedido:= StringReplace(sListaPedido,'?nit?',inttostr(item),[rfReplaceAll]);
  sListaPedido:= StringReplace(sListaPedido,'?npdd?',IntToStr(npedido),[rfReplaceAll]);
  Solicit := TStringStream.Create(sListaPedido, TEncoding.UTF8);

  IdHTTP1.Request.ContentType := 'text/xml';
  IdHTTP1.Request.Charset := 'utf-8';
  IdHTTP1.Request.CustomHeaders.Values['SOAPAction'] := 'urn:uRestorIntf-IRestor#CancelaItem';
  IdHTTP1.ProtocolVersion := pv1_1;
  IdHTTP1.HTTPOptions := IdHTTP1.HTTPOptions + [hoKeepOrigProtocol];
    try
     // IdHTTP1.Post('http://sriservicos.com.br/integrasri/IntegraSRI.dll/soap/IRESTOR',Solicit, Retorno);
      IdHTTP1.Post('http://'+sEndereco+'/soap/IRESTOR',Solicit, Retorno);
    except
      exit;
    end;

    sRetorno:= Retorno.DataString;

    {if Retorno = sNumPedido
       then exit;

       Retorno := sNumPedido;
     }

    sRetorno := StringReplace(sRetorno,'&gt;','>',[rfReplaceAll,rfIgnoreCase]);
    sRetorno := StringReplace(sRetorno,'&lt;','<',[rfReplaceAll,rfIgnoreCase]);



    iPosInicial := Pos('<return xsi:type="xsd:int">',sRetorno)+27;
    iPosFinal   := Pos('</return>',sRetorno);
    sRetorno := copy(sRetorno,iPosInicial,iPosFinal-iPosInicial);


    Result := strtoint(sRetorno);


  except
   diag.Show(TIconDialog.Error,'Falha na exclus?o do item','' )

  end;



end;

procedure TForm1.addListaProduto(codigo,descricao:String;preco:Real);
begin
 with lvProdutos.Items.Add do
   begin
     Detail := codigo;
     TListItemText(Objects.FindDrawable('Text1')).Text := descricao;
     TListItemText(Objects.FindDrawable('Text3')).Text := 'Pre?o R$ '+formatFloat('0.00',preco);
     TListItemText(Objects.FindDrawable('Text2')).Text := Copy(descricao,1,2);
   end;

end;


procedure TForm1.CargaProduto(busca: string; ind_clear: boolean; delay : integer);
var LItem : TListViewItem;
    tb:TFDQuery;
begin

    if lvprodutos.TagString = '1' then
        exit;

    lvprodutos.TagString := '1'; // Em processamento...

    if ind_clear then
    begin
        lvprodutos.Items.Clear;
        lvprodutos.Tag := 0;
    end;

    lvprodutos.BeginUpdate;

    TThread.CreateAnonymousThread(procedure
    begin
        sleep(delay);

        FdqCarga.Active := false;
        FdqCarga.SQL.Clear;
        FdqCarga.SQL.Add('SELECT P.* ');
        FdqCarga.SQL.Add('FROM PRODUTOS P');

        // Filtro...
        if busca <> '' then
        begin
            FdqCarga.SQL.Add('WHERE P.DESCRICAO LIKE ''%'' || :BUSCA || ''%'' ');
            FdqCarga.ParamByName('BUSCA').Value := busca;
        end;

        FdqCarga.SQL.Add('ORDER BY DESCRICAO');
        FdqCarga.SQL.Add('LIMIT :PAGINA, :QTD_REG');
        FdqCarga.ParamByName('PAGINA').Value := lvprodutos.Tag * 25;
        FdqCarga.ParamByName('QTD_REG').Value := 25;
        FdqCarga.Active := true;

        lvprodutos.Tag := lvprodutos.Tag + 1;

        while NOT FdqCarga.Eof do
        begin
            TThread.Synchronize(nil, procedure
            begin

                addListaProduto(FdqCarga.FieldByName('COD_PRODUTO').AsString,
                           FdqCarga.FieldByName('DESCRICAO').AsString,
                           FdqCarga.FieldByName('VENDA').AsFloat);


            end);

            FdqCarga.Next;
        end;

        // Nao carregar mais dados...
        if FdqCarga.RecordCount = 0 then
            lvprodutos.Tag := -1;

        lvprodutos.TagString := ''; // Processamento terminou...

        TThread.Synchronize(nil, procedure
        begin
            lvprodutos.EndUpdate;
//            img_no_produto.Visible := lv_produtos.Items.Count = 0;
        end);

    end).Start;
end;

procedure TForm1.carregaFinalizadora;
 var Litem:TListViewItem;
     txt:TListItemText;
     img:TListItemImage;
     i:Integer;

begin

    lvFinalizadora.Items.Clear;

    LItem := lvFinalizadora.Items.Add;
    LItem.Bitmap := imgReal.MakeScreenshot ;
    LItem.Text := 'Dinheiro';
    Litem.Detail := 'D';


    LItem := lvFinalizadora.Items.Add;
    LItem.Bitmap := imgCartao.MakeScreenshot ;
    LItem.Text := 'Cart?o';
    Litem.Detail := 'C';

    Label14.Text := 'SALDO R$ '+FormatFloat('0.00',rTotal);




end;

function TForm1.LerPerfil: string;
var
  sIni:string;
  Ini : TIniFile;
  sCliente: string;
begin
  {$IFDEF ANDROID}
  try
    sIni := TPath.Combine(TPath.GetDocumentsPath, 'tema.ini');
    if not FileExists(sini) then
     begin
       Result := '0';
     end
    else
     begin
       Ini := TIniFile.Create(TPath.Combine(TPath.GetDocumentsPath, 'tema.ini'));
       Result := Ini.ReadString('tema', 'foto', sCliente);
     end;
  finally
    Ini.DisposeOf;
  end;
  {$ENDIF}

  {$IFDEF MSWINDOWS}
  try
//    sIni := 'E:\producao\android\DescontoMobile\Com Venda\App Santana\Perfil.ini';
    sIni := 'C:\temp\tema.ini';
    if not FileExists(sini) then
     begin
       Result := '0';
     end
    else
     begin
       Ini := TIniFile.Create('C:\temp\tema.ini');
       Result := Ini.ReadString('tema', 'foto', sCliente);
     end;
  finally
    Ini.Free;
  end;
  {$ENDIF}


end;

function TForm1.SetAsBase64(const ASource: string):TBitmap;
var
  LInputStream: TStringStream;
  LOutputStream: TBytesStream;
begin
  LInputStream := TStringStream.Create(ASource);
  Result := TBitmap.Create;
  try
    LInputStream.Position := 0;
    LOutputStream := TBytesStream.Create;
    try
      TNetEncoding.Base64.Decode(LInputStream, LOutputStream);
      LOutputStream.Position := 0;
      Result.LoadFromStream(LOutputStream);
    finally
      LOutputStream.Free;
    end;
  finally
    LInputStream.Free;
  end;


end;

procedure TForm1.conexao;
begin
   with FDConnection1 do
    begin
       {$IFDEF IOS}
       Params.Values['DriverID']:= 'SQLite';
        try
              Params.Values['Database']:= TPath.combine(Tpath.getDocumentsPath,'venda.s3db');
              Connected := True;
        except
                Exception.Create('Error de conex?o com o banco de Dados: ');
        end;
        {$ENDIF}

        {$IFDEF ANDROID}
        Params.Values['DriverID']:= 'SQLite';
        try
              Params.Values['Database']:= TPath.combine(Tpath.getDocumentsPath,'venda.s3db');
              Connected := True;
        except
            ShowMessage('erro de conexao');
        end;
        {$ENDIF}

       {$IFDEF MSWINDOWS}
        try
             Params.Values['Database']:= 'D:\producao\android\VendaMobile\banco\venda.s3db';
           // Params.Values['Database']:= 'C:\temp\venda.s3db';
             Connected := True;
        except
           ShowMessage('erro de conex?o');
        end;
        {$ENDIF}

    end;
end;

procedure TForm1.Edit2ChangeTracking(Sender: TObject);
begin
  { cdsProdtemp.Filtered := False;
   cdsProdtemp.Filter := 'DESCRICAO LIKE '+CHR(39)+'%'+UpperCase(Edit2.Text)+'%'+Chr(39);
   cdsProdtemp.Filtered := True;}
   CargaProduto(UpperCase(Edit2.Text),true,0);
end;

procedure TForm1.Edit4Typing(Sender: TObject);
begin
  Formatar(Edit4, TFormato.Valor); // Valor...
end;

procedure TForm1.edtCEPExit(Sender: TObject);
var sEndereco: TStringList;
 i:Integer;
ResultsObj:TJSONObject;
begin
  sEndereco := TStringList.Create();

   sEndereco := dm.buscaCEP(edtCEP.Text);
  if sEndereco.Count = 0 then
    begin
      diag.Show(TIconDialog.Error,'','Cep inv?lido','OK');
    end
  else
    begin
      edtEndereco.Text := sEndereco[0].ToUpper;
      edtCidade.Text   := sEndereco[3].ToUpper;
      edtBairro.Text   := sEndereco[1].ToUpper;


    end;





end;

procedure TForm1.edtDescontoKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  formatarMoeda(edtDesconto,KeyChar);
end;

procedure TForm1.edtquantidadeTyping(Sender: TObject);
begin
  Formatar(edtquantidade, TFormato.Valor); // Valor...
end;

procedure TForm1.enviaVenda;
var req, resp:TStringStream;
 ResultsArray :TJSONArray;
 strResp:string;
 sId:string;
  jso,jsonFinal,jsoItem:TJSONObject;
  jsoP:TJSONPair;
  iRetorno:Integer;
  erro:string;
  strlist:TStringList;
  tb:TFDQuery;
 const  user = 'cliente.sri';
 const  password = '698dc19d489c4e4db73e28a713eab07b';
 const  endPoint = 'http://srionline.com.br/mamba/mambaserver.dll';

begin

    sId := '123123123';

    IdHTTP1:= TIdHTTP.Create(self);
    IdHTTP1.ConnectTimeout := 5000;
    IdHTTP1.ReadTimeout := 10000;
    idHttp1.Request.Clear;

    idHttp1.Request.BasicAuthentication := True;
    IdHTTP1.Request.Username := user;
    IdHTTP1.Request.Password := password;
    IdHTTP1.Request.Accept := 'text/javascript';

    IdHTTP1.Request.ContentEncoding := 'utf-8';

  //  strAutentic:= TStringStream.Create(ResultsArray.ToString);

     tb := TFDQuery.Create(self);
     tb.Connection := FDConnection1;

     with tb do
      begin
        Close;
        sql.Clear;
        sql.Add('SELECT * FROM ITENS_VENDA WHERE ID_VENDA = :ID');
        ParamByName('ID').AsInteger := icodVenda;
        Open();
      end;

     if not tb.IsEmpty then
      begin
        tb.First;
        ResultsArray:= TJSONArray.Create;

        while not tb.eof do
          begin
            jsoItem:= TJSONObject.Create;
            jsoItem.AddPair( 'codinterno', TJSONNumber.Create(tb.FieldByName('COD_INTERNO').AsInteger));
            jsoItem.AddPair( 'descricao',tb.FieldByName('DESCRICAO').AsString);
            jsoItem.AddPair( 'venda', TJSONNumber.Create(tb.FieldByName('VENDA').AsFloat));
            jsoItem.AddPair( 'qtd', TJSONNumber.Create(tb.FieldByName('QTD').AsFloat));
            jsoItem.AddPair( 'desconto', TJSONNumber.Create(0));
            jsoItem.AddPair( 'total', TJSONNumber.Create(tb.FieldByName('TOTAL').AsFloat));

            ResultsArray.AddElement( jsoItem );
            tb.Next;
          end;
             // ResultsArray.AddElement(TJSONObject.Create( TJSONPair.Create('Itens', jsoItem )));
        jsonFinal := TJSONObject.Create;
            // usar serial do cell
        jsonFinal.AddPair('idequipamento',TJSONNumber.Create(123123123));
        jsonFinal.AddPair('mov',ResultsArray);

        {  strlist:= tstringlist.create;
        // strlist.Text:= ResultsArray.ToString;
         strlist.Text:= jsonFinal.ToString;
         strlist.SaveToFile('c:\temp\testeitem.json');
         exit; }


        req:= TStringStream.Create(jsonFinal.ToString);
        resp:= TStringStream.Create();
        IdHTTP1.Post(endpoint+'/api/v1/stone/VendaTmp',req, resp);
        if IdHTTP1.ResponseCode in [200,201,202,203,204,204,205,206,207,208] then
          begin
           // ShowMessage(resp.DataString);
            jso := TJSONObject.Create;
            jso.Parse(resp.Bytes,0);
              for jsoP in jso do
                 begin
                   if jsop.JsonString.Value = 'result' then
                     iRetorno := (jsoP.JsonValue as TJSONNumber).AsInt
                   else
                   if jsop.JsonString.Value = 'erro' then
                       erro := (jsoP.JsonValue as TJSONString ).Value;

                  end;

            if(iRetorno = 1) then
              begin
                gerarNota;
              end
            else
              begin
                ShowMessage(jso.GetValue('erro').Value );
              end;
          end;

      end;



end;

procedure TForm1.FDConnection1AfterConnect(Sender: TObject);
var fd:TFDQuery;
    versao:string;
begin
  {
  fd := TFDQuery.Create(self);
  fd.Connection := FDConnection1;

  with fd do
   begin
     close;
     sql.Clear;
     SQL.Add('SELECT * FROM VERSAO');
     Open();
   end;

   versao := fd.FieldByName('VERSAO').AsString;

   // ATUALIZA PARA 2
   if versao = '1' then
    begin
       versao := '2';
       fd.ExecSQL('CREATE TABLE TEMA ( CODIGO INTEGER);');

       with fd do
         begin
           close;
           sql.Clear;
           SQL.Add('UPDATE VERSAO SET VERSAO = :VS');
           ParamByName('VS').AsString := versao;
           ExecSQL;
         end;
    end;}

end;

procedure TForm1.formatarMoeda(componente: TObject; var key: char);
var
 sValor:string;
 valor:Double;
begin

   if componente is TEdit then
    begin
      // se tecla pressionada ? um numero, backsPace ou delete ....
      if (key in ['0'..'9',#8,#9]) then
       begin
         // salva valor do edit
           sValor := TEdit(componente).Text;

           //valida vazio
           if sValor =EmptyStr then
              sValor := '0,00';

           // se valor numerico,insere na String...
           if key in ['0'..'9'] then
             sValor := Concat(sValor,key);

           //retira pontos  e virgulas
             sValor := Trim(StringReplace(sValor,'.','',[rfReplaceAll,rfIgnoreCase]));
             sValor := Trim(StringReplace(sValor,',','',[rfReplaceAll,rfIgnoreCase]));

           // inserindo 2 casas decimais
           valor := StrToFloat(sValor);
           valor := (valor/100);

           //retornando valor tratado no edit
           TEdit(componente).Text := FormatFloat('#,##0.00',valor);

           //reposiciona o cursor
           TEdit(componente).SelStart := Length(TEdit(componente).Text);

       end;

       // se n?o ? uma key importante reseta
       if not (key in [#8,#9]) then
         key := #0;
    end;


end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

   diag.Show(TIconDialog.Question, 'Aten??o',
            'Deseja fechar este aplicativo?', 'Sim', ClickOK, 'N?o', ClickCancel);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   rctAbertura.Visible := True;
   diag:= TFancyDialog.Create(self);
   permissao := T99Permissions.Create;
   LayoutQtd.Visible := False;
  {$IFDEF __TTASK__}
//  lblTitulo.text := 'Delphi '+getVersion+' (TTask)';
  {$ELSE}
//  lblTitulo.text := 'Delphi '+getVersion+' (TTimer)';

  timerTEF:= TTimer.Create(Form1);
  timerTEF.Interval:=1;
  timerTEF.OnTimer:=timerTEFTimer;
  timerTEF.Enabled:=False;
  {$ENDIF}

   cdsProdtemp := TClientDataSet.Create(nil);
   cdsProdtemp.FieldDefs.Add('COD_PRODUTO',ftString,14);
   cdsProdtemp.FieldDefs.Add('DESCRICAO',ftString,60);
   cdsProdtemp.FieldDefs.Add('UNIDADE',ftString,2);
   cdsProdtemp.FieldDefs.Add('COD_NCM',ftString,8);
   cdsProdtemp.FieldDefs.Add('CEST',ftString,7);
   cdsProdtemp.FieldDefs.Add('ST',ftString,4);
   cdsProdtemp.FieldDefs.Add('ALIQUOTA',ftString,2);
   cdsProdtemp.FieldDefs.Add('ICMS_IN',ftCurrency);
   cdsProdtemp.FieldDefs.Add('CFOP_IN',ftString,4);
   cdsProdtemp.FieldDefs.Add('CSTPC',ftInteger);
   cdsProdtemp.FieldDefs.Add('ALI_PIS_DEBITO',ftCurrency);
   cdsProdtemp.FieldDefs.Add('ALI_COFINS_DEBITO',ftCurrency);
   cdsProdtemp.FieldDefs.Add('COMPRA',ftCurrency);
   cdsProdtemp.FieldDefs.Add('VENDA',ftCurrency);
   cdsProdtemp.FieldDefs.Add('ESTOQUE',ftCurrency);
   cdsProdtemp.FieldDefs.Add('COD_GRUPO',ftInteger);
   cdsProdtemp.FieldDefs.Add('COD_SUBGRUPO',ftInteger);
   cdsProdtemp.FieldDefs.Add('LOCALIZACAO',ftString,10);
   cdsProdtemp.CreateDataSet;
   cdsProdtemp.Open;
   cdsProdtemp.LogChanges:= False;


   cdsClientestemp := TClientDataSet.Create(nil);
   cdsClientestemp.FieldDefs.Add('RAZAO',ftString,100);
   cdsClientestemp.FieldDefs.Add('CNPJ',ftString,100);
   cdsClientestemp.FieldDefs.Add('COD_CADASTRO',ftInteger);
   cdsClientestemp.FieldDefs.Add('TIPO',ftString,1);

   cdsClientestemp.CreateDataSet;
   cdsClientestemp.Open;
   cdsClientestemp.LogChanges:= False;



  TabControl1.TabPosition := TTabPosition.None;
  conexao;
  Image18.Visible := False;
 

   with FDqCarga do
   begin
     Close;
     sql.Clear;
     sql.Add('SELECT * FROM CONFIGURACAO');
     Open();
   end;



  if FDqCarga.IsEmpty then
   begin
     ShowMessage('Este ? o seu primeiro acesso, '+#13+'fa?a a configura??o do servidor e a carga das tabelas');
     abreConfig.ExecuteTarget(self);
   end
  else
   begin

     sEndereco     := FDqCarga.FieldByName('SERVIDOR').AsString;
     iLoja          := FDqCarga.FieldByName('LOJA').AsInteger;
     edtServidor.Text  := FDqCarga.FieldByName('SERVIDOR').AsString;
     edtLoja.Text         := FDqCarga.FieldByName('LOJA').AsString;

     if ((FDqCarga.FieldByName('CODLOGADO').AsInteger = 0)or(FDqCarga.FieldByName('CODLOGADO').AsString = '')) then
       begin
         TabControl1.ActiveTab := tbLogin;
       end
     else
       begin
         TabControl1.ActiveTab := tbMenu;
         lbusuario.Text := FDqCarga.FieldByName('NOMELOGADO').AsString;
         codusuario := fdqCarga.FieldByName('CODLOGADO').AsInteger;

       end;

   end;

    with FDqCarga do
   begin
     Close;
     sql.Clear;
     sql.Add('SELECT * FROM COD_VENDA');
     Open();
   end;


    icodVenda     := FDqCarga.FieldByName('VENDA').AsInteger;

  atualizaColaborador;

 // CargaProduto;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  permissao.DisposeOf;
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
var
  Fechar : Boolean;
begin
      if Key = vkHardwareBack then
      begin
        if ((tabControl1.ActiveTab <> tbMenu)) then
          begin

            if (tabControl1.ActiveTab = tbLogin) then
              begin
                key := 0;
                FormCloseQuery(Sender, Fechar);
                Exit;
              end;

            if (tabControl1.ActiveTab = tbVenda) then
              begin
                key := 0;

                Exit;
              end;
            if tabControl1.ActiveTab = tbProdutos then
              begin

                key := 0;
                Exit;

              end;
            if tabControl1.ActiveTab = tbConfig then
              begin

                key := 0;
                Exit;

              end;
            if tabControl1.ActiveTab = tbVendaAbertas then
              begin

                key := 0;
                voltaMenu.ExecuteTarget(self);
                Exit;

              end;


          end
        else
         begin
           key := 0;
           FormCloseQuery(Sender, Fechar);
         end;

      end;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
    Image29.AnimateFloat('opacity',1,5
                       ,TAnimationType.InOut
                       ,TInterpolationType.Circular);
    Timer1.Enabled := True;
end;

procedure TForm1.gerarNota;
var req, resp:TStringStream;
 strlist:TStringList;
 strResp:string;
 sId:string;
  jso,jsonFinal,jsoNnota,jsoInfNota,jsonCliente,jsonPagamento:   TJSONObject;
  jsoP,jsopNota,jsoPinfNota:TJSONPair;
  iRetorno:Integer;
  erro:string;
  qrCode:string;
 const  user = 'cliente.sri';
 const  password = '698dc19d489c4e4db73e28a713eab07b';
 const  endPoint = 'http://srionline.com.br/mamba/mambaserver.dll';

begin

    sId := '3123123';

    IdHTTP1:= TIdHTTP.Create(self);
    IdHTTP1.ConnectTimeout := 5000;
    IdHTTP1.ReadTimeout := 10000;
    idHttp1.Request.Clear;

    idHttp1.Request.BasicAuthentication := True;
    IdHTTP1.Request.Username := user;
    IdHTTP1.Request.Password := password;
    IdHTTP1.Request.Accept := 'text/javascript';

    IdHTTP1.Request.ContentEncoding := 'utf-8';

    jsonFinal := TJSONObject.Create;
    jsonFinal.AddPair('idequipamento','123123123');

    jsonCliente := TJSONObject.Create;
    jsonCliente.AddPair('email',sEmail);
    jsonCliente.AddPair('cpfcnpj',lbCliente.Text);

    jsonFinal.AddPair('cliente',jsonCliente);

    jsonPagamento := TJSONObject.Create;
    jsonPagamento.AddPair('nrParcelas','1');
    jsonPagamento.AddPair('datahora','now');
    jsonPagamento.AddPair('tipo','Dinheiro');
    jsonPagamento.AddPair('mod','Dinheiro');
    jsonPagamento.AddPair('autorizacao','123456789');
    jsonPagamento.AddPair('nsu','123456');
    jsonPagamento.AddPair('rede','dinheiro');
    jsonPagamento.AddPair('atk','123456');
    jsonPagamento.AddPair('valor',TJSONNumber.Create(1));

    jsonFinal.AddPair('pagamento',jsonPagamento);

 {  strlist:= tstringlist.create;
    // strlist.Text:= ResultsArray.ToString;
    strlist.Text:= jsonFinal.ToString;
    strlist.SaveToFile('c:\temp\testeitem2.json');
    exit;     }



  //  strAutentic:= TStringStream.Create(ResultsArray.ToString);
    req:= TStringStream.Create(jsonFinal.ToString);
    resp:= TStringStream.Create();
    IdHTTP1.Post(endpoint+'/api/v1/stone/VendaTMPparaNFCe',req, resp);
    if IdHTTP1.ResponseCode in [200,201,202,203,204,204,205,206,207,208] then
      begin
       // ShowMessage(resp.DataString);
       { strlist:= tstringlist.create;
        // strlist.Text:= ResultsArray.ToString;
        strlist.Text:= resp.DataString;
        strlist.SaveToFile('c:\temp\testeitem2.json');
        exit;}

        jso := TJSONObject.Create;
        jso.Parse(resp.Bytes,0);
          for jsoP in jso do
             begin
               if jsop.JsonString.Value = 'result' then
                 iRetorno := (jsoP.JsonValue as TJSONNumber).AsInt
                 else
               if jsop.JsonString.Value = 'erro' then
                   erro := (jsoP.JsonValue as TJSONString ).Value
                 else
               if jsop.JsonString.Value = 'NFCe' then
                  begin
                    jsoNnota:=  (jsoP.JsonValue as TJSONObject);
                    for jsopNota in jsoNnota do
                      begin

                        if jsopNota.JsonString.Value = 'infNFeSupl' then
                         begin
                           jsoInfNota := (jsopNota.JsonValue as TJSONObject);
                             for jsoPinfNota in jsoInfNota do
                               begin
                                 if jsoPinfNota.JsonString.Value = 'qrCode' then
                                   qrCode := (jsoPinfNota.JsonValue as TJSONString ).Value
                               end;

                         end;

                      end
                  end;



             end;

        if(iRetorno = 1) then
          begin
            ShowMessage('Nota gerada :'+qrCode);
          end
        else
          begin
            ShowMessage(jso.GetValue('erro').Value );
          end;
      end;


end;

procedure TForm1.Image12Click(Sender: TObject);
begin
  rctOpcaidade.Visible := False;
  rctModalCpf.Visible := False;
  lbCliente.Text := edtCpf.Text;
  icodVenda      := inserirVenda();
  lbNvenda.Text  := 'N? Venda : '+FormatFloat('0',icodVenda);
  RetornaItens(icodVenda);

end;

procedure TForm1.Image13Click(Sender: TObject);
begin

  rctOpcaidade.Visible := False;
  RctModal.Visible := False;

end;

procedure TForm1.Image14Click(Sender: TObject);
begin
  rctOpcaidade.Visible := False;
  rctModalCpf.Visible  := False;
  voltaMenu.ExecuteTarget(self);
end;

procedure TForm1.Image17Click(Sender: TObject);
begin
  voltaMenu.ExecuteTarget(self);
end;

procedure TForm1.Image18Click(Sender: TObject);
var req, resp:TStringStream;
 strResp:string;
 sId:string;
 jso:   TJSONObject;
 jsoP:TJSONPair;
 iRetorno:Integer;
 t:TThread;
 erro:string;
 const  user = 'cliente.sri';
 const  password = '698dc19d489c4e4db73e28a713eab07b';
 const  endPoint = 'http://srionline.com.br/mamba/mambaserver.dll';

begin

     { rctOpcaidade.Visible := True;
      rctEmail.Visible := True;
      }


        //usar serial do cell
        sId := '123123123';
        // usar email
        sEmail := 'marcos_antonio23@live.com';
        IdHTTP1:= TIdHTTP.Create(self);
        IdHTTP1.ConnectTimeout := 5000;
        IdHTTP1.ReadTimeout := 10000;
        idHttp1.Request.Clear;

        idHttp1.Request.BasicAuthentication := True;
        IdHTTP1.Request.Username := user;
        IdHTTP1.Request.Password := password;
        IdHTTP1.Request.Accept := 'text/javascript';

        IdHTTP1.Request.ContentEncoding := 'utf-8';

      //  strAutentic:= TStringStream.Create(ResultsArray.ToString);
        req:= TStringStream.Create();
        resp:= TStringStream.Create();
        IdHTTP1.Post(endpoint+'/api/v1/stone/CancelaVendaTMP/'+sId,req, resp);
        if IdHTTP1.ResponseCode in [200,201,202,203,204,204,205,206,207,208] then
          begin
           // ShowMessage(resp.DataString);
            jso := TJSONObject.Create;
            jso.Parse(resp.Bytes,0);
              for jsoP in jso do
                 begin
                   if jsop.JsonString.Value = 'result' then
                     iRetorno := (jsoP.JsonValue as TJSONNumber).AsInt
                   else
                   if jsop.JsonString.Value = 'erro' then
                       erro := (jsoP.JsonValue as TJSONString ).Value;



                 end;

            if(iRetorno = 1) then
              begin
               enviaVenda;
              end
            else
              begin
                //ShowMessage(jso.GetValue('erro').Value );
              end;
          end;




  voltaMenu.ExecuteTarget(self);
end;

procedure TForm1.Image19Click(Sender: TObject);
begin
  abreConfig.ExecuteTarget(self);
end;

procedure TForm1.Image20Click(Sender: TObject);
begin
 Layout50.visible := False;


end;

procedure TForm1.Image24Click(Sender: TObject);
begin
   edtCpf.Text := '';
   rctOpcaidade.Visible := True;
   rctModalCpf.Visible := True;

end;

procedure TForm1.Image26Click(Sender: TObject);
begin

    if StrToFloat(lb_valor.Text) <> 0 then
    begin
      lb_valor.Text := FormatFloat('0.00',0);
      Exit;
    end;

  rctOpcaidade.Visible := False;
  rctRecebimento.Visible := False;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin

  lbCliente.Text := '';
  lbTotal.Text   := 'Total : R$ 0,00';
  Image2.tag := 1;


   if icodVenda <> 0 then
   begin

         with FDqCarga do
     begin
       Close;
       sql.Clear;
       sql.Add('SELECT * FROM COD_VENDA');
       Open();
     end;


    icodVenda     := FDqCarga.FieldByName('VENDA').AsInteger;
    icod:=        FDqCarga.FieldByName('COD_CADASTRO').AsInteger;

    Image2.tag := 2;

      RetornaVenda(icodVenda);
      atualizaCliente(iCod.ToString);
      abreVenda.ExecuteTarget(self);



   end
   else
   begin


      diag.Show(TIconDialog.Question, 'Aten??o ',
                  'Deseja Indentificar Cliente?', 'Sim',Sim, 'N?o', Nao);


         abreVenda.ExecuteTarget(self);


   end;


 // imgItens.Visible := False;

  

 { icodVenda      := inserirVenda();
  lbNvenda.Text  := 'N? Venda : '+FormatFloat('0',icodVenda);
  RetornaItens(icodVenda);
 { edtCpf.Text := '';
  rctOpcaidade.Visible := True;
  rctModalCpf.Visible := True;}

end;

procedure TForm1.Image31Click(Sender: TObject);
begin
  LayoutQtd.Visible := False;
end;

procedure TForm1.Image32Click(Sender: TObject);
begin
  if not permissao.VerifyCameraAccess then
     permissao.Camera(nil,nil)
  else
    begin
      frmCamera.ShowModal(procedure(modalresult:TModalResult)
      begin
        lancaItemDireto(frmCamera.codigo);
      end);
    end;


end;

procedure TForm1.Image33Click(Sender: TObject);
begin
  LayoutQtdFracionado.Visible := False;
end;

procedure TForm1.lancaItemDireto(cod:String);
var rQtd,rDesconto,retorno,rTotal:Real;
 stotal:string;
begin

  with  fdqCarga do
    begin
       close;
       sql.Clear;
       sql.Add('select * from produtos where cod_produto = :cod');
       ParamByName('cod').AsString := cod;
       Open();
    end;

   if not fdqCarga.IsEmpty then
      begin
       rQtd      := StrToFloat('1');
       rDesconto := 0;
       rTotal    := (rQtd*cdsProdtemp.FieldByName('VENDA').AsFloat);
       stotal    := FloatToStr(rTotal);
       stotal    := StringReplace(stotal,',','.',[rfReplaceAll,rfIgnoreCase]);


       LancaItem(iLoja,0,cod,rDesconto,rQtd,FloatToStr(rTotal));
       RetornaVenda(icodVenda);
       voltaVenda.ExecuteTarget(self);
      end
   else
      ShowMessage('Opa! produto n?o encontrado.');

end;

procedure TForm1.Image4Click(Sender: TObject);
begin
  abreVendas.ExecuteTarget(self);
  buscaVendas;
  listaDeVendas();
end;

procedure TForm1.Image6Click(Sender: TObject);
begin

    abreProduto.ExecuteTarget(self);

end;

procedure TForm1.Image7Click(Sender: TObject);
begin
    MessageDlg('Deseja Fazer Logoff do aplicativo agora ? ',
      System.UITypes.TMsgDlgType.mtInformation,
      [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo], 0,
      procedure(const BotaoPressionado: TModalResult)
        begin
        case BotaoPressionado of
            mrYes: begin

                with fdqCarga do
                   begin
                     close;
                     sql.Clear;
                     sql.Add('update configuracao set codlogado = :log,nomelogado = :usu');
                     ParamByName('log').AsInteger := 0;
                     ParamByName('usu').AsString  := '';
                     ExecSQL;
                   end;

                  Application.Terminate;

              end;
            mrNo: begin
                //
              end;
          end;
        end
      );
end;

procedure TForm1.Image8Click(Sender: TObject);
 var rQtd,rDesconto,retorno,rTotal:Real;
 stotal:string;
begin
   if cdsProdtemp.Locate('cod_produto',codproduto,[loCaseInsensitive,loPartialKey]) then
    begin
      rQtd      := StrToFloat(StringReplace(edtQtd.Text,'.',',',[rfReplaceAll,rfIgnoreCase]));
      rDesconto := StrToFloatDef(edtDesconto.Text,0);
      rTotal    := (rQtd*cdsProdtemp.FieldByName('VENDA').AsFloat);
      stotal    := FloatToStr(rTotal);
      stotal    := StringReplace(stotal,',','.',[rfReplaceAll,rfIgnoreCase]);


      LancaItem(iLoja,0,codproduto,rDesconto,rQtd,FloatToStr(rTotal));
      rctOpcaidade.Visible := False;
      RctModal.Visible := False;
      RetornaVenda(icodVenda);
      voltaVenda.ExecuteTarget(self);

    end;


end;

procedure TForm1.imgMaisClick(Sender: TObject);
begin
   try
     lbQtd.Text := FormatFloat('00',lbQtd.Text.ToInteger+TImage(sender).Tag);
   except
     lbQtd.Text := '01';
   end;


  if lbQtd.Text.ToInteger <1 then
    lbQtd.Text := '01';

end;

procedure TForm1.img_backspaceClick(Sender: TObject);
begin
    Tecla_Backspace();
end;
procedure TForm1.Tecla_Backspace();
var
        sValor : string;
begin
        with Form1 do
        begin
                svalor := lbl_valor.Text;  // 5.200,00
                svalor := StringReplace(svalor, '.', '', [rfReplaceAll]); // 5200,00
                svalor := StringReplace(svalor, ',', '', [rfReplaceAll]); // 520000

                if Length(svalor) > 1 then
                        svalor := Copy(svalor, 1, length(svalor) - 1)
                else
                        svalor := '0';

                lbl_valor.Text := FormatFloat('#,##0.000', StrToFloat(svalor) / 1000);
        end;
end;

procedure TForm1.inserirItem(codproduto: String; rQtd, rDesconto: Real);
var tb:TFDQuery;
    seq:Integer;
begin

  tb := TFDQuery.Create(self);
  tb.Connection := FDConnection1;


  with tb do
   begin
     Close;
     sql.Clear;
     sql.Add('SELECT * FROM PRODUTOS WHERE COD_INTERNO = :COD');
     ParamByName('COD').AsString := codProduto;
     Open();
   end;

   if RctModal.Tag = 1 then
     begin
       with fdqCarga do
         begin
          Close;
          sql.Clear;
          sql.Add('insert into itens_venda(');
          sql.Add('id_venda');
          sql.Add(',cod_produto');
          sql.Add(',descricao');
          sql.Add(',cod_interno');
          sql.Add(',venda');
          sql.Add(',qtd');
          sql.Add(',desconto');
          sql.Add(',total');
          sql.Add(',item');
          sql.Add(',cancelado');
          sql.Add(')values(');
          sql.Add(':id_venda');
          sql.Add(',:cod_produto');
          sql.Add(',:descricao');
          sql.Add(',:cod_interno');
          sql.Add(',:venda');
          sql.Add(',:qtd');
          sql.Add(',:desconto');
          sql.Add(',:total');
          sql.Add(',:item');
          sql.Add(',:cancelado)');
          ParamByName('id_venda').AsInteger    := icodVenda;
          ParamByName('cod_produto').asstring  := tb.FieldByName('COD_PRODUTO').AsString;
          ParamByName('descricao').AsString    := tb.FieldByName('DESCRICAO').AsString;
          ParamByName('cod_interno').AsInteger := StrToInt(codproduto);
          ParamByName('venda').AsFloat         := tb.FieldByName('VENDA').AsFloat;
          ParamByName('qtd').AsFloat           := rQtd;
          ParamByName('desconto').AsFloat      := rDesconto;
          ParamByName('total').AsFloat         := rQtd *tb.FieldByName('VENDA').AsFloat;
          ParamByName('item').AsString         := formatfloat('0000',pegarItem(icodVenda));
          ParamByName('cancelado').AsString    := 'F';
          ExecSQL;
         end;


     end;

  { if rctLancaProduto.Tag = 2 then
     begin
       with fdqCarga do
         begin
          Close;
          sql.Clear;
          sql.Add('update itemVenda set ');
          sql.Add('qtd = :qtd');
          sql.Add(',venda = :venda');
          sql.Add(',total = :total');
          sql.Add(',desconto = :desc');
          sql.Add('where codVenda = :codVenda');
          sql.Add('and cod_produto = :codProd');
          sql.Add('and item = :item');
          ParamByName('codVenda').AsInteger := StrToInt(lbNpedido.Text);
          ParamByName('item').AsString := lvProdutosPedido.Items[lvProdutosPedido.Selected.index].Detail;
          ParamByName('codprod').AsString := lbCod.Text;
          ParamByName('qtd').AsFloat := qtd;
          ParamByName('venda').AsFloat := StrToFloat(Copy(edtVenda.Selected.Text,10,10));
          ParamByName('total').AsFloat := (qtd*StrToFloat(Copy(edtVenda.Selected.Text,10,10))-StrToFloat(edtDescReal.Text));
          ParamByName('desc').AsFloat := StrToFloat(edtDescReal.Text);
          ExecSQL;
         end;

     end;

              }

   if not Assigned(tb) then
      FreeAndNil(tb);

end;

function TForm1.inserirVenda: Integer;
var tb:TFDQuery;
    seq:Integer;
begin

   tb := TFDQuery.Create(self);
   tb.Connection := FDConnection1;

   try
     with tb do
       begin
        Close;
        sql.Clear;
        sql.Add('insert into venda');
        sql.Add('(data');
        sql.Add(',cliente');
        sql.Add(',cancelado');
        sql.Add(',valor');
        sql.Add(',desconto');
        sql.Add(')values(');
        sql.Add(':data');
        sql.Add(',:cliente');
        sql.Add(',:cancelado');
        sql.Add(',:valor');
        sql.Add(',:desconto)');
        ParamByName('data').AsDate         := Date();
        ParamByName('cliente').AsString     := edtCpf.Text;
        ParamByName('cancelado').AsString  := 'F';
        ParamByName('valor').AsFloat       := 0;
        ParamByName('desconto').AsFloat    := 0;
        ExecSQL;
       end;

   except
      Result := -1;
   end;

   with tb do
    begin
      Close;
      SQL.Clear;
      sql.Add('select max(ID)as ID from venda where cancelado = :p ');
      ParamByName('P').AsString := 'F';
      Open();
    end;

   Result := tb.FieldByName('ID').AsInteger;

  if Assigned(TB) then
    FreeAndNil(TB);


end;

procedure TForm1.Label18Click(Sender: TObject);
var fd:TFDQuery;
begin
  codusuario := 0;
   with fdqCarga do
   begin
     Close;
     sql.Clear;
     sql.Add('select * from colaborador where nome = :nome and senha = :senha');
     ParamByName('nome').AsString := UpperCase(edtLogin.Text);
     ParamByName('senha').AsString := Trim(edtSenha.Text);
     Open();
   end;

  if not fdqCarga.IsEmpty then
   begin

     fd := TFDQuery.Create(self);
     fd.Connection := FDConnection1;

     abreMenu.ExecuteTarget(Self);
    with fd do
     begin
       close;
       sql.Clear;
       sql.Add('UPDATE CONFIGURACAO SET CODLOGADO = :LOGADO ,NOMELOGADO = :USU');
       ParamByName('LOGADO').AsInteger := fdqCarga.FieldByName('CODIGO').AsInteger;
       ParamByName('USU').AsString     := fdqCarga.FieldByName('NOME').AsString;
       ExecSQL;
     end;

     edtLogin.Text := '';
     edtSenha.Text := '';
     codusuario := fdqCarga.FieldByName('CODIGO').AsInteger;
     lbUsuario.Text  := fdqCarga.FieldByName('NOME').AsString;
     atualizaProdutos;
     CargaProduto('',True,0);

     //criarBotesGrupo;
     if cdsProdtemp.IsEmpty then
      begin
        ShowMessage('Tabela de produtos fazia');
      end;

   end
  else
   begin
     ShowMessage('Login ou senha Incorreto');
     Exit
   end;
end;

function TForm1.LancaItem(loja, resp: Integer; codProduto: String; desconto,
  qtd: Real; Total: String): Real;
const slacaProduto = '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:uRestorIntf-IRestor">'
      +'<soapenv:Header/>'
      +'<soapenv:Body>'
      +'<urn:vendeItemMovDav soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">'
      +'<loja xsi:type="xsd:int">?lja?</loja>'
      +'<pedido xsi:type="xsd:int">?npdd?</pedido>'
      +'<responsavel xsi:type="xsd:int">?rps?</responsavel>'
      +'<cod_produto xsi:type="xsd:string">?cpd?</cod_produto>'
      +'<obs xsi:type="xsd:string">?obs?</obs>'
      +'<desconto xsi:type="xsd:double">?dct?</desconto>'
      +'<qtd xsi:type="xsd:double">?qtd?</qtd>'
      +'<total xsi:type="xsd:double">?ttl?</total>'
      +'<erro xsi:type="xsd:string">?</erro>'
      +'</urn:vendeItemMovDav>'
      +'</soapenv:Body>'
      +'</soapenv:Envelope>';
var sErro, sNumPedido,sRetorno, sCupom, sLinha, sCab : string;
    iTermino, iPosInicial, iPosFinal, i, iTamanho, iItem :integer;
    LItem : TListViewItem;
    Retorno , Solicit: TStringStream;
    sDesconto,sQtd,sListaPedido: string;
    valor:Real;
begin

  try

    sQtd := FloatToStr(qtd);
    sQtd := StringReplace(sQtd,',','.',[rfReplaceAll]);
    Total := StringReplace(Total,',','.',[rfReplaceAll]);
    sDesconto := FloatToStr(desconto);
    sDesconto := StringReplace(sDesconto,',','.',[rfReplaceAll]);




    Retorno := TStringStream.Create(EmptyStr);
    sListaPedido:= slacaProduto;
    sListaPedido:= StringReplace(sListaPedido,'?lja?',IntToStr(loja),[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?npdd?',IntToStr(icodVenda),[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?rps?',IntToStr(resp),[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?cpd?',codProduto,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?dct?',sdesconto,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?qtd?',sQtd,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?ttl?',Total,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?obs?','',[rfReplaceAll]);
   Solicit := TStringStream.Create(sListaPedido, TEncoding.UTF8);

  IdHTTP1.Request.ContentType := 'text/xml';
  IdHTTP1.Request.Charset := 'utf-8';
  IdHTTP1.ConnectTimeout := 5000;
  IdHTTP1.Request.CustomHeaders.Values['SOAPAction'] := 'urn:uRestorIntf-IRestor#vendeItemMovDav';
  IdHTTP1.ProtocolVersion := pv1_1;
  IdHTTP1.HTTPOptions := IdHTTP1.HTTPOptions + [hoKeepOrigProtocol];
    try
      //IdHTTP1.Post('http://sriservicos.com.br/integrasri/IntegraSRI.dll/soap/IRESTOR',Solicit, Retorno);
      IdHTTP1.Post('http://'+sEndereco+'/soap/IRESTOR',Solicit, Retorno);
    except
      exit;
    end;

    sRetorno:= Retorno.DataString;


    {if Retorno = sNumPedido
       then exit;

       Retorno := sNumPedido;
     }

    sRetorno := StringReplace(sRetorno,'&gt;','>',[rfReplaceAll,rfIgnoreCase]);
    sRetorno := StringReplace(sRetorno,'&lt;','<',[rfReplaceAll,rfIgnoreCase]);
   {
    Memo1.Lines.Text := sRetorno;
    Exit;  }

    iPosInicial := Pos('<return xsi:type="xsd:int">',sRetorno)+27;
    iPosFinal   := Pos('</return>',sRetorno);
    sRetorno := copy(sRetorno,iPosInicial,iPosFinal-iPosInicial);



  except

  end;

  Result := StrToFloat(sRetorno);


end;

procedure TForm1.LancaVenda;
const sListaProduto = '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:uPOSIntf-IPOS">'
+'<soapenv:Header/>'
+'<soapenv:Body>'
+'<urn:PedidoBalcao soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">'
+'<loja xsi:type="xsd:int">?lja?</loja>'
+'<colaborador xsi:type="xsd:int">?cbl?</colaborador>'
+'<sNome xsi:type="xsd:string">?cpf?</sNome>'
+'</urn:PedidoBalcao>'
+'</soapenv:Body>'
+'</soapenv:Envelope>';

var sErro, sNumPedido,sRetorno,sRetorno2, sCupom, sLinha, sCab : string;
    iTermino, iPosInicial, iPosFinal,iPosInicial2, iPosFinal2, i, iTamanho, iItem :integer;
    LItem : TListViewItem;
    Retorno ,Retorno2, Solicit: TStringStream;
    sListaPedido: string;
begin

  try

    Retorno := TStringStream.Create(EmptyStr);
    sListaPedido:= sListaProduto;
    sListaPedido:= StringReplace(sListaPedido,'?lja?',IntToStr(iLoja),[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?cpf?','11870848403',[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?cbl?',codusuario.ToString,[rfReplaceAll]);
    Solicit := TStringStream.Create(sListaPedido, TEncoding.UTF8);

    IdHTTP1.Request.ContentType := 'text/xml';
    IdHTTP1.Request.Charset := 'utf-8';
    IdHTTP1.ConnectTimeout := 5000;
    IdHTTP1.Request.CustomHeaders.Values['SOAPAction'] := 'urn:uPOSIntf-IPOS#PedidoBalcao';
    IdHTTP1.ProtocolVersion := pv1_1;
    IdHTTP1.HTTPOptions := IdHTTP1.HTTPOptions + [hoKeepOrigProtocol];
    try
     // IdHTTP1.Post('http://127.0.0.1:8080/soap/ISRI',Solicit, Retorno);
     IdHTTP1.Post('http://'+sEndereco+'/soap/IPOS',Solicit, Retorno);
      //IdHTTP1.Post('http://192.168.15.30:8080/soap/IPOS',Solicit, Retorno);
    except
      exit;
    end;

    sRetorno:= Retorno.DataString;


    sRetorno := StringReplace(sRetorno,'&gt;','>',[rfReplaceAll,rfIgnoreCase]);
    sRetorno := StringReplace(sRetorno,'&lt;','<',[rfReplaceAll,rfIgnoreCase]);


    iPosInicial := Pos('<return xsi:type="xsd:int">',sRetorno)+27;
    iPosFinal   := Pos('</return>',sRetorno);


    sRetorno := copy(sRetorno,iPosInicial,iPosFinal-iPosInicial);
    icodVenda := StrToInt(sRetorno);
    lbNvenda.Text := 'N? VENDA : '+FormatFloat('00000000',icodVenda);
    sVenda := icodVenda.ToString;
   { Memo1.Lines.Text := sRetorno;
    Exit; }

      with FDqCarga do
    begin
      Close;
      sql.Clear;
      sql.Add('DELETE FROM COD_VENDA');
      ExecSQL;
    end;
   with FDqCarga do
    begin
      Close;
      sql.Clear;
      sql.Add('INSERT INTO COD_VENDA');
      sql.Add('(VENDA');
      sql.Add(',COD_CADASTRO)');
      sql.Add('VALUES');
      sql.Add('(:VENDA');
       sql.Add(',:COD)');
      ParamByName('VENDA').AsInteger := icodVenda;
      ParamByName('COD').AsInteger := iCod_Cadastro;

      ExecSQL;
    end;





  except
    ShowMessage('Falha no lan?amento da venda');
  end;


end;

procedure TForm1.EnviaRecebimento;
const sListaProduto = '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:uSRIIntf-ISRI">'
                     +'<soapenv:Header/>'
                     +'<soapenv:Body>'
                     +'<urn:GravaRecDav soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">'
                     +'<loja xsi:type="xsd:int">?lja?</loja>'
                     +'<ID_ORCAMENTO xsi:type="xsd:string">?ORC?</ID_ORCAMENTO>'
                     +'<DATA xsi:type="xsd:string">''</DATA>'
                     +'<HORA xsi:type="xsd:string">''</HORA>'
                     +'<VALOR xsi:type="xsd:string">?vlr?</VALOR>'
                     +'<NSU xsi:type="xsd:string">?NSU?</NSU>'
                     +'<AUTORIZACAO xsi:type="xsd:string">?AUT?</AUTORIZACAO>'
                     +'<REDE xsi:type="xsd:string">?RDE?</REDE>'
                     +'<PRODUTO xsi:type="xsd:string">?PROD?</PRODUTO>'
                     +'<LOGICO xsi:type="xsd:string">?LGC?</LOGICO>'
                     +'<TIPO xsi:type="xsd:string">?TP?</TIPO>'
                     +'<NRPARCELAS xsi:type="xsd:string">?NRP?</NRPARCELAS>'
                     +'<CNPJ_ADQUIRENTE xsi:type="xsd:string">?CNPJ?</CNPJ_ADQUIRENTE>'
                     +'<ID_REMOTO xsi:type="xsd:string">?IREMT?</ID_REMOTO>'
                     +'<erro xsi:type="xsd:string">?</erro>'
                     +'</urn:GravaRecDav>'
                     +'</soapenv:Body>'
                     +'</soapenv:Envelope>';

var sErro, sNumPedido,sRetorno,sRetorno2, sCupom, sLinha, sCab : string;
    iTermino, iPosInicial, iPosFinal,iPosInicial2, iPosFinal2, i, iTamanho, iItem :integer;
    LItem : TListViewItem;
    Retorno ,Retorno2, Solicit: TStringStream;
    sListaPedido: string;
begin

  try

    Retorno := TStringStream.Create(EmptyStr);
    sListaPedido:= sListaProduto;
    sListaPedido:= StringReplace(sListaPedido,'?lja?',IntToStr(iLoja),[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?ORC?',icodVenda.ToString,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?vlr?',Copy(lbTotal.Text,11,20),[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?NSU?','2222',[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?AUT?','3',[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?RDE?','R',[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?PROD?','',[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?LGC?','',[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?TP?','T',[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?NRP?','1',[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?CNPJ?','00000',[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?IREMT?','0',[rfReplaceAll]);


    Solicit := TStringStream.Create(sListaPedido, TEncoding.UTF8);

    IdHTTP1.Request.ContentType := 'text/xml';
    IdHTTP1.Request.Charset := 'utf-8';
    IdHTTP1.ConnectTimeout := 5000;
    IdHTTP1.Request.CustomHeaders.Values['SOAPAction'] := 'urn:uSRIIntf-ISRI#GravaRecDav';
    IdHTTP1.ProtocolVersion := pv1_1;
    IdHTTP1.HTTPOptions := IdHTTP1.HTTPOptions + [hoKeepOrigProtocol];
    try
     // IdHTTP1.Post('http://127.0.0.1:8080/soap/ISRI',Solicit, Retorno);
     IdHTTP1.Post('http://'+sEndereco+'/soap/ISRI',Solicit, Retorno);
      //IdHTTP1.Post('http://192.168.15.30:8080/soap/IPOS',Solicit, Retorno);
    except
      exit;
    end;

    sRetorno:= Retorno.DataString;


    sRetorno := StringReplace(sRetorno,'&gt;','>',[rfReplaceAll,rfIgnoreCase]);
    sRetorno := StringReplace(sRetorno,'&lt;','<',[rfReplaceAll,rfIgnoreCase]);


    iPosInicial := Pos('<return xsi:type="xsd:int">',sRetorno)+27;
    iPosFinal   := Pos('</return>',sRetorno);


    sRetorno := copy(sRetorno,iPosInicial,iPosFinal-iPosInicial);
    if StrToInt(sRetorno) = 1 then
      diag.Show(TIconDialog.Success,'Venda realizada com sucesso','' )
    else
      diag.Show(TIconDialog.Error,'Erro no Recebimento','' )


   { Memo1.Lines.Text := sRetorno;
    Exit; }


  except

    diag.Show(TIconDialog.Error,'Falha no lan?amento da venda','' );
  end;


end;

procedure TForm1.lbl_tecla0Click(Sender: TObject);
begin
  Tecla_Numero(sender);
end;

procedure TForm1.listaDeVendas;
  var tb :TFDQuery;
  Litem:TListViewItem;
  txt:TListItemText;
  img:TListItemImage;

begin


   if not cdsVendas.IsEmpty then
     begin
       lvPedidos.Items.Clear;
        cdsVendas.First;
       while not cdsVendas.Eof do
         begin
           Litem := lvPedidos.Items.Add;

           with Litem do
            begin

               txt := TListItemText(Objects.FindDrawable('Text1'));
               txt.Text := 'Pedido : '+FormatFloat('00000000',cdsVendasCOD_ORCAMENTO.AsInteger);
               txt.Font.Size := 11;
               txt.Font.Style := [TFontStyle.fsBold];

               txt := TListItemText(Objects.FindDrawable('Text2'));
               txt.Text := 'Data do Pedido : '+FormatDateTime('dd/mm/yyyy',cdsVendasDATA.AsDateTime);
               txt.Font.Size := 10;

               img := TListItemImage(Objects.FindDrawable('Image4'));
               img.Bitmap := Image16.Bitmap;

               img := TListItemImage(Objects.FindDrawable('Image5'));
               img.Bitmap := imgEditar.Bitmap;

               txt := TListItemText(Objects.FindDrawable('Text3'));
               txt.Text := 'Valor : '+FormatFloat('0.00',cdsVendasTOTAL.AsFloat);
               txt.Font.Size := 11;


               {txt := TListItemText(Objects.FindDrawable('Text3'));
               txt.Text := tb.FieldByName('CANCELADO').AsString;
               txt.Font.Size := 10;}

               LItem.Detail := cdsVendasCOD_ORCAMENTO.AsString;

            end;
           cdsVendas.Next;
         end;
     end;



end;

procedure TForm1.listaItensMesa;
var LItem:TListViewItem;
    txt:TListItemText;
    img:TListItemImage;
begin

  lvProdutosPedidos.Items.Clear;

  while not cdsItensVenda.eof do
   begin

    LItem := lvProdutosPedidos.Items.Add;

    with LItem do
     begin

       txt := TListItemText(Objects.FindDrawable('Text1'));
       txt.Text := cdsItensVendaDESCRICAO.AsString;
       txt.WordWrap := False;
       txt.Font.Size := 12;
       txt.Font.Style := [TFontStyle.fsBold];

       txt := TListItemText(Objects.FindDrawable('Text3'));
       txt.Text := formatfloat('0.00',cdsItensVendaVENDA.AsFloat)
       +'  *  '+formatfloat('0.00',cdsItensVendaQTD.AsFloat)
       +'  =  '+formatfloat('0.00',cdsItensVendaTOTAL.AsFloat);
       txt.WordWrap := true;
       txt.Font.Size := 12;

       img := TListItemImage(Objects.FindDrawable('Image2'));
       img.Bitmap := imgExcluir.Bitmap;

       LItem.Detail := cdsItensVendaITEM.AsString;

     end;

      cdsItensVenda.Next;
   end;

end;

procedure TForm1.listarItens(busca: string; ind_clear: boolean; delay : integer);
 var tb:TFDQuery;
begin
      if lvProdutos.TagString = '1' then
        exit;

    lvprodutos.TagString := '1'; // Em processamento...

    if ind_clear then
    begin
        lvprodutos.Items.Clear;
        lvprodutos.Tag := 0;
    end;

    lvprodutos.BeginUpdate;

    TThread.CreateAnonymousThread(procedure
    begin
        sleep(delay);

        tb.Active := false;
        tb.SQL.Clear;
        tb.SQL.Add('select');
        tb.SQL.Add('first :pnRegistro');
        tb.SQL.Add('skip (:pnRegistro *(:pnPagina-1))');
        tb.SQL.Add('cod_produto');
        tb.SQL.Add(',descricao');
        tb.SQL.Add(',venda');
        tb.SQL.Add('FROM PRODUTO P');

        // Filtro...
        if busca <> '' then
        begin
            tb.SQL.Add('WHERE P.DESCRICAO LIKE ''%'' || :BUSCA || ''%'' ');
            tb.ParamByName('BUSCA').Value := busca;
        end;

        tb.SQL.Add('ORDER BY DESCRICAO');
        tb.ParamByName('pnPagina').Value := lvprodutos.Tag * 25;
        tb.ParamByName('pnRegistro').Value := 25;
        tb.Active := true;

        lvprodutos.Tag := lvprodutos.Tag + 1;

        while NOT tb.Eof do
        begin
            TThread.Synchronize(nil, procedure
            begin

                addListaProduto(tb.FieldByName('COD_PRODUTO').AsString,
                           tb.FieldByName('DESCRICAO').AsString,
                           tb.FieldByName('VALOR').AsFloat
                           );

            end);

            tb.Next;
        end;

        // Nao carregar mais dados...
        if tb.RecordCount = 0 then
            lvprodutos.Tag := -1;

        lvprodutos.TagString := ''; // Processamento terminou...

        TThread.Synchronize(nil, procedure
        begin
            lvprodutos.EndUpdate;

        end);

    end).Start;
end;

procedure TForm1.listaVendas;
const sListaProduto = '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:uRestorIntf-IRestor">'
                     +'<soapenv:Header/>'
                     +'<soapenv:Body>'
                     +'<urn:retornaVendas soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">'
                     +'<loja xsi:type="xsd:int">?lja?</loja>'
                     +'<erro xsi:type="xsd:string">?</erro>'
                     +'</urn:retornaVendas>'
                     +'</soapenv:Body>'
                     +'</soapenv:Envelope>';

var sErro, sNumPedido,sRetorno,sRetorno2, sCupom, sLinha, sCab : string;
    iTermino, iPosInicial, iPosFinal,iPosInicial2, iPosFinal2, i, iTamanho, iItem :integer;
    LItem : TListViewItem;
    Retorno ,Retorno2, Solicit: TStringStream;
    sListaPedido: string;
begin

  try

    Retorno := TStringStream.Create(EmptyStr);
    sListaPedido:= sListaProduto;
    sListaPedido:= StringReplace(sListaPedido,'?lja?',IntToStr(iLoja),[rfReplaceAll]);
    Solicit := TStringStream.Create(sListaPedido, TEncoding.UTF8);

    IdHTTP1.Request.ContentType := 'text/xml';
    IdHTTP1.Request.Charset := 'utf-8';
    IdHTTP1.ConnectTimeout := 5000;
    IdHTTP1.Request.CustomHeaders.Values['SOAPAction'] := 'urn:uRestorIntf-IRestor#retornaVendas';
    IdHTTP1.ProtocolVersion := pv1_1;
    IdHTTP1.HTTPOptions := IdHTTP1.HTTPOptions + [hoKeepOrigProtocol];
    try
      //IdHTTP1.Post('http://sriservicos.com.br/integrasri/IntegraSRI.dll/soap/ISRI',Solicit, Retorno);
      IdHTTP1.Post('http://'+sEndereco+'/soap/IRESTOR',Solicit, Retorno);
    except
      exit;
    end;

    sRetorno:= Retorno.DataString;


    sRetorno := StringReplace(sRetorno,'&gt;','>',[rfReplaceAll,rfIgnoreCase]);
    sRetorno := StringReplace(sRetorno,'&lt;','<',[rfReplaceAll,rfIgnoreCase]);


    iPosInicial := Pos('<?xml version="1.0" standalone="yes"?>  ',sRetorno)+40;
    iPosFinal   := Pos('</xml>',sRetorno);

    sRetorno := copy(sRetorno,iPosInicial,iPosFinal-iPosInicial);
    Retorno := TStringStream.Create(sRetorno);
    cdsVendas.Close;
    cdsVendas.CreateDataSet;

    cdsVendas.LoadFromStream(Retorno);



  except
    ShowMessage('Falha no lan?amento da venda');
    diag.Show(TIconDialog.Error,'Falha no lan?amento da venda','' );
  end;



end;

procedure TForm1.lvFinalizadoraItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);

var tb:TFDQuery;
    seq:Integer;
    Produto,
 HabilitaImpressao,
 Parcelas,TipoParcelamento:String;
begin

   tipoPagamento :=  lvFinalizadora.Items[lvFinalizadora.Selected.index].Detail;

   if tipoPagamento = 'D' then
     begin
        tb := TFDQuery.Create(self);
        tb.Connection := FDConnection1;

        try

          with fdqCarga do
           begin
            Close;
            sql.Clear;
            sql.Add('insert into recebimento');
            sql.Add('( finalizadora');
            sql.Add(' ,cod_finalizadora');
            sql.Add(' ,valor');
            sql.Add(' ,id_venda');
            sql.Add(')values(');
            sql.Add('  :finalizadora');
            sql.Add(' ,:cod_finalizadora');
            sql.Add(' ,:valor');
            sql.Add(' ,:id_venda)');
            ParamByName('id_venda').AsInteger          := icodVenda;
            ParamByName('cod_finalizadora').AsInteger  := 1;
            ParamByName('finalizadora').AsString       := tipoPagamento;
            ParamByName('valor').AsFloat               := rTotal;

            ExecSQL;
           end;

           Label14.Text := 'SALDO R$ '+FormatFloat('0.00',0);

        except
           ShowMessage('falha ao tentar receber !!!');
        end;


     end;




 { tipoPagamento :=  lvFinalizadora.Items[lvFinalizadora.Selected.index].Detail;

  rctOpcaidade.Visible :=True;
  rctRecebimento.Visible :=True;  }


end;



{$IFNDEF __TTASK__}
procedure TForm1.timerTEFTimer(Sender: TObject);
var res:integer;

begin
  timerTEF.Enabled:=false;

  try
   if(TEFExecuteFlag>0)then begin
      res := transacao.response;
      if (res = 0)and(TEFExecuteFlag=1) then
        begin
          MostraAprovada;
        end
        else
        begin
          MostraNegada;
        end;
       TEFExecuteFlag:=0;
       RandomValor;
    end else begin
      timerTEF.Enabled:=True;
    end;

  except
      on e: exception do begin
      ShowMessage('Erro=>'+e.Message);
    end;

  end;

end;
{$ENDIF}
procedure TForm1.lvPedidosItemClickEx(const Sender: TObject; ItemIndex: Integer;
  const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
begin
  if TListView(sender).Selected <> nil then
     begin
         if ItemObject is TListItemImage then
            begin
               if TListItemImage(ItemObject).Name = 'Image5' then
                 begin
                  Image2.tag := 2;

                   icodVenda := StrToInt(lvPedidos.Items[lvPedidos.Selected.Index].Detail);

                   atualizaCliente('11');
                   RetornaVenda(icodVenda);
                   voltaVenda.ExecuteTarget(self);
                 end;
            end;
     end;




end;

procedure TForm1.lvProdutosItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin

    lbQtd.Text        := '01';
    lbl_valor.Text        := FormatFloat('0.000',0);
    if cdsProdtemp.Locate('COD_PRODUTO',lvProdutos.Items[lvProdutos.Selected.Index].Detail,[]) then
      begin
        desc              := cdsProdtemp.FieldByName('DESCRICAO').AsString;
        lbDescricao.Text  := cdsProdtemp.FieldByName('DESCRICAO').AsString;
        Label28.Text      := cdsProdtemp.FieldByName('DESCRICAO').AsString;
        valor             := cdsProdtemp.FieldByName('VENDA').AsFloat;
        codproduto        := lvProdutos.Items[lvProdutos.Selected.Index].Detail;
        //LayoutQtd.Visible := True;
        //LayoutQtd.Tag     := 1;
        LayoutQtdFracionado.Visible := True;
        Exit;

      end
     else
      begin
        ShowMessage('Item N?o encontrado');
        diag.Show(TIconDialog.Error,'Falha no lan?amento da venda','');
      end;
    {edtquantidade.Text   := '';
    Edit4.Text           := '';

    with  fdqCarga do
     begin
       close;
       sql.Clear;
       sql.Add('select * from produtos where cod_produto = :cod');
       ParamByName('cod').AsString := lvProdutos.Items[lvProdutos.Selected.Index].Detail;
       Open();
     end;

     if not fdqCarga.IsEmpty then
      begin
        desc              := fdqCarga.FieldByName('DESCRICAO').AsString;
        lbDescricao.Text  := fdqCarga.FieldByName('DESCRICAO').AsString;
        Label28.Text      := fdqCarga.FieldByName('DESCRICAO').AsString;
        valor             := fdqCarga.FieldByName('VENDA').AsFloat;
        Label43.Text      := 'R$ '+formatFloat('0.00',fdqCarga.FieldByName('VENDA').AsFloat);
        codproduto        := lvProdutos.Items[lvProdutos.Selected.Index].Detail;
        LayoutQtd.Visible := True;
        Exit;

      end
     else
      begin
        ShowMessage('Item N?o encontrado');
      end;
            }

{    if cdsProdtemp.Locate('COD_PRODUTO',lvProdutos.Items[lvProdutos.Selected.Index].Detail,[]) then
      begin
        desc              := cdsProdtemp.FieldByName('DESCRICAO').AsString;
        lbDescricao.Text  := cdsProdtemp.FieldByName('DESCRICAO').AsString;
        Label28.Text      := cdsProdtemp.FieldByName('DESCRICAO').AsString;
        valor             := cdsProdtemp.FieldByName('VENDA').AsFloat;
        codproduto        := lvProdutos.Items[lvProdutos.Selected.Index].Detail;
        LayoutQtd.Visible := True;
        Exit;

      end
     else
      begin
        ShowMessage('Item N?o encontrado');
      end;}
end;

procedure TForm1.Tecla_Numero(lbl: TObject);
var
   valorTeclado : string;
begin
   with Form1 do
      begin
       valorTeclado := lbl_valor.Text;
       valorTeclado := StringReplace(valorTeclado, '.', '', [rfReplaceAll]);
       valorTeclado := StringReplace(valorTeclado, ',', '', [rfReplaceAll]);

       valorTeclado := valorTeclado + TLabel(lbl).Text;

       lbl_valor.Text := FormatFloat('#,##0.000', StrToFloat(valorTeclado) / 1000);
      end;
end;


procedure TForm1.lvProdutosPedidosItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin

   if TListView(sender).Selected <> nil then
     begin

         if ItemObject is TListItemImage then
            begin

               if TListItemImage(ItemObject).Name = 'Image2' then
                 begin
                    diag.Show(TIconDialog.Question, 'Aten??o',
                    'Deseja Excluir item?', 'Sim',ClickYes, 'N?o', ClickNo);

                 end;
                  // cancelaItem(strtoint(lvProdutosPedido.Items[lvProdutosPedido.Selected.index].Detail),StrToInt(lbNpedido.Text));
                 end;

            end;




end;

procedure TForm1.lvProdutosPedidosUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
  var txt:TlistitemText;
begin
   with AItem do
    begin
      txt        := TListItemText(Objects.FindDrawable('Text1'));
      txt.Height := 33;
      txt.Width  := lvProdutosPedidos.Width - 50;
      txt.PlaceOffset.X := 5;
      txt.PlaceOffset.y := 4;
      txt.WordWrap := True;


    end;
end;

procedure TForm1.lvProdutosUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
 var
        indice : integer;
        largura : single;
        txt : TListItemText;
        img : TListItemImage;
        ind_disponivel : string;
        btn : TListItemTextButton;
        emb : TListItemEmbeddedControl;
        linha : TLine;
begin

    with AItem do
    begin


        Height := 70;
       {
         // Barra vertical...
        linha := TLine.Create(lvProdutos);
        linha.Width := 1;
        linha.Align := TAlignLayout.Contents;
        linha.Stroke.Kind := TBrushKind.Solid;
        linha.Stroke.Color := $FFC0C0BF;
        linha.Visible := true;
        linha.Opacity := 0.7;


        emb := TListItemEmbeddedControl.Create(AItem);
        emb.Width := 1;
        emb.Height := 20;
        emb.PlaceOffset.X := 20;
        emb.PlaceOffset.Y := 1;
        emb.Container.AddObject(linha); }


        // Imagem borda redonda...
        img               := TListItemImage(Objects.FindDrawable('Image4'));
        img.ScalingMode   := TImageScalingMode.Stretch;
        img.PlaceOffset.Y := 15;
        img.PlaceOffset.X := 1;
        img.Width         := 40;
        img.Height        := 40;
        ind_disponivel    := img.TagString;
        img.Opacity       := 0.8;
        img.Bitmap        := imgRedonda.Bitmap;


        // iniciais da descricao...
        txt               := TListItemText(Objects.FindDrawable('Text2'));
        txt.Width         := 40;
        txt.Height        := 40;
        txt.TextAlign     := TTextAlign.Center;
        txt.TextVertAlign := TTextAlign.Center;
        txt.PlaceOffset.Y := 15;
        txt.PlaceOffset.X := 1;
        txt.Font.Size     := 22;
        txt.Opacity       := 0.6;
        txt.TextColor     := $FFD2D2D2;
        txt.Font.Style    := [TFontStyle.fsBold];


        // Descricao do item...
        txt               := TListItemText(Objects.FindDrawable('Text1'));
        txt.Width         := lvProdutos.Width - 65;
        txt.Height        := 35;
        txt.TextAlign     := TTextAlign.Leading;
        txt.TextVertAlign := TTextAlign.Leading;
        txt.WordWrap      := True;
        txt.PlaceOffset.Y := 15;
        txt.PlaceOffset.X := 45;
        txt.Font.Size     := 12;
        txt.Opacity       := 0.6;
        txt.Font.Style    := [TFontStyle.fsBold];


        // Preco...
        txt               := TListItemText(Objects.FindDrawable('Text3'));
        txt.Width         := 210;
        txt.TextAlign     := TTextAlign.Leading;
        txt.TextVertAlign := TTextAlign.Leading;
        txt.PlaceOffset.Y := 47;
        txt.PlaceOffset.X := 45;
        txt.Font.Size     := 16;
        txt.Font.Size     := 12;
        txt.Opacity       := 0.6;


{
        // valor e vencimento
        txt := TListItemText(Objects.FindDrawable('TxtSub'));
        txt.Width := 200;
        txt.TextAlign := TTextAlign.Leading;
        txt.PlaceOffset.Y := 32;
        txt.PlaceOffset.X := 83;
        txt.Font.Size := 11;

        if ind_disponivel = 'N' then
            txt.TextColor := $FFD2D2D2
        else
            txt.TextColor := $FF8D8D8D;

       }

        {
        // imagem pago...
        img := TListItemImage(Objects.FindDrawable('ImgPago'));

        if img.TagString = 'P' then
        begin
            img.ScalingMode := TImageScalingMode.Stretch;
            img.Width := 46;
            img.Height := 18;
            img.PlaceOffset.Y := 10;
            img.PlaceOffset.X := lv_dashboard.width - 90;
            img.Bitmap := img_pago.Bitmap;
            img.Visible := true;
        end
        else
            img.Visible := true;     }

    end;
end;

function TForm1.pegarItem(codVenda: integer): integer;
var fdquery:TFDQuery;
begin

  fdquery := TFDQuery.Create(self);
  fdquery.Connection := FDConnection1;

  with fdquery do
    begin
      close;
      sql.Clear;
      sql.Add('SELECT * FROM ITENS_VENDA WHERE ID_VENDA = :PCOD');
      ParamByName('pcod').AsInteger := codVenda;
      Open();
    end;

    Result := fdquery.RecordCount + 1;


end;

procedure TForm1.RandomValor;
var strAux:string;
    i:integer;
begin
for i := 1 to 3 do begin
    strAux:=strAux+chr(48+random(10));
    if(i=1)then strAux:=strAux+',';
end;
cdsPedidoTOTAL.AsString := strAux;


end;

procedure TForm1.btnDesistirClick(Sender: TObject);
begin
  diag.Show(TIconDialog.Question, 'Aten??o ',
                  'Deseja Desestir da Venda?', 'Sim',ClickSim, 'N?o', ClickNao);

   { diag.TagString := '000001';
    diag.Show(TIconDialog.Question, 'Pergunta',
              'Confirma a exclus?o dos clientes?', 'Sim', ClickOK, 'N?o', ClickCancel);
     }

end;

procedure TForm1.ClickOK(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TForm1.ClickSim(Sender: TObject);
begin
 voltaMenu.ExecuteTarget(self);
end;
procedure TForm1.Sim(Sender: TObject);
begin
 rctModalCpf.Visible := True;
end;
procedure TForm1.ClickSimCliente(Sender: TObject);
begin

  rctModalCpf.Visible := False;
  TabControl1.ActiveTab := tbCadCliente;
end;

procedure TForm1.ClickYes(Sender: TObject);
var
valor:Real;
begin

 // cancela item
 valor := cancelaItem(iLoja,strtoint(lvProdutosPedidos.Items[lvProdutosPedidos.Selected.index].Detail),icodVenda);

 if valor < 0 then
   begin
    ShowMessage('falha na exclus?o do item');
   end
 else
   begin
     RetornaVenda(icodVenda);
   end;
// fim do cancela ite

end;

procedure TForm1.ClickCancel(Sender: TObject);
begin

end;

procedure TForm1.ClickNao(Sender: TObject);
begin
 rctModalCpf.Visible := False;
end;

procedure TForm1.ClickNo(Sender: TObject);
begin

end;
procedure TForm1.Nao(Sender: TObject);
begin
 iCod_Cadastro := 0;
 LancaVenda;
lvProdutosPedidos.Items.Clear;
rctModalCpf.Visible := False;
end;

procedure TForm1.btnFecharClick(Sender: TObject);
begin



  diag.Show(TIconDialog.Success, 'Sucesso! Venda salva ', 'Venda de Numero :'+icodVenda.ToString);

  icodVenda := 0;

  if Image2.tag <> 2 then
  begin
   with FDqCarga do
    begin
      Close;
      sql.Clear;
      sql.Add('DELETE FROM COD_VENDA');
      ExecSQL;
    end;
   with FDqCarga do
    begin
      Close;
      sql.Clear;
      sql.Add('INSERT INTO COD_VENDA');
      sql.Add('(VENDA)');
      sql.Add('VALUES');
      sql.Add('(:VENDA)');
      ParamByName('VENDA').AsInteger := 0;


      ExecSQL;
    end;


  end;

 voltaMenu.ExecuteTarget(self);
 //TabControl1.ActiveTab := TabItem1;
end;

procedure TForm1.rctCancelarClick(Sender: TObject);
begin

   if codusuario <> 0 then
    voltaMenu.ExecuteTarget(self)
   else
    TabControl1.ActiveTab := tbLogin;

end;

procedure TForm1.rctSalvarClick(Sender: TObject);
begin

  if length(Trim(edtLoja.Text)) < 0 then
   begin
     ShowMessage('loja n?o pode ser vazio');
     edtLoja.SetFocus;
     Exit;
   end;

  if length(Trim(edtServidor.Text)) < 0 then
   begin
     ShowMessage('servidor n?o pode ser vazio');
     edtServidor.SetFocus;
     Exit;
   end;

   with FDqCarga do
    begin
      Close;
      sql.Clear;
      sql.Add('DELETE FROM CONFIGURACAO');
      ExecSQL;
    end;
   with FDqCarga do
    begin
      Close;
      sql.Clear;
      sql.Add('INSERT INTO CONFIGURACAO');
      sql.Add('(LOJA,SERVIDOR)');
      sql.Add('VALUES');
      sql.Add('(:LOJA,:PRODUTO)');
      ParamByName('LOJA').AsInteger := StrToInt(edtLoja.Text);
      ParamByName('PRODUTO').AsString := edtServidor.Text;

      ExecSQL;
    end;


   iLoja := StrToInt(edtLoja.Text);
   sEndereco := edtServidor.Text;

   atualizaColaborador;

    if codusuario <> 0 then
      voltaMenu.ExecuteTarget(self)
    else
      TabControl1.ActiveTab := tbLogin;
end;

procedure TForm1.Rectangle14Click(Sender: TObject);
var rQtd,rDesconto,percDesconto,retorno,rTotal:Real;
 stotal:string;
begin
 {  if cdsProdtemp.Locate('cod_produto',codproduto,[]) then
    begin
      rQtd      := StrToFloat(StringReplace(lbQtd.Text,'.',',',[rfReplaceAll,rfIgnoreCase]));
      rDesconto := StrToFloatDef(edtDesconto.Text,0);
      rTotal    := (rQtd*cdsProdtemp.FieldByName('VENDA').AsFloat);
      stotal    := FloatToStr(rTotal);
      stotal    := StringReplace(stotal,',','.',[rfReplaceAll,rfIgnoreCase]);


      LancaItem(iLoja,0,codproduto,rDesconto,rQtd,FloatToStr(rTotal));
      LayoutQtd.Visible := False;
      RetornaVenda(icodVenda);
      voltaVenda.ExecuteTarget(self);

    end;   }



     with  fdqCarga do
     begin
       close;
       sql.Clear;
       sql.Add('select * from produtos where cod_produto = :cod');
       ParamByName('cod').AsString := lvProdutos.Items[lvProdutos.Selected.Index].Detail;
       Open();
     end;

     if not fdqCarga.IsEmpty then
      begin
        rQtd        := StrToFloat(StringReplace(edtquantidade.Text,'.',',',[rfReplaceAll,rfIgnoreCase]));
       // rDesconto := StrToFloatDef(edtDesconto.Text,0);
        percdesconto:= StrToFloatDef(Edit4.Text,0);
        rDesconto   := ((rQtd*fdqCarga.FieldByName('VENDA').AsFloat)*percDesconto)/100;
        rTotal      := (rQtd*fdqCarga.FieldByName('VENDA').AsFloat)-rDesconto;
        stotal      := FloatToStr(rTotal);
        stotal      := StringReplace(stotal,',','.',[rfReplaceAll,rfIgnoreCase]);


        LancaItem(iLoja,0,codproduto,rDesconto,rQtd,FloatToStr(rTotal));
        LayoutQtd.Visible := False;
        RetornaVenda(icodVenda);
        voltaVenda.ExecuteTarget(self);

      end;



end;

procedure TForm1.Rectangle19Click(Sender: TObject);
var rQtd,rDesconto,retorno,rTotal:Real;
 stotal:string;
begin
   if cdsProdtemp.Locate('cod_produto',codproduto,[]) then
    begin
      rQtd      := StrToFloat(StringReplace(lbl_valor.Text,'.',',',[rfReplaceAll,rfIgnoreCase]));
     // rDesconto := StrToFloatDef(edtDesconto.Text,0);
     rDesconto  := 0;
      rTotal    := (rQtd*cdsProdtemp.FieldByName('VENDA').AsFloat);
      stotal    := FloatToStr(rTotal);
      stotal    := StringReplace(stotal,',','.',[rfReplaceAll,rfIgnoreCase]);


      LancaItem(iLoja,0,codproduto,rDesconto,rQtd,FloatToStr(rTotal));
      LayoutQtdFracionado.Visible := False;
      RetornaVenda(icodVenda);
      voltaVenda.ExecuteTarget(self);

    end;


end;

procedure TForm1.Rectangle52Click(Sender: TObject);
begin
  atualizaCliente(edtCpf.Text);
  LancaVenda;
  lvProdutosPedidos.Items.Clear;
  rctModalCpf.Visible := False;
end;

procedure TForm1.Rectangle6Click(Sender: TObject);
begin
 TLoading.Show(Form1,'Atualizando Tabelas...');
 TThread.CreateAnonymousThread(procedure
  begin

    atualizaProdutos;
    CargaProduto('',True,0);

    tthread.Synchronize(nil,procedure
      begin
        TLoading.Hide;
      end);


  end).start;



    TabControl1.ActiveTab := tbMenu;

end;

procedure TForm1.Rectangle7Click(Sender: TObject);
begin
  EnviaRecebimento;
end;

procedure TForm1.Rectangle9Click(Sender: TObject);
begin
edtCpf.text := edtCpfCliente.Text;
 voltaMenu.ExecuteTarget(self);
 rctModalCpf.Visible := True;
end;

procedure TForm1.RetornaItens(ID:Integer);
var tb:TFDQuery;
    LItem:TListViewItem;
begin

    tb := TFDQuery.Create(self);
    tb.Connection := FDConnection1;

   with tb do
    begin
      Close;
      sql.Clear;
      sql.Add('SELECT * FROM ITENS_VENDA WHERE ID_VENDA = :ID AND CANCELADO = :CANC');
      ParamByName('ID').AsInteger  := ID;
      ParamByName('CANC').AsString := 'F';
      Open();
    end;

  if NOT tb.IsEmpty then
    begin
       imgItens.Visible := False;
       lvProdutosPedidos.Items.Clear;
       lvProdutosPedidos.BeginUpdate;

      tb.First;
      while not tb.Eof do
        BEGIN
          LItem := lvProdutosPedidos.Items.Add;

          LItem.Text := tb.FieldByName('DESCRICAO').AsString;
          LItem.Detail := tb.FieldByName('ID_VENDA').AsString;
         // LItem.Data[ TMultiDetailAppearanceNames.Detail1 ] := formatFloat('0.00',tb.FieldByName('VENDA').AsFloat)+
//          ' * '+tb.FieldByName('qtd').AsString+' = '+formatFloat('0.00',tb.FieldByName('TOTAL').AsFloat);
          //LItem.Data[ TMultiDetailAppearanceNames.Detail2 ] := 'VALOR  R$ '+formatFloat('0.000',cdsContasTOTAL_PAGAR.AsFloat);

          tb.Next;
        END;

        lvProdutosPedidos.EndUpdate;
    end
  else
    begin
      imgItens.Visible := true;
    end;

    if Assigned(TB) then
      FreeAndNil(TB);


end;

procedure TForm1.RetornaVenda(venda: integer);
const sListaProduto = '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:uRestorIntf-IRestor">'
+'<soapenv:Header/>'
+'<soapenv:Body>'
+'<urn:retornaPREVENDA soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">'
+'<loja xsi:type="xsd:int">?lja?</loja>'
+'<cod_orcamento xsi:type="xsd:int">?npd?</cod_orcamento>'
+'</urn:retornaPREVENDA>'
+'</soapenv:Body>'
+'</soapenv:Envelope>';

var sErro, sNumPedido,sRetorno,sRetorno2, sCupom, sLinha, sCab : string;
    iTermino, iPosInicial, iPosFinal,iPosInicial2, iPosFinal2, i, iTamanho, iItem :integer;
    LItem : TListViewItem;
    Retorno ,Retorno2, Solicit: TStringStream;
    sListaPedido: string;
begin

  try

    Retorno := TStringStream.Create(EmptyStr);
    sListaPedido:= sListaProduto;
    sListaPedido:= StringReplace(sListaPedido,'?lja?',IntToStr(iLoja),[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?npd?',IntToStr(Venda),[rfReplaceAll]);
    Solicit := TStringStream.Create(sListaPedido, TEncoding.UTF8);

    IdHTTP1.Request.ContentType := 'text/xml';
    IdHTTP1.Request.Charset := 'utf-8';
    IdHTTP1.ConnectTimeout := 5000;
    IdHTTP1.Request.CustomHeaders.Values['SOAPAction'] := 'urn:uRestorIntf-IRestor#retornaPREVENDA';
    IdHTTP1.ProtocolVersion := pv1_1;
    IdHTTP1.HTTPOptions := IdHTTP1.HTTPOptions + [hoKeepOrigProtocol];
    try
      //IdHTTP1.Post('http://sriservicos.com.br/integrasri/IntegraSRI.dll/soap/ISRI',Solicit, Retorno);
      IdHTTP1.Post('http://'+sEndereco+'/soap/ISRI',Solicit, Retorno);
    except
      exit;
    end;

    sRetorno:= Retorno.DataString;


    sRetorno := StringReplace(sRetorno,'&gt;','>',[rfReplaceAll,rfIgnoreCase]);
    sRetorno := StringReplace(sRetorno,'&lt;','<',[rfReplaceAll,rfIgnoreCase]);

    {Memo1.Lines.Text := sRetorno;
    Exit;}

    iPosInicial := Pos('<xmlPreVenda xsi:type="xsd:string">',sRetorno)+75;
    iPosFinal   := Pos('</xmlPreVenda>',sRetorno);

    iPosInicial2 := Pos('<xmlMovDav xsi:type="xsd:string">',sRetorno)+72;
    iPosFinal2   := Pos('</xmlMovDav>',sRetorno);

    sRetorno2 := copy(sRetorno,iPosInicial2,iPosFinal2-iPosInicial2);
    sRetorno := copy(sRetorno,iPosInicial,iPosFinal-iPosInicial);

    Retorno := TStringStream.Create(sRetorno);
    Retorno2 := TStringStream.Create(sRetorno2);

    cdsPedido.Close;
    cdsPedido.CreateDataSet;

    cdsPedido.LoadFromStream(Retorno);

    cdsItensVenda.Close;
    cdsItensVenda.CreateDataSet;
    cdsItensVenda.LoadFromStream(Retorno2);


    lbNvenda.Text := 'N? VENDA : '+FormatFloat('00000000',icodVenda);
    lbTotal.Text := 'TOTAL : R$ '+formatFloat('0.00',cdsPedidoTOTAL.AsFloat);
    listaItensMesa;

  except
    ShowMessage('Falha da importa??o de produtos');
  end;


end;

procedure TForm1.RoundRect1Click(Sender: TObject);
begin
  abreMenu.ExecuteTarget(self);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  abreConfig.ExecuteTarget(self);
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
 voltaMenu.ExecuteTarget(self);
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  listaVendas;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
   if codusuario <> 0 then
    voltaMenu.ExecuteTarget(self)
   else
    TabControl1.ActiveTab := tbLogin;

end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
  voltaVenda.ExecuteTarget(self);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  rctAbertura.Visible := False;
end;
procedure TForm1.atualizaCliente(cod : string);
const sListaProduto = '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:uClienteIntf-ICliente">'
                          +'<soapenv:Header/>'
                          +'<soapenv:Body>'
                          +' <urn:RetornaCadastroCliente soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">'
                          +'<loja xsi:type="xsd:int">?l?</loja>'
                          +' </urn:RetornaCadastroCliente>'
                          +'</soapenv:Body>'
                          +'</soapenv:Envelope>';
var sErro, sNumPedido,sRetorno, sCupom, sLinha, sCab : string;
    iTermino, iPosInicial, iPosFinal, i, iTamanho, iItem :integer;
    Retorno , Solicit: TStringStream;
    sCod,sListaPedido: string;
    icont:Integer;
begin

  try

  Retorno := TStringStream.Create(EmptyStr);
  sListaPedido:= sListaProduto;
  sListaPedido:=StringReplace(sListaPedido,'?l?',IntToStr(iLoja),[rfReplaceAll]);

  Solicit := TStringStream.Create(sListaPedido, TEncoding.UTF8);

  IdHTTP1.Request.ContentType := 'text/xml';
  IdHTTP1.Request.Charset := 'utf-8';
  IdHTTP1.ConnectTimeout := 5000;
  IdHTTP1.Request.CustomHeaders.Values['SOAPAction'] := 'urn:uClienteIntf-ICliente#RetornaCadastroCliente';
  IdHTTP1.ProtocolVersion := pv1_1;
  IdHTTP1.HTTPOptions := IdHTTP1.HTTPOptions + [hoKeepOrigProtocol];
    try
//      IdHTTP1.Post('http://sriservicos.com.br/integrasri/IntegraSRI.dll/soap/ISRI',Solicit, Retorno);
      IdHTTP1.Post('http://'+sEndereco+'/soap/ICliente',Solicit, Retorno);
    except
      ShowMessage('falha na conexao ');
      exit;
    end;

    sRetorno:= Retorno.DataString;

    sRetorno := StringReplace(sRetorno,'&gt;','>',[rfReplaceAll,rfIgnoreCase]);
    sRetorno := StringReplace(sRetorno,'&lt;','<',[rfReplaceAll,rfIgnoreCase]);

    iPosInicial := Pos('<xml xsi:type="xsd:string">',sRetorno)+66;
    iPosFinal   := Pos('</xml>',sRetorno);
    sRetorno := copy(sRetorno,iPosInicial,iPosFinal-iPosInicial);




   Retorno := TStringStream.Create(sRetorno);
    cdsClientes.Close;
    cdsClientes.CreateDataSet;

    {cdsProdutos.Filtered := False;
    cdsProdutos.Filter := 'TIPO = 0 or 4';
    cdsProdutos.Filtered := True;}
   cdsClientestemp.LoadFromStream(Retorno);
   // cdsProdutos.LoadFromStream(Retorno);


     { with fdqCarga do
       begin
         close;
         sql.Clear;
         sql.Add('DELETE FROM CLIENTES');
         ExecSQL;
       end;
            }
    SCOD :='0';
     if not cdsClientestemp.IsEmpty then
      begin

          cdsClientestemp.First;


           while not cdsClientestemp.eof do
            begin


               if cdsClientestemp.FieldByName('TIPO').AsString = 'C' then
               begin
                  if Image2.tag = 1 then
                  begin
                      if cdsclientestemp.FieldByName('CNPJ').AsString = cod then
                    begin
                    scod := '1';

                    iCod_Cadastro := cdsclientestemp.FieldByName('COD_CADASTRO').Asinteger;
                    lbCliente.Visible := True;
                    Layout11.Height := 85;
                    lbCliente.Text := 'Cliente :  '+ cdsclientestemp.FieldByName('CNPJ').AsString+'-'+cdsClientestemp.FieldByName('RAZAO').AsString;


                    end;


                  end;

                   if Image2.tag = 2 then
                   begin
                       if cdsclientestemp.FieldByName('COD_CADASTRO').Asinteger = cod.ToInteger then
                     begin
                     scod := '1';

                     //iCod_Cadastro := cdsclientestemp.FieldByName('COD_CADASTRO').Asinteger;
                     lbCliente.Visible := True;
                     Layout11.Height := 85;
                     lbCliente.Text := 'Cliente :  '+ cdsclientestemp.FieldByName('CNPJ').AsString+'-'+cdsClientestemp.FieldByName('RAZAO').AsString;


                      end;

                   end;


               end;




               cdsClientestemp.Next;
            end;


            if sCod = '0' then
            begin


              diag.Show(TIconDialog.Question, 'Aten??o ',
                  'Deseja Desestir da Venda?', 'Sim',ClickSimCliente, 'N?o', ClickNao);

            end;

      end;

  except

    diag.Show(TIconDialog.Error,'Falha da importa??o de produtos','' )
  end;



;


end;



end.
