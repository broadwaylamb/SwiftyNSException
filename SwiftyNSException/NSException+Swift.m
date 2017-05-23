//
//  NSException+Swift.m
//  SwiftyNSException
//
//  Created by Sergej Jaskiewicz on 23.05.2017.
//  Copyright © 2017 Sergej Jaskiewicz. All rights reserved.
//

#import "NSException+Swift.h"

id _Nonnull _tryBlock(_Nonnull id(^ _Nonnull block)(void),
                                NSException * _Nullable * _Nullable caught) {
    @try {
        return block();
    }
    @catch (NSException *exception) {

        *caught = exception;
        return nil;
    }
}
