#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNPerthLocationHelper : NSObject

@property (nonatomic, copy) NSString* weiZhiName;

+ (instancetype)initMgr;
+ (NSString *)isOpenWeiZhi;
+ (NSString *)fetchWeizhiStatus;
+ (NSString *)checkIfFileExists:(NSString *)path;
- (void)openWeizhi;

@end

NS_ASSUME_NONNULL_END
