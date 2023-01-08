//
//  DataStore.swift
//  Magasinage
//
//  Created by Artem Lapov on 07.01.2023.
//

import Foundation

class DataStore {

    static let shared = DataStore()

    let taskTexts = ["Хлеб", "Молоко", "Свинина", "Окорок", "Чипсы", "Водка", "Соль", "Хлеб", "Молоко", "Свинина", "Окорок", "Чипсы", "Водка", "Соль"]

    private init() {}
}
