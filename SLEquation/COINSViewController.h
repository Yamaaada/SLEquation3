//
//  COINSViewController.h
//  SLEquation
//
//  Created by 山田悠加 on 2013/10/24.
//  Copyright (c) 2013年 Haruka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "COINSKeyboard.h"

@interface COINSViewController : UIViewController <COINSKeyboardDelegate>

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (weak, nonatomic) IBOutlet UILabel *displayLabel2;
@property (weak, nonatomic) IBOutlet COINSKeyboard *keyboard;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel2;
@property (weak, nonatomic) IBOutlet UILabel *correctTimes;

- (IBAction)createAction:(id)sender;
- (IBAction)calculateAction:(id)sender;

@end
