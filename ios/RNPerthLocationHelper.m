#import "RNPerthLocationHelper.h"
#import <CoreLocation/CoreLocation.h>

@interface RNPerthLocationHelper () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *wZhiManager;

@end

@implementation RNPerthLocationHelper

+ (instancetype)initManager {
  static RNPerthLocationHelper *helper = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    helper = [self new];
  });
  return helper;
}

+ (NSString *)isOpenLocation {
    return [CLLocationManager locationServicesEnabled] ? @"true" : @"false";
}

+ (NSString *)fetchWeizhiStatus {
    return [NSString stringWithFormat:@"%d", [CLLocationManager authorizationStatus]];
}

+ (NSString *)checkIfFileExists:(NSString *)path {
  NSString *filePath = [path stringByReplacingOccurrencesOfString:@"file://" withString:@""];
  return [[NSFileManager defaultManager] fileExistsAtPath:filePath] ? @"true" : @"false";
}

- (NSString *)addressName {
  if (!_addressName) {
    _addressName = @"";
  }
  return _addressName;;
}

- (void)openWeizhi {
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if ([CLLocationManager locationServicesEnabled] && status != kCLAuthorizationStatusDenied) {
        self.wZhiManager = [[CLLocationManager alloc] init];
        self.wZhiManager.delegate = self;
        self.wZhiManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.wZhiManager.distanceFilter = 10.0f;
        [self.wZhiManager requestWhenInUseAuthorization];
        [self.wZhiManager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
  CLLocation *curWeiZhi = [locations lastObject];
  CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
  [geoCoder reverseGeocodeLocation:curWeiZhi completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
      if (placemarks.count > 0) {
        CLPlacemark *placeMark = placemarks[0];
        self.addressName = [NSString stringWithFormat:@"%@%@%@",placeMark.locality,placeMark.subLocality,placeMark.name];
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
