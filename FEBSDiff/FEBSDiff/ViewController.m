//
//  ViewController.m
//  FEBSDiff
//
//  Created by FlyElephant on 2017/12/28.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "ViewController.h"
#import "BSDiff.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self test];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)getApplicationSupportDirectory {
    NSString *applicationSupportDirectory = [NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return applicationSupportDirectory;
}

- (void)test {
    NSString *originPath = [[NSBundle mainBundle] URLForResource:@"origin" withExtension:@"jsbundle"];
    NSString *newPath = [[NSBundle mainBundle] URLForResource:@"new" withExtension:@"jsbundle"];
    NSLog(@"原始文件的位置:%@",originPath);
    NSLog(@"新的文件的位置:%@",newPath);
}

@end
