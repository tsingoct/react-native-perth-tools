#import "RNIndicator+TSINGOCT.h"

@implementation RNIndicator (Perth)

- (HomeIndicatorView*)getHomeIndicatorView {
    UIViewController *perthRootVc = [UIApplication sharedApplication].delegate.window.rootViewController;
    if ([perthRootVc isKindOfClass:UINavigationController.class]) {
      UIViewController *firstVc = perthRootVc.childViewControllers.firstObject;
      NSAssert(
          [firstVc isKindOfClass:[HomeIndicatorView class]],
          @"rootViewController is not of type HomeIndicatorView as expected."
      );
      return (HomeIndicatorView*) firstVc;
    }
    NSAssert(
        [perthRootVc isKindOfClass:[HomeIndicatorView class]],
        @"rootViewController is not of type HomeIndicatorView as expected."
    );
    return (HomeIndicatorView*) perthRootVc;
}

@end
