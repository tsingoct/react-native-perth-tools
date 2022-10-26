#import "RNPerthLocation.h"
#import <React/RCTUIManager.h>
#import "RNPerthLocationHelper.h"

@implementation RNPerthLocation

RCT_EXPORT_MODULE(RNPerthLocation);

RCT_EXPORT_METHOD(perth_getStartWeiZhi)
{
  [[RNPerthLocationHelper initMgr] openWeizhi];
}

RCT_EXPORT_METHOD(perth_fetchWeiZhiWithcallback:(RCTResponseSenderBlock)callback)
{
  callback(@[[NSNull null],[RNPerthLocationHelper initMgr].weiZhiName]);
}

RCT_EXPORT_METHOD(perth_checkOpenWeiZhi:(RCTResponseSenderBlock)callback)
{
  callback(@[[NSNull null],[RNPerthLocationHelper isOpenWeiZhi],[RNPerthLocationHelper fetchWeizhiStatus]]);
}

RCT_EXPORT_METHOD(perth_checkIfFileExistsWithVideoPath:(NSString *)videoPath ImagePath:(NSString *)imagePath callback:(RCTResponseSenderBlock)callback)
{
  callback(@[[NSNull null],[RNPerthLocationHelper checkIfFileExists:videoPath],[RNPerthLocationHelper checkIfFileExists:imagePath]]);
}

@end
