//
//  RecordsViewController.swift
//  MillionerGame
//
//  Created by Egor Efimenko on 13.06.2022.
//

import UIKit

class RecordsViewController: UIViewController {
   
    @IBAction func deleteRecords(_ sender: Any) {
        GameSingleton.shared.clearRecords()
        tableView.reloadData()
    }
    
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        return dateFormatter
    }()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }
}

extension RecordsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameSingleton.shared.records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordCell", for: indexPath)
        let record = GameSingleton.shared.records[indexPath.row]
        
        cell.textLabel?.text = dateFormatter.string(from: record.date)
        cell.detailTextLabel?.text = "\(record.score) из 3, сложность: \(record.difficult)"
        
        return cell
    }
}
