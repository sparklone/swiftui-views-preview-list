//
//  PreviewUtils.swift
//  SwiftUIAndCombine
//
//  Created by Alexandr Glushchenko on 21.07.2020.
//  Copyright © 2020 SparkLone. All rights reserved.
//

import Foundation

final class PreviewUtils {

    static func parse() -> [PreviewHolder.Type] {
        let allClassesCount = objc_getClassList(nil, 0)
        var allClasses = [AnyClass](repeating: NSObject.self, count: Int(allClassesCount))
        allClasses.withUnsafeMutableBufferPointer { buffer in
            let autoreleasingPointer = AutoreleasingUnsafeMutablePointer<AnyClass>(buffer.baseAddress)
            objc_getClassList(autoreleasingPointer, allClassesCount)
        }
        return allClasses.compactMap { $0 as? PreviewHolder.Type }
    }
    
}
