#import <UIKit/UIKit.h>
#import <React/RCTView.h>

NS_ASSUME_NONNULL_BEGIN

@class RCTBridge;

@interface RCTSafeAreaInsets : RCTView

- (instancetype)initWithBridge:(RCTBridge *)bridge;

@property (nonatomic, copy) RCTBubblingEventBlock onSafeAreaInsetsChange;

@end

NS_ASSUME_NONNULL_END
