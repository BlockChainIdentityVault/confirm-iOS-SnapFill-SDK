//
//  ResultsViewController.h
//  ConfirmSnapFill Sample
//
//  Created by Greg Peet on 5/11/16.
//
//

#import <UIKit/UIKit.h>

@class CSFIdModel;

@interface ResultsViewController : UIViewController

@property (nonatomic, strong) CSFIdModel *idModel;

+ (ResultsViewController*)controller;

@end
