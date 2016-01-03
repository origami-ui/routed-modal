
= exports.add $ \ (db modalData)
  db.update :modals $ \ (modals)
    modals.push modalData

= exports.remove $ \ (db modalId)
  db.update :modals $ \ (modals)
    modals.filterNot $ \ (modalData)
      is (modalData.get :id) modalId
