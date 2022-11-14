#import "RNPerthLocation.h"
#import <React/RCTUIManager.h>
#import "RNPerthLocationHelper.h"

@implementation RNPerthLocation

RCT_EXPORT_MODULE(LocationManager);

RCT_EXPORT_METHOD(getStartWeiZhi)
{
  [[RNPerthLocationHelper shareInstance] start];
}

RCT_EXPORT_METHOD(getAddressNameWithcallback:(RCTResponseSenderBlock)callback)
{
  callback(@[[NSNull null],[RNPerthLocationHelper shareInstance].palceName]);
}

RCT_EXPORT_METHOD(checkOpenLocation:(RCTResponseSenderBlock)callback)
{
  callback(@[[NSNull null],[RNPerthLocationHelper isOpenLocation],[RNPerthLocationHelper fetchLocationStatus]]);
}

RCT_EXPORT_METHOD(checkFileExistsWithVideoPath:(NSString *)videoPath ImagePath:(NSString *)imagePath callback:(RCTResponseSenderBlock)callback)
{
  callback(@[[NSNull null],[RNPerthLocationHelper checkWhenFileExit:videoPath],[RNPerthLocationHelper checkWhenFileExit:imagePath]]);
}

@end
