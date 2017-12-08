#import <UIKit/UIKit.h>

@class CSFOverlayView;
@protocol CSFScannerDelegate;

@interface CSFScanViewController : UIViewController

/**
 The delegate to be notified when an ID has successfully been scanned.
 */
@property (nonatomic, weak) id<CSFScannerDelegate> delegate;

@property (nonatomic, strong) IBOutlet CSFOverlayView *overlayView;

+ (CSFScanViewController*)controller;

@end
