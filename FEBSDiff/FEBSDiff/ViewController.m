//
//  ViewController.m
//  FEBSDiff
//
//  Created by FlyElephant on 2017/12/28.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "ViewController.h"
#import "BSDiffPatch.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self diffTest];
    [self patchTest];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)getApplicationSupportDirectory {
    NSString *applicationSupportDirectory = [NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return applicationSupportDirectory;
}


- (void)diffTest {
    NSFileManager *filemanager = [NSFileManager defaultManager];
    NSLog(@"文件夹目录:%@", NSHomeDirectory());
    NSLog(@"support目录:%@",[self getApplicationSupportDirectory]);
    BOOL flag = [filemanager fileExistsAtPath:[self getApplicationSupportDirectory]];
    if (!flag) {
        [filemanager createDirectoryAtPath:[self getApplicationSupportDirectory] withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *originPath = [[[NSBundle mainBundle] URLForResource:@"origin" withExtension:@"jsbundle"] path];
    NSString *newPath = [[[NSBundle mainBundle] URLForResource:@"new" withExtension:@"jsbundle"] path];
    NSLog(@"原始文件的位置:%@",originPath);
    NSLog(@"新的文件的位置:%@",newPath);
    NSString *patchPath = [[self getApplicationSupportDirectory] stringByAppendingString:@"/patch_2017.jsbundle"];
    NSLog(@"patch文件中的路径:%@",patchPath);
//
//   [[NSFileManager defaultManager] createFileAtPath:patchPath contents:nil attributes:nil];
    BOOL result = [BSDiffPatch bsdiffDiff:originPath newfile:newPath patchfile:patchPath];
    if (result) {
        NSLog(@"差异包分离成功");
    } else {
        NSLog(@"差异包合并成功");
    }
}

- (void)patchTest {
    NSString *originPath = [[[NSBundle mainBundle] URLForResource:@"index.ios" withExtension:@"jsbundle"] path];
    NSString *patchPath = [[[NSBundle mainBundle] URLForResource:@"patch.ios" withExtension:@"jsbundle"] path];
    NSLog(@"原始文件的位置:%@",originPath);
    NSLog(@"增量的文件的位置:%@",patchPath);
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *desthPath = [documentDirectory stringByAppendingString:@"/patch_2018.jsbundle"];
    NSLog(@"patch文件中的路径:%@",desthPath);
    BOOL result = [BSDiffPatch beginPatch:patchPath origin:originPath toDestination:desthPath];
    if (result) {
        NSLog(@"差异包合并成功");
    } else {
        NSLog(@"差异包合并失败");
    }
}

@end
