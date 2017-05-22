//
//  SwiftyNSExceptionTests.swift
//  SwiftyNSException
//
//  Created by Sergej Jaskiewicz on 22.05.2017.
//  Copyright © 2017 Sergej Jaskiewicz. All rights reserved.
//

import XCTest
import SwiftyNSException

class SwiftyNSExceptionTests : XCTestCase {

    func makeException() -> NSException {
        return NSException(name: .genericException,
                           reason: "Just an exception, nothing special")
    }

    class OrdinarySwiftClass : Equatable {

        let value: Int?

        init(_ value: Int?) {
            self.value = value
        }

        static func == (lhs: OrdinarySwiftClass,
                        rhs: OrdinarySwiftClass) -> Bool {

            return lhs.value == rhs.value
        }
    }

    enum OrdinarySwiftEnum : Equatable {
        case simpleCase
        case complexCase(Int?)

        static func == (lhs: OrdinarySwiftEnum,
                        rhs: OrdinarySwiftEnum) -> Bool {

            switch (lhs, rhs) {
            case (.simpleCase, .simpleCase):
                return true
            case (.complexCase(let lhs), .complexCase(let rhs)):
                return lhs == rhs
            default:
                return false
            }
        }
    }

    func testCatchNSExceptionInBlockReturningObjCClass() {

        let exception = makeException()

        let throwingBlock: () -> NSString = {
            throwObjCException(exception)
            return "Will not actually be returned."
        }

        do {

            _ = try handle(throwingBlock)

            XCTFail("Must never reach this point")

        } catch let caught as NSException {

            XCTAssertEqual(caught, exception)

        } catch {

            XCTFail("Must throw an NSException object")
        }
    }

    func testCatchNSExceptionInBlockReturningSwiftClass() {

        let exception = makeException()

        let throwingBlock: () -> OrdinarySwiftClass = {
            throwObjCException(exception)
            return OrdinarySwiftClass(0xDEADBEEF)
        }

        do {

            _ = try handle(throwingBlock)

            XCTFail("Must never reach this point")

        } catch let caught as NSException {

            XCTAssertEqual(caught, exception)

        } catch {

            XCTFail("Must throw an NSException object")
        }
    }

    func testCatchNSExceptionInBlockReturningSwiftEnum() {

        let exception = makeException()

        let throwingBlock: () -> OrdinarySwiftEnum = {
            throwObjCException(exception)
            return .complexCase(nil)
        }

        do {

            _ = try handle(throwingBlock)

            XCTFail("Must never reach this point")

        } catch let caught as NSException {

            XCTAssertEqual(caught, exception)

        } catch {
            
            XCTFail("Must throw an NSException object")
        }
    }

    func testGetResultOfBlockReturningObjCClass() {

        let expected: NSString = "Hello"

        let nonthrowingBlock: () -> NSString = {
            return expected
        }

        do {

            let returned = try handle(nonthrowingBlock)

            XCTAssertEqual(returned, expected)

        } catch {
            
            XCTFail("Must not throw")
        }
    }

    func testGetResultOfBlockReturningSwiftClass() {

        let expected = OrdinarySwiftClass(42)

        let nonthrowingBlock: () -> OrdinarySwiftClass = {
            return expected
        }

        do {

            let returned = try handle(nonthrowingBlock)

            XCTAssertEqual(returned, expected)

        } catch {

            XCTFail("Must not throw")
        }
    }

    func testGetResultOfBlockReturningSwiftEnum() {

        let expected = OrdinarySwiftEnum.complexCase(nil)

        let nonthrowingBlock: () -> OrdinarySwiftEnum = {
            return expected
        }

        do {

            let returned = try handle(nonthrowingBlock)

            XCTAssertEqual(returned, expected)

        } catch {
            
            XCTFail("Must not throw")
        }
    }
}
