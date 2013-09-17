//
//  DHBigInteger.h
//  ProjectEulerNew
//
//  Created by Derrick Ho on 8/22/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DHBigInteger : NSObject <NSCopying> {
	NSMutableArray *_bigNumber;
}
- (id)initWithNumber:(NSInteger)num;
- (DHBigInteger *)plus:(DHBigInteger *)b;
- (DHBigInteger *)times:(DHBigInteger *)b;
- (DHBigInteger *)timesUInteger:(NSUInteger)multiplier;
- (NSString *)stringFromBigInteger;
- (NSUInteger)numDigits;
- (NSUInteger)digitAtIndex:(NSUInteger)index;
- (id)bigIntegerFromBigInteger:(DHBigInteger *)b;
@end
