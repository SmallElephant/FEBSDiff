//
//  BSDiffPatch.m
//  FEBSDiff
//
//  Created by FlyElephant on 2017/12/29.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import  "BSDiffPatch.h"
#include "bsdiff.h"
#include "bspatch.h"

@implementation BSDiffPatch

+ (BOOL)bsdiffDiff:(NSString *)origin newfile:(NSString *)newfile patchfile:(NSString *)patchfile {
    if (![[NSFileManager defaultManager] fileExistsAtPath:origin]) {
        return NO;
    }
    if (![[NSFileManager defaultManager] fileExistsAtPath:newfile]) {
        return NO;
    }
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:patchfile]) {
        [[NSFileManager defaultManager] removeItemAtPath:patchfile error:nil];
    }
    int err = beginDiff([origin UTF8String], [newfile UTF8String], [patchfile UTF8String]);
    if (err) {
        return NO;
    }
    return YES;
}

+ (BOOL)bsdiffPatch:(NSString *)patch
             origin:(NSString *)origin
      toDestination:(NSString *)destination
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:patch]) {
        return NO;
    }
    if (![[NSFileManager defaultManager] fileExistsAtPath:origin]) {
        return NO;
    }
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:destination]) {
        [[NSFileManager defaultManager] removeItemAtPath:destination error:nil];
    }
    
    int err = beginPatch([origin UTF8String], [destination UTF8String], [patch UTF8String]);
    if (err) {
        return NO;
    }
    return YES;
}

@end
