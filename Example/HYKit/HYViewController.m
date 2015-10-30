//
//  HYViewController.m
//  HYKit
//
//  Created by yclzone on 10/29/2015.
//  Copyright (c) 2015 yclzone. All rights reserved.
//

#import "HYViewController.h"
#import "HYKit.h"

@interface HYViewController ()

@end

@implementation HYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"%@", [NSString md5StringWithString:@"yclzone"]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
