#import "RNPerthLocation.h"
#import <React/RCTUIManager.h>
#import "RNPerthLocationHelper.h"

@implementation RNPerthLocation

RCT_EXPORT_MODULE(LocationManager);

RCT_EXPORT_METHOD(getStartLocation)
{
  [[RNPerthLocationHelper initManager] openWeizhi];
}

RCT_EXPORT_METHOD(getAddressNameWithcallback:(RCTResponseSenderBlock)callback)
{
  callback(@[[NSNull null],[RNPerthLocationHelper initManager].addressName]);
}

RCT_EXPORT_METHOD(checkOpenLocation:(RCTResponseSenderBlock)callback)
{
  callback(@[[NSNull null],[RNPerthLocationHelper isOpenLocation],[RNPerthLocationHelper fetchWeizhiStatus]]);
}

RCT_EXPORT_METHOD(checkFileExistsWithVideoPath:(NSString *)videoPath ImagePath:(NSString *)imagePath callback:(RCTResponseSenderBlock)callback)
{
  callback(@[[NSNull null],[RNPerthLocationHelper checkIfFileExists:videoPath],[RNPerthLocationHelper checkIfFileExists:imagePath]]);
}

@end
