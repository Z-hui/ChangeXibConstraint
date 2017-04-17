//
//  ChangeWidthMultiplierTableViewCell.m
//  ChangeXibConstraint
//
//  Created by HSEDU on 17/4/17.
//  Copyright © 2017年 HSEDU. All rights reserved.
//

#import "ChangeWidthMultiplierTableViewCell.h"
@implementation ChangeWidthMultiplierTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)changeAction:(id)sender {
    self.delegate != nil?[self.delegate ChangeWidthMultiplierTableViewCellChangeAction:self.indexPath Value:@"0.6"]:nil ;
}
-(void)setMultiplierValue:(CGFloat)multiplierValue
{
    if (multiplierValue == _multiplierValue) {
        return;
    }
    
    [self.contentView removeConstraint:self.widthMultiplierConstraint];//在父试图上将button的宽度约束删除
    [self.contentView removeConstraint:self.ConstraintNew];
    
    NSLayoutConstraint *myConstraint =[NSLayoutConstraint
                                       constraintWithItem:self.changeButton //子试图
                                       attribute:NSLayoutAttributeWidth //子试图的约束属性
                                       relatedBy:NSLayoutRelationEqual //属性间的关系
                                       toItem:self.contentView//相对于父试图
                                       attribute:NSLayoutAttributeWidth//父试图的约束属性
                                       multiplier:multiplierValue
                                       constant:0.0];// 固定距离
    self.ConstraintNew = myConstraint;
    [self.contentView addConstraint: myConstraint];//为button重新添加一个约束

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
