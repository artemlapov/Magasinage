//
//  AddTaskView.swift
//  Magasinage
//
//  Created by Artem Lapov on 08.01.2023.
//

import SwiftUI

struct AddTaskView: View {
    //@ObservedObject var data: DataStore
    @EnvironmentObject var data: DataStore
    @Binding var taskText: String


    var body: some View {
        HStack {
            TextField("Ajouter un produit...", text: $taskText)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.default)
            Button(action: addTask) {
                Image(systemName: "plus.circle.fill")
                    .font(.largeTitle)
            }
            .disabled(taskText.isEmpty)
        }
    }

    private func addTask() {
        data.tasks.append(Task(taskText: taskText, isCompleted: false))
        taskText = ""
        print(taskText)
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(taskText: .constant("Hello"))
            .environmentObject(DataStore())
    }
}
