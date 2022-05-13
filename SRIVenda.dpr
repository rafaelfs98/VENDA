program SRIVenda;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  u99Permissions in 'u99Permissions.pas',
  ufrmCamera in 'ufrmCamera.pas' {frmCamera},
  uFancyDialog in 'uFancyDialog.pas',
  uFormat in 'uFormat.pas',
  Loading in 'Loading.pas',
  ZXing.ScanManager in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\ZXing.ScanManager.pas',
  ZXing.BarcodeFormat in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Common\ZXing.BarcodeFormat.pas',
  ZXing.BitSource in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Common\ZXing.BitSource.pas',
  ZXIng.ByteSegments in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Common\ZXIng.ByteSegments.pas',
  ZXing.CharacterSetECI in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Common\ZXing.CharacterSetECI.pas',
  ZXing.Common.BitArray in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Common\ZXing.Common.BitArray.pas',
  ZXing.Common.BitArrayImplementation in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Common\ZXing.Common.BitArrayImplementation.pas',
  ZXing.Common.BitMatrix in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Common\ZXing.Common.BitMatrix.pas',
  ZXing.Common.DetectorResult in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Common\ZXing.Common.DetectorResult.pas',
  ZXing.Common.GridSampler in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Common\ZXing.Common.GridSampler.pas',
  ZXing.Common.PerspectiveTransform in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Common\ZXing.Common.PerspectiveTransform.pas',
  ZXing.DecodeHintType in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Common\ZXing.DecodeHintType.pas',
  ZXing.DecoderResult in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Common\ZXing.DecoderResult.pas',
  ZXing.DefaultGridSampler in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Common\ZXing.DefaultGridSampler.pas',
  ZXing.EncodeHintType in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Common\ZXing.EncodeHintType.pas',
  ZXing.Helpers in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Common\ZXing.Helpers.pas',
  ZXing.MultiFormatReader in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Common\ZXing.MultiFormatReader.pas',
  ZXing.Reader in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Common\ZXing.Reader.pas',
  ZXing.ReadResult in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Common\ZXing.ReadResult.pas',
  ZXing.ResultMetadataType in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Common\ZXing.ResultMetadataType.pas',
  ZXing.ResultPoint in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Common\ZXing.ResultPoint.pas',
  ZXing.ResultPointImplementation in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Common\ZXing.ResultPointImplementation.pas',
  ZXing.StringUtils in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Common\ZXing.StringUtils.pas',
  ZXing.OneD.Code39Reader in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\1D Barcodes\ZXing.OneD.Code39Reader.pas',
  ZXing.OneD.Code93Reader in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\1D Barcodes\ZXing.OneD.Code93Reader.pas',
  ZXing.OneD.Code128Reader in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\1D Barcodes\ZXing.OneD.Code128Reader.pas',
  ZXing.OneD.EAN8Reader in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\1D Barcodes\ZXing.OneD.EAN8Reader.pas',
  ZXing.OneD.EAN13Reader in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\1D Barcodes\ZXing.OneD.EAN13Reader.pas',
  ZXing.OneD.EANManufacturerOrgSupport in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\1D Barcodes\ZXing.OneD.EANManufacturerOrgSupport.pas',
  ZXing.OneD.ITFReader in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\1D Barcodes\ZXing.OneD.ITFReader.pas',
  ZXing.OneD.OneDReader in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\1D Barcodes\ZXing.OneD.OneDReader.pas',
  ZXing.OneD.UPCAReader in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\1D Barcodes\ZXing.OneD.UPCAReader.pas',
  ZXing.OneD.UPCEANExtension2Support in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\1D Barcodes\ZXing.OneD.UPCEANExtension2Support.pas',
  ZXing.OneD.UPCEANExtension5Support in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\1D Barcodes\ZXing.OneD.UPCEANExtension5Support.pas',
  ZXing.OneD.UPCEANExtensionSupport in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\1D Barcodes\ZXing.OneD.UPCEANExtensionSupport.pas',
  ZXing.OneD.UPCEANReader in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\1D Barcodes\ZXing.OneD.UPCEANReader.pas',
  ZXing.OneD.UPCEReader in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\1D Barcodes\ZXing.OneD.UPCEReader.pas',
  ZXing.Datamatrix.DataMatrixReader in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\2D Barcodes\ZXing.Datamatrix.DataMatrixReader.pas',
  ZXing.QrCode.QRCodeReader in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\2D Barcodes\ZXing.QrCode.QRCodeReader.pas',
  ZXing.BaseLuminanceSource in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Filtering\ZXing.BaseLuminanceSource.pas',
  ZXing.Binarizer in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Filtering\ZXing.Binarizer.pas',
  ZXing.BinaryBitmap in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Filtering\ZXing.BinaryBitmap.pas',
  ZXing.GlobalHistogramBinarizer in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Filtering\ZXing.GlobalHistogramBinarizer.pas',
  ZXing.HybridBinarizer in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Filtering\ZXing.HybridBinarizer.pas',
  ZXing.InvertedLuminanceSource in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Filtering\ZXing.InvertedLuminanceSource.pas',
  ZXing.LuminanceSource in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Filtering\ZXing.LuminanceSource.pas',
  ZXing.PlanarYUVLuminanceSource in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Filtering\ZXing.PlanarYUVLuminanceSource.pas',
  ZXing.RGBLuminanceSource in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Filtering\ZXing.RGBLuminanceSource.pas',
  ZXing.Common.Detector.MathUtils in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Common\Detector\ZXing.Common.Detector.MathUtils.pas',
  ZXing.Common.Detector.WhiteRectangleDetector in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Common\Detector\ZXing.Common.Detector.WhiteRectangleDetector.pas',
  ZXing.Common.ReedSolomon.GenericGF in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Common\ReedSolomon\ZXing.Common.ReedSolomon.GenericGF.pas',
  ZXing.Common.ReedSolomon.ReedSolomonDecoder in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\Common\ReedSolomon\ZXing.Common.ReedSolomon.ReedSolomonDecoder.pas',
  ZXing.Datamatrix.Internal.Detector in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\2D Barcodes\Detector\ZXing.Datamatrix.Internal.Detector.pas',
  ZXing.QrCode.Internal.AlignmentPattern in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\2D Barcodes\Detector\ZXing.QrCode.Internal.AlignmentPattern.pas',
  ZXing.QrCode.Internal.AlignmentPatternFinder in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\2D Barcodes\Detector\ZXing.QrCode.Internal.AlignmentPatternFinder.pas',
  ZXing.QrCode.Internal.AlignmentPatternImplementation in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\2D Barcodes\Detector\ZXing.QrCode.Internal.AlignmentPatternImplementation.pas',
  ZXing.QrCode.Internal.Detector in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\2D Barcodes\Detector\ZXing.QrCode.Internal.Detector.pas',
  ZXing.QrCode.Internal.FinderPattern in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\2D Barcodes\Detector\ZXing.QrCode.Internal.FinderPattern.pas',
  ZXing.QrCode.Internal.FinderPatternFinder in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\2D Barcodes\Detector\ZXing.QrCode.Internal.FinderPatternFinder.pas',
  ZXing.QrCode.Internal.FinderPatternImplementation in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\2D Barcodes\Detector\ZXing.QrCode.Internal.FinderPatternImplementation.pas',
  ZXing.QrCode.Internal.FinderPatternInfo in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\2D Barcodes\Detector\ZXing.QrCode.Internal.FinderPatternInfo.pas',
  ZXing.Datamatrix.Internal.BitMatrixParser in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\2D Barcodes\Decoder\ZXing.Datamatrix.Internal.BitMatrixParser.pas',
  ZXing.Datamatrix.Internal.DataBlock in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\2D Barcodes\Decoder\ZXing.Datamatrix.Internal.DataBlock.pas',
  ZXing.Datamatrix.Internal.DecodedBitStreamParser in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\2D Barcodes\Decoder\ZXing.Datamatrix.Internal.DecodedBitStreamParser.pas',
  ZXing.Datamatrix.Internal.Decoder in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\2D Barcodes\Decoder\ZXing.Datamatrix.Internal.Decoder.pas',
  ZXing.Datamatrix.Internal.Version in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\2D Barcodes\Decoder\ZXing.Datamatrix.Internal.Version.pas',
  ZXing.QrCode.Internal.BitMatrixParser in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.BitMatrixParser.pas',
  ZXing.QrCode.Internal.DataBlock in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.DataBlock.pas',
  ZXing.QrCode.Internal.DataMask in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.DataMask.pas',
  ZXing.QrCode.Internal.DecodedBitStreamParser in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.DecodedBitStreamParser.pas',
  ZXing.QrCode.Internal.Decoder in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.Decoder.pas',
  ZXing.QrCode.Internal.ErrorCorrectionLevel in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.ErrorCorrectionLevel.pas',
  ZXing.QrCode.Internal.FormatInformation in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.FormatInformation.pas',
  ZXing.QrCode.Internal.Mode in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.Mode.pas',
  ZXing.QrCode.Internal.QRCodeDecoderMetaData in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.QRCodeDecoderMetaData.pas',
  ZXing.QrCode.Internal.Version in '..\ESTOQUE MOBILE\ZXing.Delphi-v_3.0\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.Version.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmCamera, frmCamera);
  Application.Run;
end.

