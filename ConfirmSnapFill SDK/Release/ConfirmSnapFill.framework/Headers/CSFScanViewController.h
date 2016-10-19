#import <UIKit/UIKit.h>

@class CSFOverlayView;

@protocol CSFScannerDelegate;

@interface CSFScanViewController : UIViewController

@property (nonatomic) id<CSFScannerDelegate> delegate;
@property (nonatomic, strong) IBOutlet CSFOverlayView *overlayView;

//! @warn preferred instantiating factory call
+ (CSFScanViewController*)controller;

@end
