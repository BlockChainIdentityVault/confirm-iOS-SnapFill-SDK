//
//  TwoTableCell.m
//  ConfirmDemo
//
//  Created by Greg on 5/10/16.
//  Copyright © 2016 Confirm. All rights reserved.
//

#import "TwoTableCell.h"

@interface TwoTableCell()
@property (weak, nonatomic) IBOutlet UIView *separator;

@end
@implementation TwoTableCell

- (void)awakeFromNib 
{	
	CGRect f = self.separator.frame;
	f.size.width = 0.5;
	self.separator.frame = f;
}

- (UIEdgeInsets)layoutMargins
{
    return UIEdgeInsetsZero;
}


@end
