//
//  ViewController.swift
//  ToDoey
//
//  Created by Banana Viking on 11/1/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit
import CoreData

class ListViewController: UITableViewController {
    var items = [Item]()
    var selectedCategory: Category? {
        didSet {
//            loadItems()
        }
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Done", style: .default) { (action) in
            
//            let newItem = Item(context: self.context)
//            newItem.itemDescription = textField.text!
//            newItem.isChecked = false
//            newItem.parentCategory = self.selectedCategory
//            self.items.append(newItem)
            self.saveItems()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add new item here..."
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.itemDescription
        
        if item.isChecked == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        items[indexPath.row].isChecked = !items[indexPath.row].isChecked
        saveItems()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func saveItems() {
        do {
            try context.save()
        } catch {
            print("Error saving context: \(error)")
        }
        tableView.reloadData()
    }
    
//    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest(), predicate: NSPredicate? = nil) {
//        let categoryPredicate = NSPredicate(format: "parentCategory.categoryDescription MATCHES %@", (selectedCategory?.categoryDescription)!)
//
//        if let additionalPredicat = predicate {
//            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, additionalPredicat])
//        } else {
//            request.predicate = categoryPredicate
//        }
//
//        do {
//            items = try context.fetch(request)
//        } catch {
//            print("Error fetching data from context: \(error)")
//        }
//        tableView.reloadData()
//    }
}

//MARK: - Search Bar Methods
//extension ListViewController: UISearchBarDelegate {
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        let request: NSFetchRequest<Item> = Item.fetchRequest()
//        let predicate = NSPredicate(format: "itemDescription CONTAINS[cd] %@", searchBar.text!)
//        request.sortDescriptors = [NSSortDescriptor(key: "itemDescription", ascending: true)]
//
//        loadItems(with: request, predicate: predicate)
//    }
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchBar.text?.count == 0 {
//            loadItems()
//            DispatchQueue.main.async {
//                searchBar.resignFirstResponder()
//            }
//        }
//    }
//}
