#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNTSINGOCTLocationHelper : NSObject

@property (nonatomic, copy) NSString* tsingoctWel_addressName;

+ (instancetype)tsingoctWel_initializeManager;
+ (NSString *)tsingoctWel_isOpenLocation;
+ (NSString *)tsingoctWel_getLocationStatus;
+ (NSString *)tsingoctWel_checkFileExists:(NSString *)path;
- (void)tsingoctWel_startLocation;

@end

NS_ASSUME_NONNULL_END
