//
//  Collection+SafeSubscript.swift
//  MyViews
//
//  Created by Uriel Barbosa Pinheiro on 03/10/21.
//

import Foundation

extension Collection {

    // Source: https://stackoverflow.com/a/30593673/9038924
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
