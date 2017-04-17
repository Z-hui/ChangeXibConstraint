//
//  ChangeRightMarginTableViewCell.m
//  ChangeXibConstraint
//
//  Created by HSEDU on 17/4/17.
//  Copyright © 2017年 HSEDU. All rights reserved.
//

#import "ChangeRightMarginTableViewCell.h"

@implementation ChangeRightMarginTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)changeAction:(id)sender {
    self.delegate != nil ? [self.delegate ChangeRightMarginTableViewCellChangeAction:self.indexPath Value:@"100"]:nil ;
   /* [UIView animateWithDuration:2 animations:^{
       [self layoutIfNeeded];
    }];
    */
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
