//
//  NameScores.h
//  ProjectEulerNew
//
//  Created by Derrick Ho on 10/2/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NameScores : NSObject
+ (NSArray *)arrayOfNamesFromFile:(NSString *)fileName willSort:(BOOL)sort;
+ (NSInteger)calcTotalScore:(NSArray *) arr;
@end
