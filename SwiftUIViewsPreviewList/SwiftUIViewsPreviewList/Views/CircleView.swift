//
//  CircleView.swift
//  SwiftUIResearchList
//
//  Created by Alexandr Glushchenko on 21.07.2020.
//  Copyright © 2020 SparkLone. All rights reserved.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
        Circle()
    }
}

class CircleView_Previews: PreviewProvider, PreviewHolder {
    static var previews: some View {
        CircleView()
    }

    static var starred: Bool { true }
}
