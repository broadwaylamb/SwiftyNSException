//
//  SwiftyNSException-Tests-BridgingHeader.h
//  SwiftyNSException
//
//  Created by Sergej Jaskiewicz on 22.05.2017.
//  Copyright © 2017 Sergej Jaskiewicz. All rights reserved.
//

#ifndef SwiftyNSException_Tests_BridgingHeader_h
#define SwiftyNSException_Tests_BridgingHeader_h

#import <Foundation/Foundation.h>

void throwObjCException(NSException * _Nonnull exception) {
    @throw exception;
}

#endif /* SwiftyNSException_Tests_BridgingHeader_h */
