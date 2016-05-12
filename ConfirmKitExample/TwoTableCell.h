//
//  TwoTableCell.h
//  ConfirmDemo
//
//  Created by Greg on 5/10/16.
//  Copyright © 2016 Confirm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwoTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title1Label;
@property (weak, nonatomic) IBOutlet UILabel *value1Label;
@property (weak, nonatomic) IBOutlet UILabel *title2Label;
@property (weak, nonatomic) IBOutlet UILabel *value2Label;

@end
