//
//  DHHalfAdder.h
//  ProjectEulerNew
//
//  Created by Derrick Ho on 8/18/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DHHalfAdderBase10 : NSObject
- (id)initWithNumA:(NSNumber *)numa withNumB:(NSNumber *)numb;
@property (readonly) NSNumber *solution;
@property (readonly) NSNumber *cout;
@end
