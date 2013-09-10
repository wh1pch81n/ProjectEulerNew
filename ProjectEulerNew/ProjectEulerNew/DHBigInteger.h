//
//  DHBigInteger.h
//  ProjectEulerNew
//
//  Created by Derrick Ho on 8/22/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DHBigInteger : NSObject {
	NSMutableArray *_bigNumber;
}
- (id)initWithNumber:(NSInteger)num;
//- (id)initByAddingBigInteger1:(DHBigInteger *)num1 withBigInteger:(DHBigInteger *)num2;
- (DHBigInteger *)plus:(DHBigInteger *)b;
//- (id)initByMultiplyingBigInteger1:(DHBigInteger *)num1 withBigInteger:(DHBigInteger *)num2;
- (NSString *)stringFromBigInteger;
- (NSUInteger)numDigits;
- (NSUInteger)digitAtIndex:(NSUInteger)index;
@end
