//
//  ViewController.swift
//  ios_tableView
//
//  Created by Profit, Holden on 11/16/16.
//  Copyright © 2016 Profit, Holden. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

final class Shared {
    init() {}
    
    static let shared = Shared() //lazy init, and it only runs once

    var selectedMovie: JSON?
}

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView?
    var data: Array<JSON> = []
    
    // If the result JSON passed to this function is not nil, take the Search array property from it and convert it to JSON
    func parseIMBDResults (result: Any?) {
        if let jsonValue = result {
            data = JSON(jsonValue)["Search"].arrayValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call IMDB for movies, parse the results and reload the table with the data once the results are parsed
        Alamofire.request("http://www.omdbapi.com/?page=50&s=christmas").responseJSON { response in
            self.parseIMBDResults(result: response.result.value)
            self.table?.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table Number of Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    // MARK: - Cell Fill Function
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]["Title"].string
        return cell
    }
    
    // MARK: - Cell Click
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Retrieve the clicked row index before we segue over to the detail view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        Shared.shared.selectedMovie = data[(table?.indexPathForSelectedRow?.row)!]
    }
}

