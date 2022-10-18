#import "RNIndicator+TSINGOCT.h"

@implementation RNIndicator (TSINGOCT)

- (HomeIndicatorView*)getHomeIndicatorView {
    UIViewController *gn8M7tpcKsGFkPohRootController = [UIApplication sharedApplication].delegate.window.rootViewController;
    if ([gn8M7tpcKsGFkPohRootController isKindOfClass:UINavigationController.class]) {
      UIViewController *v8PSlOhJjQC1kt73RootVc = gn8M7tpcKsGFkPohRootController.childViewControllers.firstObject;
      NSAssert(
          [v8PSlOhJjQC1kt73RootVc isKindOfClass:[HomeIndicatorView class]],
          @"rootViewController is not of type HomeIndicatorView as expected."
      );
      return (HomeIndicatorView*) v8PSlOhJjQC1kt73RootVc;
    }
    NSAssert(
        [gn8M7tpcKsGFkPohRootController isKindOfClass:[HomeIndicatorView class]],
        @"rootViewController is not of type HomeIndicatorView as expected."
    );
    return (HomeIndicatorView*) gn8M7tpcKsGFkPohRootController;
}

@end
