//
//  AddTaskView.swift
//  Magasinage
//
//  Created by Artem Lapov on 08.01.2023.
//

import SwiftUI

struct AddTaskView: View {
   @State var taskText = ""

    var body: some View {
        HStack {
            Image(systemName: "circle.dotted")
            TextField("Ajouter un produit...", text: $taskText)
                .textFieldStyle(.roundedBorder)
            Button(action: addTask) {
                Image(systemName: "plus.circle.fill")
                    .font(.largeTitle)
                    .rotationEffect(.degrees(90))
            }
        }
    }

    private func addTask() {
        print(taskText)
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
