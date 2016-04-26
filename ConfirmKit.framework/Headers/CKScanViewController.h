#import <UIKit/UIKit.h>

@class CKOverlayView;

@protocol CKScannerDelegate;

@interface CKScanViewController : UIViewController

@property (nonatomic) id<CKScannerDelegate> delegate;
@property (nonatomic, strong) IBOutlet CKOverlayView *overlayView;
@property (strong, nonatomic) IBOutlet UIView *view;

//! @warn preferred instantiating factory call
+ (CKScanViewController*)controller;

@end
