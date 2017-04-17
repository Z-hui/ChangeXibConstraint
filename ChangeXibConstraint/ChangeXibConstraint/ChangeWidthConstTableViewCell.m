//
//  ChangeWidthConstTableViewCell.m
//  ChangeXibConstraint
//
//  Created by HSEDU on 17/4/17.
//  Copyright © 2017年 HSEDU. All rights reserved.
//

#import "ChangeWidthConstTableViewCell.h"

@implementation ChangeWidthConstTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    // Initialization code
}
- (IBAction)changeAction:(id)sender {
    self.delegate != nil?[self.delegate ChangeWidthConstTableViewCellChangeAction:self.indexPath Value:@"140"]:nil ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
