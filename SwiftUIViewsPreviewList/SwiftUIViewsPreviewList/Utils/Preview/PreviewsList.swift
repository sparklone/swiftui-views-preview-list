//
//  PreviewsList.swift
//  SwiftUIAndCombine
//
//  Created by Alexandr Glushchenko on 21.07.2020.
//  Copyright © 2020 SparkLone. All rights reserved.
//

import SwiftUI

struct PreviewsList: View {

    @State private var starred: [PreviewHolder.Type] = []

    @State private var general: [PreviewHolder.Type] = []

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Starred")) {
                    SubList(elements: starred)
                }
                Section(header: Text("General")) {
                    SubList(elements: general)
                }
            }.navigationBarTitle("Catalog")
                .onAppear {
                    let sorted = PreviewUtils.parse().sorted(by: { (lhs, rhs) -> Bool in
                        lhs.name < rhs.name
                    })
                    self.starred = sorted.filter { $0.starred }
                    self.general = sorted.filter { !$0.starred }
            }
        }
    }
}

private struct SubList: View {
    var elements: [PreviewHolder.Type]
    var body: some View {
        ForEach(0..<elements.count, id: \.self) { id in
            return NavigationLink(destination: self.elements[id].anyPreviews) {
                Text(self.elements[id].name)
            }
        }
    }
}

struct PreviewsList_Previews: PreviewProvider {
    static var previews: some View {
        PreviewsList()
    }
}
