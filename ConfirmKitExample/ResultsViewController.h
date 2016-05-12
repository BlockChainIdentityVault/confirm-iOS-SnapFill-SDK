//
//  ResultsViewController.h
//  ConfirmKitExample
//
//  Created by Greg Peet on 5/11/16.
//
//

#import <UIKit/UIKit.h>

@class CKIdModel;

@interface ResultsViewController : UIViewController

@property (nonatomic, strong) CKIdModel *idModel;

+ (ResultsViewController*)controller;

@end
