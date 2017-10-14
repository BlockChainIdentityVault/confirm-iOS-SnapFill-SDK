#import <UIKit/UIKit.h>

@class CSFOverlayView;
@protocol CSFScannerDelegate;

@interface CSFScanViewController : UIViewController

@property (nonatomic, assign) id<CSFScannerDelegate> delegate;

@property (nonatomic, strong) IBOutlet CSFOverlayView *overlayView;

+ (CSFScanViewController*)controller;

@end
