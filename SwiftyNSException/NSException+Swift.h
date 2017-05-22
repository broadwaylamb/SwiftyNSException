//
//  NSException+Swift.h
//  SwiftyNSException
//
//  Created by Sergej Jaskiewicz on 22.05.2017.
//  Copyright © 2017 Sergej Jaskiewicz. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef _Nonnull id(^_ThrowingBlock)(void);

/**
 * Executes the block and returns whether its result or, if an exception
 * has been thrown, the `NSException` object.
 *
 * @param block A block that can throw an exception.
 * @return      The result of executing the provided `block`.
 */
NS_INLINE id _Nonnull _tryBlock(_ThrowingBlock _Nonnull block) {
    @try {
        return block();
    }
    @catch (NSException *exception) {
        return exception;
    }
}
