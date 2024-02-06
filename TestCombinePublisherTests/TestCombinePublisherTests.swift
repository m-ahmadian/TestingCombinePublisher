//
//  TestCombinePublisherTests.swift
//  TestCombinePublisherTests
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-02-05.
//

import XCTest
import Combine
@testable import TestCombinePublisher

final class TestCombinePublisherTests: XCTestCase {

    private var cancellables = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        cancellables = []
    }
    
    func testEvenNumbersPublisher() {
        var values: [Int] = []
        
        let expectation = self.expectation(description: "Even Number Publisher has finished")
        
        let sut = evenNumbersPublisher()
        
        sut
            .sink { _ in
                expectation.fulfill()
            } receiveValue: { value in
                values.append(value)
            }
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 10)
        
        XCTAssert(values.allSatisfy { $0.isMultiple(of: 2) })
    }
    
    func testOddNumbersPublisher() {
        var values: [Int] = []
        
        let expectation = self.expectation(description: "Odd Number Publisher has finished")
        
        let sut = oddNumbersPublisher()
        
        sut
            .sink { _ in
                expectation.fulfill()
            } receiveValue: { value in
                values.append(value)
            }
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 10)
        
        XCTAssert(values.allSatisfy { $0 % 2 != 0 } )

    }
}


