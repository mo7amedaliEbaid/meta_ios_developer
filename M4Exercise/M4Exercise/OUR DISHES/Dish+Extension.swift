import Foundation
import CoreData


extension Dish {

    static func createDishesFrom(menuItems:[MenuItem],
                                 _ context:NSManagedObjectContext) {
        for item in menuItems {
            if dishExists(name: item.title, context) == false {
                let dish = Dish(context: context)
                dish.name = item.title
                dish.price = Float(item.price) ?? 0
            }
        }
        save(context)
    }

    static func dishExists(name: String,
                           _ context: NSManagedObjectContext) -> Bool {
        let request: NSFetchRequest<Dish> = Dish.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", name)
        do {
            let count = try context.count(for: request)
            return count > 0
        } catch {
            return false
        }
    }

}
