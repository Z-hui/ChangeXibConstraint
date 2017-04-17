//
//  ChangeWidthMultiplierTableViewCell.h
//  ChangeXibConstraint
//
//  Created by HSEDU on 17/4/17.
//  Copyright © 2017年 HSEDU. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ChangeWidthMultiplierTableViewCellDelegate <NSObject>
-(void)ChangeWidthMultiplierTableViewCellChangeAction:(NSIndexPath *)indexPath Value:(NSString *)value;
@end
@interface ChangeWidthMultiplierTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthMultiplierConstraint;
@property (weak, nonatomic) IBOutlet UIButton *changeButton;
@property (strong,nonatomic) NSLayoutConstraint *ConstraintNew;
@property (assign,nonatomic) CGFloat multiplierValue;
@property (strong,nonatomic) NSIndexPath *indexPath;
@property (assign,nonatomic) id <ChangeWidthMultiplierTableViewCellDelegate> delegate;
@end
