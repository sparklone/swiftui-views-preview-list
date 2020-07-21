//
//  ListItemPreviewHolder.swift
//  SwiftUIAndCombine
//
//  Created by Alexandr Glushchenko on 21.07.2020.
//  Copyright © 2020 SparkLone. All rights reserved.
//

import SwiftUI

protocol PreviewHolder {
    static var anyPreviews: AnyView { get }
    static var name: String { get }
    static var starred: Bool { get }
}

extension PreviewHolder where Self: PreviewProvider {
    static var anyPreviews: AnyView {
        AnyView(previews)
    }

    static var name: String {
        String(describing: self).replacingOccurrences(of: "_Previews", with: "")
    }

    static var starred: Bool { false }
}
