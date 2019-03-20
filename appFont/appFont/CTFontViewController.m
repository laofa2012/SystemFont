//
//  CTFontViewController.m
//  appFont
//
//  Created by Yuanhai on 15/3/19.
//  Copyright © 2019年 Yuanhai. All rights reserved.
//

#import "CTFontViewController.h"

@interface CTFontViewController ()

@end

@implementation CTFontViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"具体样式";
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.width)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"abc&123?ABC?字体!";
    label.font = [UIFont fontWithName:self.fontStr size:30.0f];
    label.center = self.view.center;
    NSLog(@"字体的字符串:%@" , self.fontStr);
    [self.view addSubview:label];
}

@end
