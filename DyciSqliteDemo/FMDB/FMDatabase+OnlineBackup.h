//
//  FMDatabase+OnlineBackup.h
//  HelloTalk_Binary
//
//  Created by zhuzhi on 14-6-23.
//  Copyright (c) 2014年 HT. All rights reserved.
//

#import "FMDatabase.h"

@interface FMDatabase (OnlineBackup)

- (BOOL)backupDbTo:(NSString *)name;

@end
