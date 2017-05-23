//
//  Wrapper.swift
//  SwiftyNSException
//
//  Created by Sergej Jaskiewicz on 22.05.2017.
//  Copyright © 2017 Sergej Jaskiewicz. All rights reserved.
//

extension NSException : Error {}

private func _handle(_ throwingBlock: @escaping () -> Any) throws -> Any {

    var caught: NSException?

    let result = _tryBlock(throwingBlock, &caught)

    if let caught = caught {
        throw caught
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
public func handle<T>(_ throwingBlock: @escaping () -> T) throws -> T {
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
public func handle<T>(_ throwingBlock: @escaping () -> T?) throws -> T? {
    return try _handle(throwingBlock) as? T
}
