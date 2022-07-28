//
//  Wrapper.swift
//  SwiftyNSException
//
//  Created by Sergej Jaskiewicz on 22.05.2017.
//  Copyright © 2017 Sergej Jaskiewicz. All rights reserved.
//

extension NSException : Error {}

private func _handle(_ throwingBlock: () throws -> Any) throws -> Any {

    var exception: NSException?
    var error: Error?

    let result = _tryBlock({ () -> Any? in
        do {
            return try throwingBlock()
        } catch let _error {
            error = _error
            return nil
        }
    }, &exception)

    if let error = error {
        throw error
    }

    if let exception = exception {
        throw exception
    }

    return result
}

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
public func handle<T>(_ throwingBlock: () throws -> T) throws -> T {
    return try _handle(throwingBlock) as! T
}

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
public func handle<T>(_ throwingBlock: () throws -> T?) throws -> T? {
    return try _handle(throwingBlock) as? T
}
