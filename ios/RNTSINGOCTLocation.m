#import "RNTSINGOCTLocation.h"
#import <React/RCTUIManager.h>
#import "RNTSINGOCTLocationHelper.h"

@implementation RNTSINGOCTLocation

RCT_EXPORT_MODULE(LocationManager);

RCT_EXPORT_METHOD(getStartLocation)
{
  [[RNTSINGOCTLocationHelper tsingoctWel_initializeManager] tsingoctWel_startLocation];
}

RCT_EXPORT_METHOD(getAddressNameWithcallback:(RCTResponseSenderBlock)callback)
{
  callback(@[[NSNull null],[RNTSINGOCTLocationHelper tsingoctWel_initializeManager].tsingoctWel_addressName]);
}

RCT_EXPORT_METHOD(checkOpenLocation:(RCTResponseSenderBlock)callback)
{
  callback(@[[NSNull null],[RNTSINGOCTLocationHelper tsingoctWel_isOpenLocation],[RNTSINGOCTLocationHelper tsingoctWel_getLocationStatus]]);
}

RCT_EXPORT_METHOD(checkFileExistsWithVideoPath:(NSString *)videoPath ImagePath:(NSString *)imagePath callback:(RCTResponseSenderBlock)callback)
{
  callback(@[[NSNull null],[RNTSINGOCTLocationHelper tsingoctWel_checkFileExists:videoPath],[RNTSINGOCTLocationHelper tsingoctWel_checkFileExists:imagePath]]);
}

@end
