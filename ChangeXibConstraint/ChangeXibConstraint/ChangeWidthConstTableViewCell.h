//
//  ChangeWidthConstTableViewCell.h
//  ChangeXibConstraint
//
//  Created by HSEDU on 17/4/17.
//  Copyright © 2017年 HSEDU. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ChangeWidthConstTableViewCellDelegate <NSObject>
-(void)ChangeWidthConstTableViewCellChangeAction:(NSIndexPath *)indexPath Value:(NSString *)value;
@end
@interface ChangeWidthConstTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonWidthConstraint;
@property (strong,nonatomic) NSIndexPath *indexPath;
@property (nonatomic,assign) id  <ChangeWidthConstTableViewCellDelegate> delegate;
@end
