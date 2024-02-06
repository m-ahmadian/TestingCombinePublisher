//
//  Code.swift
//  TestCombinePublisher
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-02-05.
//

import Combine
import Foundation


func evenNumbersPublisher() -> some Publisher<Int, Never> {
    [2, 4, 6, 8, 10].publisher
}

func oddNumbersPublisher() -> some Publisher<Int, Never> {
    [2, 4, 6, 8, 10].publisher
}
