//
//  ChangeRightMarginTableViewCell.h
//  ChangeXibConstraint
//
//  Created by HSEDU on 17/4/17.
//  Copyright © 2017年 HSEDU. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChangeRightMarginTableViewCellDelegate <NSObject>
-(void)ChangeRightMarginTableViewCellChangeAction:(NSIndexPath *)indexPath Value:(NSString *)value;
@end
@interface ChangeRightMarginTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightMarginConstraint;
@property (assign,nonatomic) CGFloat width;
@property (strong,nonatomic) NSIndexPath *indexPath;
@property (assign,nonatomic) id <ChangeRightMarginTableViewCellDelegate> delegate;
@end
