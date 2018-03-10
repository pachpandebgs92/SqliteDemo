//
//  DBManager.m
//  sqlite demo
//
//  Created by Student P_07 on 25/02/18.
//  Copyright © 2018 bgs. All rights reserved.
//

#import "DBManager.h"
static sqlite3 *sqlite;
static sqlite3_stmt *stmt;
static DBManager *sharedInstance=nil;

@implementation DBManager

+(DBManager *)getInstance{
    if (sharedInstance==nil) {
        sharedInstance=[[DBManager alloc] init];
        [DBManager createDatabase];
    }
    return sharedInstance;
}

+(NSString *)getDBPath{
    NSArray *arr=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *strPath=[arr objectAtIndex:0];
    NSString *strDBPath=[strPath stringByAppendingPathComponent:@"person.db"];
    return strDBPath;
}

+(BOOL)createDatabase{
    NSString *DBPath=[DBManager getDBPath];
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:DBPath]==NO) {
        const char *dbpath=[DBPath UTF8String];
        
        if (sqlite3_open(dbpath, &sqlite)==SQLITE_OK) {
            sqlite3_close(sqlite);//to close sqlite database. it is necessary to close database here
            [self createTables];
            return YES;
        }
    }
    return NO;
}

+(BOOL)createTables{
  NSString *DBPath=[DBManager getDBPath];
    const char *dbpath=[DBPath UTF8String];
    if (sqlite3_open(dbpath, &sqlite)==SQLITE_OK) {
        NSString *str=@"create table personDetails (id integer  primary key AUTOINCREMENT, name text, address text,city text)";
        const char *querys=[str UTF8String];
        char *error;
        if (sqlite3_exec(sqlite, querys, NULL, NULL, &error)==SQLITE_OK) {
            //sqlite3_exe to create table
            sqlite3_close(sqlite);
            return YES;
        }
    }
    return NO;
}

+(BOOL)manupulationsIntoDatabase:(NSString *)strQuery{
    NSString *DBPath=[DBManager getDBPath];
    const char *dbpath=[DBPath UTF8String];
    if (sqlite3_open(dbpath, &sqlite)==SQLITE_OK) {
        const char *query=[strQuery UTF8String];
        if (sqlite3_prepare_v2(sqlite, query, -1, &stmt, NULL)==SQLITE_OK) {
            if (sqlite3_step(stmt)==SQLITE_DONE) {
                sqlite3_close(sqlite);
                return YES;
            }
        }
    }
    return NO;
}

+(NSArray *)fetchRecordFromDatabase:(NSString *)strQuery{
    NSString *DBPath=[DBManager getDBPath];
    const char *dbpath=[DBPath UTF8String];
    if (sqlite3_open(dbpath, &sqlite)==SQLITE_OK) {
        const char *query=[strQuery UTF8String];
        if (sqlite3_prepare_v2(sqlite, query, -1, &stmt, NULL)==SQLITE_OK) {
            NSMutableArray *array=[[NSMutableArray alloc] init];
            while (sqlite3_step(stmt)==SQLITE_ROW) {
                //SQLITE_ROW= used when multiple statement executions
                // SQLITE_DONE= used when single statement executions
                //SQLITE_OK= to check database related executions
                NSString *name=[[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
                NSString *address=[[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
                NSString *city=[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(stmt, 3)];
                //sqlite3_column = to retrive data from perticluar statement according to column no
                int no=sqlite3_column_int(stmt, 0);
                NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
                [dict setValue:name forKey:@"name"];
                [dict setValue:address forKey:@"address"];
                [dict setValue:city forKey:@"city"];
                [dict setValue:[NSNumber numberWithInt:no] forKey:@"id"];
                [array addObject:dict];
            }
            sqlite3_close(sqlite);
            return array;
        }
    }
    return @[];
}

@end
