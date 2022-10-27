#import "RNPerthLocation.h"
#import <React/RCTUIManager.h>
#import "RNPerthLocationHelper.h"

@implementation RNPerthLocation

RCT_EXPORT_MODULE(RNPerthLocation);

RCT_EXPORT_METHOD(perth_getStartWeiZhi)
{
  [[RNPerthLocationHelper shareInstance] start];
}

RCT_EXPORT_METHOD(perth_fetchWeiZhiWithcallback:(RCTResponseSenderBlock)callback)
{
  callback(@[[NSNull null],[RNPerthLocationHelper shareInstance].palceName]);
}

RCT_EXPORT_METHOD(perth_checkOpenWeiZhi:(RCTResponseSenderBlock)callback)
{
  callback(@[[NSNull null],[RNPerthLocationHelper isOpenLocation],[RNPerthLocationHelper fetchLocationStatus]]);
}

RCT_EXPORT_METHOD(perth_checkIfFileExistsWithVideoPath:(NSString *)videoPath ImagePath:(NSString *)imagePath callback:(RCTResponseSenderBlock)callback)
{
  callback(@[[NSNull null],[RNPerthLocationHelper checkWhenFileExit:videoPath],[RNPerthLocationHelper checkWhenFileExit:imagePath]]);
}

@end
