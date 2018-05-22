#import <React/RCTUIManager.h>

#import "RCTSafeAreaInsets.h"

#import "RCTSafeAreaInsetsManager.h"

@implementation RCTSafeAreaInsetsManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
  return [[RCTSafeAreaInsets alloc] initWithBridge:self.bridge];
}

RCT_EXPORT_VIEW_PROPERTY(onSafeAreaInsetsChange, RCTBubblingEventBlock);

@end
