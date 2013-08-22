//
//  DHHalfAdder.h
//  ProjectEulerNew
//
//  Created by Derrick Ho on 8/18/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kBase 10
#define kExceptionNilNum @"NilNumberException"
#define kExceptionNilNumReason @"Number can not be nil"
#define kExceptionNumOutOfBounds @"NumberOutOfBoundsException"
#define kExceptionNumOutOfBoundsReason @" 0 <= Num <= 9"

@interface DHHalfAdderBase10 : NSObject {
	NSNumber *_numa;
	NSNumber *_numb;
	NSNumber *_solution;
	NSNumber *_cout;
}
@property (readonly) NSNumber *solution;
@property (readonly) NSNumber *cout;

- (id)initWithNumA:(NSNumber *)numa withNumB:(NSNumber *)numb;
- (NSNumber *)checkBoundsOfNum:(NSNumber *)num;
@end
