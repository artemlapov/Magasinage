//
//  Task.swift
//  Magasinage
//
//  Created by Artem Lapov on 07.01.2023.
//

import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    let taskText: String
    var isCompleted: Bool
    var quantity: Int = 1

    static func getTasks() -> [Task] {
        var tasks: [Task] = []
        let iterations = DataStore.shared.taskTexts.count

        for index in 0..<iterations {
            tasks.append(Task(taskText:
                                DataStore.shared.taskTexts[index],
                              isCompleted: Bool(.random()),
                              quantity: Int.random(in: 1...10)))
        }
        return tasks
    }

    static func getTask() -> Task {
        Task.getTasks()[0]
    }
}

//enum Division: String, CaseIterable {
//    case pending = "En cours"
//    case completed = "Terminé"
//}
//
