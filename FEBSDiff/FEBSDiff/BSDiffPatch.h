//
//  BSDiffPatch.h
//  FEBSDiff
//
//  Created by FlyElephant on 2017/12/29.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSDiffPatch : NSObject

+ (BOOL)bsdiffDiff:(NSString *)origin
             newfile:(NSString *)newfile
      patchfile:(NSString *)patchfile;

+ (BOOL)beginPatch:(NSString *)patch
             origin:(NSString *)origin
      toDestination:(NSString *)destination;

@end
