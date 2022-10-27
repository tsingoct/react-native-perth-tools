#import "RNPerthQRScReader.h"
#import <CoreImage/CoreImage.h>
#import <AVFoundation/AVFoundation.h>

@implementation RNPerthQRScReader

RCT_EXPORT_MODULE(RNPerthQRScReader);

RCT_EXPORT_METHOD(perth_readerQR:(NSString *)fileUrl perth_success:(RCTPromiseResolveBlock)success perth_failure:(RCTResponseErrorBlock)failure){
  dispatch_sync(dispatch_get_main_queue(), ^{
    NSString *qrCodeRead = [self loadQRCodeWithImage:fileUrl];
    if(qrCodeRead){
      success(qrCodeRead);
    }else{
      NSDictionary *qrCodeInfo = @{ NSLocalizedDescriptionKey: NSLocalizedString(@"没有相关二维码", @"") };
      NSError *error = [NSError errorWithDomain:@"com.perth" code:404 userInfo:qrCodeInfo];
      failure(error);
    }
  });
}

-(NSString*)loadQRCodeWithImage:(NSString*)imageUrl{
    imageUrl = [imageUrl stringByReplacingOccurrencesOfString:@"file://" withString:@""];
    CIDetector *detec = [CIDetector detectorOfType:CIDetectorTypeQRCode
                                                            context:[CIContext contextWithOptions:nil]
                                                            options:@{CIDetectorAccuracy:CIDetectorAccuracyHigh}];
    NSData *qrCodeData = [[NSData alloc] initWithContentsOfFile:imageUrl];
    NSArray *qrCodeFeatures = [detec featuresInImage:[CIImage imageWithData:qrCodeData]];
    if(!qrCodeFeatures || qrCodeFeatures.count==0){
      return nil;
    }
    return ((CIQRCodeFeature *)[qrCodeFeatures objectAtIndex:0]).messageString;
}

@end
