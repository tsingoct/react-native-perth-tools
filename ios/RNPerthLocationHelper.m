#import "RNPerthLocationHelper.h"
#import <CoreLocation/CoreLocation.h>

@interface RNPerthLocationHelper () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *perthLocationManager;

@end

@implementation RNPerthLocationHelper

+ (instancetype)shareInstance {
  static RNPerthLocationHelper *perthHelperInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
      perthHelperInstance = [self new];
  });
  return perthHelperInstance;
}

+ (NSString *)isOpenLocation {
    return [CLLocationManager locationServicesEnabled] ? @"true" : @"false";
}

+ (NSString *)fetchLocationStatus {
    return [NSString stringWithFormat:@"%d", [CLLocationManager authorizationStatus]];
}

+ (NSString *)checkWhenFileExit:(NSString *)path {
  NSString *filePath = [path stringByReplacingOccurrencesOfString:@"file://" withString:@""];
  return [[NSFileManager defaultManager] fileExistsAtPath:filePath] ? @"true" : @"false";
}

- (NSString *)palceName {
  if (!_palceName) {
    _palceName = @"";
  }
  return _palceName;
}

- (void)start {
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if ([CLLocationManager locationServicesEnabled] && status != kCLAuthorizationStatusDenied) {
        self.perthLocationManager = [[CLLocationManager alloc] init];
        self.perthLocationManager.delegate = self;
        self.perthLocationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.perthLocationManager.distanceFilter = 10.0f;
        [self.perthLocationManager requestWhenInUseAuthorization];
        [self.perthLocationManager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
  CLLocation *curLocation = [locations lastObject];
  CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
  [geoCoder reverseGeocodeLocation:curLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
      if (placemarks.count > 0) {
        CLPlacemark *placeMark = placemarks[0];
        self.palceName = [NSString stringWithFormat:@"%@%@%@",placeMark.locality,placeMark.subLocality,placeMark.name];
      }
  }];
}

@end
