//
//  ViewController.h
//  2042Game
//
//  Created by Rover on 4/8/15.
//  Copyright (c) 2015年 Rover. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>




@property (weak, nonatomic) IBOutlet UIButton *b1;
@property (weak, nonatomic) IBOutlet UIButton *b2;
@property (weak, nonatomic) IBOutlet UIButton *b3;
@property (weak, nonatomic) IBOutlet UIButton *b4;
@property (weak, nonatomic) IBOutlet UIButton *b5;
@property (weak, nonatomic) IBOutlet UIButton *b6;
@property (weak, nonatomic) IBOutlet UIButton *b7;
@property (weak, nonatomic) IBOutlet UIButton *b8;
@property (weak, nonatomic) IBOutlet UIButton *b9;
@property (weak, nonatomic) IBOutlet UIButton *b10;
@property (weak, nonatomic) IBOutlet UIButton *b11;
@property (weak, nonatomic) IBOutlet UIButton *b12;
@property (weak, nonatomic) IBOutlet UIButton *b13;
@property (weak, nonatomic) IBOutlet UIButton *b14;
@property (weak, nonatomic) IBOutlet UIButton *b15;
@property (weak, nonatomic) IBOutlet UIButton *b16;


- (IBAction)btnClicked:(id)sender;

- (IBAction)btn1Clicked:(id)sender;
- (IBAction)btn2Clicked:(id)sender;
- (IBAction)btn3Clicked:(id)sender;
- (IBAction)btn4Clciked:(id)sender;


- (IBAction)btn5Clicked:(id)sender;


@property (weak, nonatomic) IBOutlet UIImageView *imagview;





@end

