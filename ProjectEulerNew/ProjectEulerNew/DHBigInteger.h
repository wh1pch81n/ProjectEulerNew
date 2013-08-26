//
//  DHBigInteger.h
//  ProjectEulerNew
//
//  Created by Derrick Ho on 8/22/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DHBigInteger : NSObject {
	NSArray *_number;
}
- (id)initWithNumber:(NSNumber *)num;
- (id)initByAddingBigInteger1:(DHBigInteger *)num1 withBigInteger:(DHBigInteger *)num2;
//- (id)initByMultiplyingBigInteger1:(DHBigInteger *)num1 withBigInteger:(DHBigInteger *)num2;
- (NSString *)stringFromBigInteger;
@end
