//
//  ViewController.m
//  2042Game
//
//  Created by Rover on 4/8/15.
//  Copyright (c) 2015年 Rover. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


int god[4][4] = {
    0,0,0,0,
    0,0,0,0,
    0,0,0,0,
    0,0,0,0
};


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self produceNum];
    [self produceNum];
    [self reloadBtnValue];
    
    self.imagview.userInteractionEnabled = YES;
    
    
    UISwipeGestureRecognizer * swipe1 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe1Fun)];
    swipe1.direction = UISwipeGestureRecognizerDirectionUp;
    swipe1.delegate = self;
    [self.imagview addGestureRecognizer:swipe1];
    
    UISwipeGestureRecognizer * swipe2 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe2Fun)];
    swipe2.direction = UISwipeGestureRecognizerDirectionDown;
    swipe2.delegate = self;
    [self.imagview addGestureRecognizer:swipe2];
    
    UISwipeGestureRecognizer * swipe3 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe3Fun)];
    swipe3.direction = UISwipeGestureRecognizerDirectionLeft;
    swipe3.delegate = self;
    [self.imagview addGestureRecognizer:swipe3];
    
    UISwipeGestureRecognizer * swipe4 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe4Fun)];
    swipe4.direction = UISwipeGestureRecognizerDirectionRight;
    swipe4.delegate = self;
    [self.imagview addGestureRecognizer:swipe4];
}



- (void)swipe1Fun{
    convertArr(1);
    [self getNewValue:1];
    [self reloadBtnValue];
    [self produceNum];
    NSLog(@"上");
}

- (void)swipe2Fun{
    convertArr(2);
    [self getNewValue:2];
    [self reloadBtnValue];
    [self produceNum];
    NSLog(@"下");
}


- (void)swipe3Fun{
    convertArr(3);
    [self getNewValue:3];
    [self reloadBtnValue];
    [self produceNum];
    NSLog(@"左");
}


- (void)swipe4Fun{
    convertArr(4);
    [self getNewValue:4];
    [self reloadBtnValue];
    [self produceNum];
    NSLog(@"右");
}



- (void)produceNum{
    int i = 2;//arc4random()%3;
    if(i == 0)
        i++;
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for(int p = 0;p<16;p++){
        if(*((*god)+p) == 0){
            [arr addObject:[NSString stringWithFormat:@"%d",p]];
        }
    }
    
    if(arr.count == 0){
        NSLog(@"Game Over");
        return;
    }
    
    int len = arr.count;
    int j = arc4random()%(len);
    
    int result = [arr[j] intValue];
    
    
    UIButton *btn = (UIButton *)[self.view viewWithTag:result+1];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont fontWithName:@"Arial" size:35];
    *((*god)+result) = i;
    
    for(int i = 0;i<4;i++){
        for(int j = 0;j<4;j++){
            printf("%d  ",god[i][j]);
        }
        printf("\n");
    }
    printf("\n \n");
}


/**
 *  @author Rover
 *
 *  @brief  从新组合数组
 *
 *  @param direction 实现 上下左右 滑动
 */
void convertArr(int direction){
    int i = 0;
    
    if(direction == 1){                //上
        for(int i = 0;i<4;i++){
            int count = 0;
            int temp[4] = {0,0,0,0};
            for(int j = 0;j<4;j++){
                if(god[j][i] != 0){
                    temp[count++] = god[j][i];
                }
            }
            count = 0;
            for(int j = i;j<16;j+=4){
                *((*god)+j) = temp[count++];
            }
        }
    }
    
    if(direction == 2){                //下
        for(int i = 0;i<4;i++){
            int count = 3;
            int temp[4] = {0,0,0,0};
            for(int j = 3;j>=0;j--){
                if(god[j][i] != 0){
                    temp[count--] = god[j][i];
                }
            }
            count = 0;
            for(int j = i;j<16;j+=4){
                *((*god)+j) = temp[count++];
            }
        }
    }
    
    
    if(direction == 3){
        for(i = 0;i<4;i++){             //左
            int count = 0;
            int temp[4] = {0,0,0,0};
            for(int j = 0;j<4;j++){
                if(god[i][j] != 0){
                    temp[count++] = god[i][j];
                }
            }
            count = 0;
            for(int j = 4*i;j<4*(i+1);j++){
                *((*god)+j) = temp[count++];
            }
        }
    }
    
    if(direction == 4){
        for(int i = 0;i<4;i++){             //右
            int count = 3;
            int temp[4] = {0,0,0,0};
            for(int j = 3;j>=0;j--){
                if(god[i][j] != 0){
                    temp[count--] = god[i][j];
                }
            }
            count = 0;
            for(int j = 4*i;j<4*(i+1);j++){
                *((*god)+j) = temp[count++];
            }
        }
    }
    
    for(int i = 0;i<4;i++){
        for(int j = 0;j<4;j++){
            printf("%d  ",god[i][j]);
        }
        printf("\n");
    }
    printf("\n\n");
}


