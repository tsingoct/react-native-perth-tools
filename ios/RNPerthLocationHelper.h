#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNPerthLocationHelper : NSObject

@property (nonatomic, copy) NSString* palceName;

+ (instancetype)shareInstance;
+ (NSString *)isOpenLocation;
+ (NSString *)fetchLocationStatus;
+ (NSString *)checkWhenFileExit:(NSString *)path;
- (void)start;

@end

NS_ASSUME_NONNULL_END
