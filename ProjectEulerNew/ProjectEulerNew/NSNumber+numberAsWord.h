//
//  NSNumber+numberAsWord.h
//  ProjectEulerNew
//
//  Created by Derrick Ho on 8/26/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (numberAsWord)
/*brief: figures out the word form of a number.  bounds:(0, 9999)
 @param: "num" the number that will be converted
 */
- (NSString *)wordFormOfNumber;
- (NSString *)wordFormOfThousandsPlace;
- (NSString *)wordFormOfHundredsPlace;
- (NSString *)wordFormOfTensPlace;
- (NSString *)wordFormOfOnesPlace;
@end
