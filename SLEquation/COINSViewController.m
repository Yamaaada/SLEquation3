//
//  COINSViewController.m
//  SLEquation
//
//  Created by 山田悠加 on 2013/10/24.
//  Copyright (c) 2013年 Haruka. All rights reserved.
//

/* 飯島
 編集、アドバイスを開始しました(Oct 30)
 
 */

#import "COINSViewController.h"
#import "Equation.h"

@interface COINSViewController ()

@end

@implementation COINSViewController

@synthesize displayLabel; // プロパティを.mファイルで使えるようにする
@synthesize keyboard;

@synthesize answerLabel;

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	srand(time(NULL)); //(応用)これはC言語の関数なのでnilではなく、NULLにします
    
	NSLog(@"n1 = %d", n1); //ログで何を表示しているか確認できるようにしましょう
	NSLog(@"n2 = %d", n2);
	NSLog(@"ans = %d", answer);
    
    NSArray *titles = @[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"OK", @"x"];
    NSString *outCharacters = @"0123456789ox";
    [keyboard updateButtonsWithRow:3 column:4 titles:titles outCharacters:outCharacters style:COINSKeyboardStyleBlackboard];
    keyboard.delegate = self;
    
    answerLabel.text = @"";
	
	/*
     // ラベルの名前に意味をもたせよう
     UILabel *answerLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 60)];
     answerLabel.font = [UIFont systemFontOfSize:60];
     answerLabel.text = [NSString stringWithFormat:@"%d", answer]; // x + n1 = n2 を表示したいよー
     answerLabel.textAlignment = NSTextAlignmentCenter;
     answerLabel.textColor = [UIColor redColor];
     [self.view addSubview:answerLabel];
	 */
}


- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)createAction:(id)sender {
	n1 = rand() % 50 + 1; // 演算子の前後にはスペースを入れると見やすいです
	n2 = rand() % 50 + 1;
	displayLabel.text = [NSString stringWithFormat:@"x + %d = %d", n1, n2];
}

- (IBAction)calculateAction:(id)sender {
	Equation *equation = [[Equation alloc] init];
	answer = [equation finishWithInteger:n1 WithInteger:n2];
	displayLabel.text = [NSString stringWithFormat:@"x = %d", answer];
}

- (void)input:(unichar)c {
    answerLabel.text = [answerLabel.text stringByAppendingFormat:@"%c", c];
}
@end
