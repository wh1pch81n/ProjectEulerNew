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

@interface DHHalfAdderBase10 : NSObject
- (id)initWithNumA:(NSNumber *)numa withNumB:(NSNumber *)numb;
- (NSNumber *)checkBoundsOfNum:(NSNumber *)num;

@property (strong, nonatomic, getter = internalNumA, setter = internalSetNumA:) NSNumber *numa;
@property (strong, nonatomic, getter = internalNumB, setter = internalSetNumB:) NSNumber *numb;
@property (strong, nonatomic, setter = privateSetSolution:) NSNumber *solution;
@property (strong, nonatomic, setter = privateSetCout:) NSNumber *cout;
@end
