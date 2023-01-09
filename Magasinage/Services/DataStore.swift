//
//  DataStore.swift
//  Magasinage
//
//  Created by Artem Lapov on 07.01.2023.
//

import Foundation

//class DataStore {
//
//    static let shared = DataStore()
//
//    let taskTexts = ["Хлеб", "Молоко", "Свинина", "Окорок", "Чипсы", "Водка", "Соль", "Хлеб", "Молоко", "Свинина", "Окорок", "Чипсы", "Водка", "Соль"]
//
//    private init() {}
//}

class DataStore: ObservableObject {
    
    @Published var tasks = [Task]() {
        didSet {
            let encoder = JSONEncoder()

            if let encoded = try? encoder.encode(tasks) {
                UserDefaults.standard.set(encoded, forKey: "Tasks")
            }
        }
    }

    init() {
        if let tasks = UserDefaults.standard.data(forKey: "Tasks") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Task].self, from: tasks) {
                self.tasks = decoded
            }
        }
    }
    
}

