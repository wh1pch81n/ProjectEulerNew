//
//  sieve_of_eratosthenes.h
//  sieve_of_eratosthenes
//
//  Created by Derrick Ho on 8/2/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DHsieveOfEratosthenes : NSObject
/** ---------------------------------------------------------------------------
 @brief An array of prime numbers up to a specified maximum
 @param (NSNumber *)maxNum => the upper bound in prime generation
 @return (NSArray *) => an array of prime numbers up to a specified maximum
 */
+ (NSArray *)generateSieveUpTo:(NSNumber *)maxNum;
/** ---------------------------------------------------------------------------
 @brief Largest Prime less than max number
 @param (NSNumber *)num => the upper bound in prime generation
 @return (NSNumber *) => the largest less than or equal to num
 */
+ (NSNumber *)getPrimeNumberLessThan:(NSNumber *)num;
@end
