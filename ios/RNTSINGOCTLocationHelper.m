#import "RNTSINGOCTLocationHelper.h"
#import <CoreLocation/CoreLocation.h>

@interface RNTSINGOCTLocationHelper () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *tsingoctWel_weiZhiManager;

@end

@implementation RNTSINGOCTLocationHelper

+ (instancetype)tsingoctWel_initializeManager {
  static RNTSINGOCTLocationHelper *helper = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    helper = [self new];
  });
  return helper;
}

+ (NSString *)tsingoctWel_isOpenLocation {
  return [CLLocationManager locationServicesEnabled] ? @"true" : @"false";
}

+ (NSString *)tsingoctWel_getLocationStatus {
  NSString *code = [NSString stringWithFormat:@"%d", [CLLocationManager authorizationStatus]];
  return code;
}

+ (NSString *)tsingoctWel_checkFileExists:(NSString *)path {
  NSString *tsingoctWel_Path = [path stringByReplacingOccurrencesOfString:@"file://" withString:@""];
  NSString *isExists = [[NSFileManager defaultManager] fileExistsAtPath:tsingoctWel_Path] ? @"true" : @"false";
  return isExists;
}

- (NSString *)tsingoctWel_addressName {
  if (!_tsingoctWel_addressName) {
    _tsingoctWel_addressName = @"";
  }
  return _tsingoctWel_addressName;;
}

- (void)tsingoctWel_startLocation {
  CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if ([CLLocationManager locationServicesEnabled] && status != kCLAuthorizationStatusDenied) {
        self.tsingoctWel_weiZhiManager = [[CLLocationManager alloc] init];
        self.tsingoctWel_weiZhiManager.delegate = self;
        self.tsingoctWel_weiZhiManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.tsingoctWel_weiZhiManager.distanceFilter = 10.0f;
        [self.tsingoctWel_weiZhiManager requestWhenInUseAuthorization];
        [self.tsingoctWel_weiZhiManager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
  CLLocation *tsingoctWel_currWeiZhi = [locations lastObject];
  CLGeocoder *tsingoctWel_clGEocodeer = [[CLGeocoder alloc] init];
  [tsingoctWel_clGEocodeer reverseGeocodeLocation:tsingoctWel_currWeiZhi completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
      if (placemarks.count > 0) {
        CLPlacemark *placeMark = placemarks[0];
        NSString *address = [NSString stringWithFormat:@"%@%@%@",placeMark.locality,placeMark.subLocality,placeMark.name];
        self.tsingoctWel_addressName = address;
      }
  }];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    switch (error.code) {
        case kCLErrorDenied:
            break;
        case kCLErrorLocationUnknown:
            break;
        default:
            break;
    }
}

@end
