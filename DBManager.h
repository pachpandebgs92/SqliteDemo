//
//  DBManager.h
//  sqlite demo
//
//  Created by Student P_07 on 25/02/18.
//  Copyright © 2018 bgs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBManager : NSObject

+(DBManager *)getInstance;
+(BOOL)createTables;
+(BOOL)manupulationsIntoDatabase:(NSString *)strQuery;
+(NSArray *)fetchRecordFromDatabase:(NSString *)strQuery;

@end
