#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNPerthLocationHelper : NSObject

@property (nonatomic, copy) NSString* addressName;

+ (instancetype)initManager;
+ (NSString *)isOpenLocation;
+ (NSString *)fetchWeizhiStatus;
+ (NSString *)checkIfFileExists:(NSString *)path;
- (void)openWeizhi;

@end

NS_ASSUME_NONNULL_END
