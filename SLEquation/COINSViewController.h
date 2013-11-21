//
//  COINSViewController.h
//  SLEquation
//
//  Created by 山田悠加 on 2013/10/24.
//  Copyright (c) 2013年 Haruka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface COINSViewController : UIViewController {
	// インスタンス変数にします
	NSInteger n1, n2; // intではなく、NSIntegerを用いると都合が良い
	NSInteger answer;
}

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

- (IBAction)createAction:(id)sender;
- (IBAction)calculateAction:(id)sender;

@end
