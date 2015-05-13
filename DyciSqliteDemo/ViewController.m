//
//  ViewController.m
//  DyciSqliteDemo
//
//  Created by zhuzhi on 15/5/13.
//  Copyright (c) 2015年 ZZ. All rights reserved.
//

#import "ViewController.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	[self test];
}

- (void)test {
	NSString *dbPath = [NSString stringWithFormat:@"%@/Documents/test.sqlite",NSHomeDirectory()];
	
	if ([[NSFileManager defaultManager] fileExistsAtPath:dbPath]) {
		[[NSFileManager defaultManager] removeItemAtPath:dbPath error:NULL];
	}
	
	FMDatabase *database = [[FMDatabase alloc] initWithPath:dbPath];

	[self createTable:database];
	
	[database open];
	[database setUserVersion:1];
	[database close];

}

- (void)createTable:(FMDatabase *)database
{
	[database open];
	
	NSString *sql = @"CREATE TABLE IF NOT EXISTS USER ( \
	ID integer  NOT NULL  PRIMARY KEY AUTOINCREMENT DEFAULT 0, \
	USERID INTEGER DEFAULT 0, \
	USERNAME TEXT DEFAULT '')";
	
	[database executeUpdate:sql];
	
	[database close];
}

@end
