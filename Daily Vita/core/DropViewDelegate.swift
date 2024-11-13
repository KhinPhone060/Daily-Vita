//
//  DropViewDelegate.swift
//  Daily Vita
//
//  Created by Khin Phone Ei on 13/11/2024.
//

import SwiftUI

struct DropViewDelegate: DropDelegate {
    let destinationItem: Int
    @Binding var priority: [HealthConcernEntity]
    @Binding var draggedItem: Int?

    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }

    func performDrop(info: DropInfo) -> Bool {
        guard let draggedItem = draggedItem else { return false }

        // Find the index of the dragged item and destination item
        if let draggedIndex = priority.firstIndex(where: { $0.id == draggedItem }),
           let destinationIndex = priority.firstIndex(where: { $0.priority == destinationItem }) {

            // Remove the dragged item from its original position
            let draggedEntity = priority[draggedIndex]
            priority.remove(at: draggedIndex)

            // Insert the dragged item at the destination index
            priority.insert(draggedEntity, at: destinationIndex)

            // Recalculate priorities for all items based on their new positions
            for (index, item) in priority.enumerated() {
                priority[index].priority = index + 1
            }
        }
        self.draggedItem = nil
        return true
    }
}

