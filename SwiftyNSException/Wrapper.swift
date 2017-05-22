//
//  Wrapper.swift
//  SwiftyNSException
//
//  Created by Sergej Jaskiewicz on 22.05.2017.
//  Copyright © 2017 Sergej Jaskiewicz. All rights reserved.
//

extension NSException : Error {}

/// Executes the `throwingBlock` and whether returns its result or,
/// if an exception has been thrown in an Objective-C invocation,
/// rethrows `NSException` as a Swift error.
///
/// - Parameter throwingBlock: A block that contains an invocation of an
///                            Objective-C method that can throw
///                            an `NSException`
///
/// - Returns: The result of calling `throwingBlock` assuming
///            no exceptions were thrown.
public func handle<T>(_ throwingBlock: @escaping () -> T) throws -> T {

    let result = _tryBlock(throwingBlock)

    switch result {
    case let exception as NSException:
        throw exception
    default:
        return result as! T
    }
}