//重新给UIbutton设置值
- (void)reloadBtnValue{
    for(int i = 0;i<16;i++){
        UIButton *btn = (UIButton *)[self.view viewWithTag:(i+1)];
        int value = *((*god)+i);
        if(value != 0){
            [btn setTitle:[NSString stringWithFormat:@"%d",value] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont fontWithName:@"Arial" size:35];
        }
        else
            [btn setTitle:@"" forState:UIControlStateNormal];
    }
}


//把相邻相等的值相加（上下左右四个方向）
- (void)getNewValue:(int)direction{
    if(direction == 1){    //上
        for(int i=0;i<4;i++){
            int temp[5] = {0,0,0,0,0};
            for(int j=0;j<4;j++){
                temp[j] = god[j][i];
            }
            for(int k=0;k<4;k++){
                if((temp[k] == temp[k+1]) && (temp[k] != 0)){
                    int v = temp[k] + temp[k+1];
                    temp[k] = v;
                    for(int j=k+1;j<4;j++){
                        temp[j] = temp[j+1];
                    }
                    k++;
                }
            }
            int count = 0;
            for(int j = i;j<16;j+=4){
                *((*god)+j) = temp[count++];
            }
        }
    }
    
    if(direction == 2){    //下
        for(int i=0;i<4;i++){
            int temp[5] = {0,0,0,0,0};
            for(int j=3;j>=0;j--){
                temp[j] = god[j][i];
            }
            for(int k=3;k>0;k--){
                if((temp[k] == temp[k-1]) && (temp[k] != 0)){
                    int v = temp[k] + temp[k-1];
                    temp[k] = v;
                    for(int j=k-1;j>0;j--){
                        temp[j] = temp[j-1];
                    }
                    temp[0] = 0;
                    k--;
                }
            }
            int count = 3;
            for(int j = 4*3+i;j>=0;j-=4){
                *((*god)+j) = temp[count--];
            }
        }
    }
    
    if(direction == 3){    //左
        for(int i=0;i<4;i++){
            int temp[5] = {0,0,0,0,0};
            for(int j=0;j<4;j++){
                temp[j] = god[i][j];
            }
            for(int k=0;k<4;k++){
                if((temp[k] == temp[k+1]) && (temp[k] != 0)){
                    int v = temp[k] + temp[k+1];
                    temp[k] = v;
                    for(int j=k+1;j<4;j++){
                        temp[j] = temp[j+1];
                    }
                    k++;
                }
            }
            int count = 0;
            for(int j = 4*i;j<4*(i+1);j++){
                *((*god)+j) = temp[count++];
            }
        }
    }
    if(direction == 4){    //右
        for(int i=0;i<4;i++){
            int temp[5] = {0,0,0,0,0};
            for(int j=3;j>=0;j--){
                temp[j] = god[i][j];
            }
            for(int k=3;k>=0;k--){
                if((temp[k] == temp[k-1]) && (temp[k] != 0)){
                    int v = temp[k] + temp[k-1];
                    temp[k] = v;
                    for(int j=k-1;j>0;j--){
                        temp[j] = temp[j-1];
                    }
                    temp[0] = 0;
                    k--;
                }
            }
            int count = 3;
            for(int j = 4*(i+1)-1;j>=4*(i);j--){
                *((*god)+j) = temp[count--];
            }
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClicked:(id)sender {
    //
}


- (IBAction)btn1Clicked:(id)sender {
    convertArr(1);
    [self getNewValue:1];
    [self reloadBtnValue];
    [self produceNum];
}

- (IBAction)btn2Clicked:(id)sender {
    convertArr(2);
    [self getNewValue:2];
    [self reloadBtnValue];
    [self produceNum];
}

- (IBAction)btn3Clicked:(id)sender {
    convertArr(3);
    [self getNewValue:3];
    [self reloadBtnValue];
    [self produceNum];
    
}

- (IBAction)btn4Clciked:(id)sender {
    convertArr(4);
    [self getNewValue:4];
    [self reloadBtnValue];
    [self produceNum];
}

- (IBAction)btn5Clicked:(id)sender {
    for(int i=0;i<4;i++){
        for(int j=0;j<4;j++){
            god[i][j] = 0;
        }
    }
    [self produceNum];
    [self produceNum];
    [self reloadBtnValue];
}




@end

