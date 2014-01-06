//
//  NameScores.h
//  ProjectEulerNew
//
//  Created by Derrick Ho on 10/2/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Problem 22
 Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
 
 For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.
 
 What is the total of all the name scores in the file?
 */

@interface NameScores : NSObject
+ (NSArray *)arrayOfNamesFromFile:(NSString *)fileName willSort:(BOOL)sort;
+ (NSInteger)calcTotalScore:(NSArray *) arr;
@end
