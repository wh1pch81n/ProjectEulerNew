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

/*All subclasses are required to implemente these methods listed in protocol*/
@protocol DHAdder_protocol <NSObject>
@required
#pragma mark - sum of inputs
- (NSInteger)sumOfInputs;
@end

@interface DHHalfAdderBase10 : NSObject <DHAdder_protocol>{
	NSNumber *_numa;
	NSNumber *_numb;
}
- (id)initWithNumA:(NSNumber *)numa withNumB:(NSNumber *)numb;
- (NSNumber *)checkBoundsOfNum:(NSNumber *)num;
#pragma mark - outputs
- (NSNumber *)solution;
- (NSNumber *)cout;
@end

