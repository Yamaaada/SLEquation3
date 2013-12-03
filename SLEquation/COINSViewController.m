//
//  COINSViewController.m
//  SLEquation
//
//  Created by 山田悠加 on 2013/10/24.
//  Copyright (c) 2013年 Haruka. All rights reserved.
//


#import "COINSViewController.h"
#import "Equation.h"


@implementation COINSViewController {
	// インスタンス変数にします
	NSInteger a, b, c ,target ,count , countOk, countAnswer; // intではなく、NSIntegerを用いると都合が良い
	NSInteger answerX, answerY;
    EquationY *equationY;
    EquationX *equationX;
}

@synthesize displayLabel,displayLabel2;

@synthesize keyboard,correctTimes;

@synthesize answerLabel,answerLabel2;

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	srand(time(NULL)); 
    
	NSLog(@"n1 = %d", a);
	NSLog(@"n2 = %d", b);
    NSLog(@"n3 = %d", c);
    NSLog(@"count = %d", count);
    NSLog(@"ansX = %d", answerX);
	NSLog(@"ansY = %d", answerY);
    
    NSArray *titles = @[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"OK", @"x"];
    NSString *outCharacters = @"0123456789ox";
    [keyboard updateButtonsWithRow:3 column:4 titles:titles outCharacters:outCharacters style:COINSKeyboardStyleBlackboard];
    keyboard.delegate = self;
    
    answerLabel.text = @"";
    answerLabel2.text = @"x = , y = ";
	
}


- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)createAction:(id)sender {
    countOk = 0;
	equationX = [[EquationX alloc] init];
    equationY = [[EquationY alloc] init];
    answerLabel.text = @"";
    answerLabel2.text = @"x = ";
    

    do {
        a = rand() % 50 + 1;
        b = rand() % 50 + 1;
        NSMutableArray *divisor = [NSMutableArray array];
        [divisor addObject:[NSNumber numberWithInt:1]];
        count = 1;
        for (int i = 1; b - a - i > 0; i++) {
            if (abs(b - a) % abs(b - a - i) == 0) {
                [divisor addObject:@(b - a - i + 1)];
                count++;
            }
        }
        target = rand() % count;
        c = [divisor[target] intValue];
    
    } while (c == 1);
    
    displayLabel.text = [NSString stringWithFormat:@"x + %dy = %d", c, b];
    displayLabel2.text = [NSString stringWithFormat:@"x + y = %d", a];
}

- (IBAction)calculateAction:(id)sender {
    answerX = [equationX finishWithInteger:a WithInteger:b WithInteger:c];
	answerY = [equationY finishWithInteger:a WithInteger:b WithInteger:c];
	answerLabel.text = [NSString stringWithFormat:@"x = %d, y = %d", answerX, answerY];
    if (answerLabel.text == answerLabel2.text) {
            countAnswer++;
    }
    correctTimes.text = [NSString stringWithFormat:@"%d", countAnswer];
    
}

- (void)input:(unichar)key {

    switch (key) {
        case 'o':
            countOk++;
            if (countOk == 1) {
            answerLabel2.text = [answerLabel2.text stringByAppendingString:@", y = "];
            } /*else if (countOk == 2) {
                [self calculateAction:わからん];
            }*/
            break;
        case 'x':
            if (answerLabel2.text.length > 0) {
                answerLabel2.text = [answerLabel2.text substringToIndex:answerLabel2.text.length - 1];
            }
            break;
            
        default:
            answerLabel2.text = [answerLabel2.text stringByAppendingFormat:@"%c", key];
            break;
    }
  
    
}


@end