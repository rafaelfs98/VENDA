unit ufrmCamera;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Media,
  {$IFDEF MSWINDOWS}
   MidasLib,
  {$ENDIF}
  {$IFDEF  ANDROID}
  ZXing.ScanManager,Zxing.ReadResult,Zxing.BarcodeFormat,
  {$ENDIF}
  FMX.platform;

type
  TfrmCamera = class(TForm)
    CameraComponent: TCameraComponent;
    lblErro: TLabel;
    imgCamera: TImage;
    imgClose: TImage;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    procedure CameraComponentSampleBufferReady(Sender: TObject;
      const ATime: TMediaTime);
    procedure FormShow(Sender: TObject);
    procedure imgCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
  {$IFDEF  ANDROID}
    fScanmananger :TScanManager;
    fScannInprogree:Boolean;
    FframeTake:Integer;
   {$ENDIF}
    procedure processarImagem;
    { Private declarations }
  public
    { Public declarations }
    codigo:string;
  end;

var
  frmCamera: TfrmCamera;

implementation

{$R *.fmx}

procedure TfrmCamera.CameraComponentSampleBufferReady(Sender: TObject;
  const ATime: TMediaTime);
begin
    processarImagem
end;

procedure TfrmCamera.FormCreate(Sender: TObject);
begin
   {$IFDEF ANDROID}
   fScanmananger := TScanManager.Create(TBarcodeFormat.Auto,nil);
   {$ENDIF}
end;

procedure TfrmCamera.FormDestroy(Sender: TObject);
begin
 {$IFDEF ANDROID}
 fScanmananger.DisposeOf;
 {$ENDIF }
end;

procedure TfrmCamera.FormShow(Sender: TObject);
begin
  {$IFDEF ANDROID}
  FframeTake := 0;
  {$ENDIF }
  CameraComponent.Active    := False;
  CameraComponent.Kind      := TCameraKind.BackCamera;
  CameraComponent.FocusMode := TFocusMode.ContinuousAutoFocus;
  CameraComponent.Quality   := TVideoCaptureQuality.LowQuality;
  CameraComponent.Active    := True;

end;

procedure TfrmCamera.imgCloseClick(Sender: TObject);
begin
   CameraComponent.Active := False;
   Close;
end;

procedure TfrmCamera.processarImagem();
var bitmap :TBitmap;
    {$IFDEF ANDROID}
    ReadResult:TReadResult;
    {$ENDIF}
begin


   CameraComponent.SampleBufferToBitmap(imgCamera.Bitmap,true);
    {$IFDEF ANDROID}
   if fScannInprogree then
     Exit;

   Inc(FframeTake);

   if (FframeTake mod 10 <> 0 )then
     Exit;


   bitmap := TBitmap.Create;
   bitmap.Assign(imgCamera.Bitmap);

   ReadResult := nil;

   try
     fScannInprogree := True;

     try
       ReadResult := fScanmananger.Scan(bitmap);

       if ReadResult <> nil  then
         begin
           CameraComponent.Active := False;
           codigo := ReadResult.text;
           Close;
         end;

     except
       on E:Exception do
        begin
          lblErro.Visible := True;
          lblErro.Text := e.Message;
        end;
     end;
   finally
     bitmap.DisposeOf;
     ReadResult.DisposeOf;
     fScannInprogree := false;
   end;

   {$ENDIF}

end;

end.
