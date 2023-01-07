//
//  TaskViewCell.swift
//  Magasinage
//
//  Created by Artem Lapov on 07.01.2023.
//

import SwiftUI

struct TaskViewCell: View {
    @Binding var task: Task

    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "circle.fill" : "circle")
                .foregroundColor(.accentColor)
                .onTapGesture { _ in
                    withAnimation {
                        task.isCompleted.toggle()
                    }
                }
            HStack {
                Text(task.taskText)
                Spacer()
                Text("\(task.quantity)")
            }
        }
    }
}

struct TaskViewCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskViewCell(task: .constant(Task(taskText: "hi", isCompleted: false, quantity: 3)))
    }
}