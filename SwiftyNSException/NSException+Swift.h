//
//  NSException+Swift.h
//  SwiftyNSException
//
//  Created by Sergej Jaskiewicz on 22.05.2017.
//  Copyright © 2017 Sergej Jaskiewicz. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Executes the block and returns whether its result if no exceptions
 * have been thrown.
 *
 * @param block  A block that can throw an exception.
 * @param caught The pointer to an exception if it has been thrown.
 *               Otherwise `nil`.
 * @return       The result of executing the provided `block`.
 */
id _Nonnull _tryBlock(_Nonnull __attribute__((noescape)) id(^ _Nonnull block)(void),
                                NSException * _Nullable * _Nullable caught);
