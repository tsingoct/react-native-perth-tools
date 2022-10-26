#import "RNPerthQRScReader.h"
#import <CoreImage/CoreImage.h>
#import <AVFoundation/AVFoundation.h>

@implementation RNPerthQRScReader

RCT_EXPORT_MODULE(RNPerthQRScReader);

RCT_EXPORT_METHOD(perth_readerQR:(NSString *)fileUrl perth_success:(RCTPromiseResolveBlock)success perth_failure:(RCTResponseErrorBlock)failure){
  dispatch_sync(dispatch_get_main_queue(), ^{
    NSString *pRead = [self perthReaderQR:fileUrl];
    if(pRead){
      success(pRead);
    }else{
      NSDictionary *pInfo = @{ NSLocalizedDescriptionKey: NSLocalizedString(@"没有相关二维码", @"") };
      NSError *error = [NSError errorWithDomain:@"com.perth" code:404 userInfo:pInfo];
      failure(error);
    }
  });
}

-(NSString*)perthReaderQR:(NSString*)fileUrl{
    fileUrl = [fileUrl stringByReplacingOccurrencesOfString:@"file://" withString:@""];
    CIDetector *detec = [CIDetector detectorOfType:CIDetectorTypeQRCode
                                                            context:[CIContext contextWithOptions:nil]
                                                            options:@{CIDetectorAccuracy:CIDetectorAccuracyHigh}];
    NSData *fileData = [[NSData alloc] initWithContentsOfFile:fileUrl];
    NSArray *features = [detec featuresInImage:[CIImage imageWithData:fileData]];
    if(!features || features.count==0){
      return nil;
    }
    return ((CIQRCodeFeature *)[features objectAtIndex:0]).messageString;
}

@end
