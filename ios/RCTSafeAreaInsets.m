#import <React/RCTBridge.h>
#import <React/RCTUIManager.h>

#import "RCTSafeAreaInsets.h"

@implementation RCTSafeAreaInsets {
  __weak RCTBridge *_bridge;
  UIEdgeInsets _currentSafeAreaInsets;
  bool _didMove;
}

- (instancetype)initWithBridge:(RCTBridge *)bridge
{
  if (self = [super initWithFrame:CGRectZero]) {
    _bridge = bridge;
  }

  return self;
}

RCT_NOT_IMPLEMENTED(- (instancetype)initWithCoder:(NSCoder *)decoder)
RCT_NOT_IMPLEMENTED(- (instancetype)initWithFrame:(CGRect)frame)

#if defined(__IPHONE_OS_VERSION_MAX_ALLOWED) && __IPHONE_OS_VERSION_MAX_ALLOWED >= 110000 /* __IPHONE_11_0 */

static BOOL UIEdgeInsetsEqualToEdgeInsetsWithThreshold(UIEdgeInsets insets1, UIEdgeInsets insets2, CGFloat threshold) {
  return
  ABS(insets1.left - insets2.left) <= threshold &&
  ABS(insets1.right - insets2.right) <= threshold &&
  ABS(insets1.top - insets2.top) <= threshold &&
  ABS(insets1.bottom - insets2.bottom) <= threshold;
}

- (void)safeAreaInsetsDidChange
{
  if (![self respondsToSelector:@selector(safeAreaInsets)]) {
    return;
  }

  UIEdgeInsets safeAreaInsets = self.safeAreaInsets;

  if (UIEdgeInsetsEqualToEdgeInsetsWithThreshold(safeAreaInsets, _currentSafeAreaInsets, 1.0 / RCTScreenScale())) {
    return;
  }

  _currentSafeAreaInsets = safeAreaInsets;

  if (self.onSafeAreaInsetsChange) {
    self.onSafeAreaInsetsChange(@{
                                  @"insets": @{
                                      @"top": @(safeAreaInsets.top),
                                      @"right": @(safeAreaInsets.right),
                                      @"bottom": @(safeAreaInsets.bottom),
                                      @"left": @(safeAreaInsets.left),
                                      },
                                  });
  }
}

#endif

@end

