//
//  ViewController.swift
//  App
//
//  Created by Ludovic Ollagnier on 23/06/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        tableView.dataSource = self
    }
}
extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        //Section 0
        //Ligne
        //Ligne

        //Section 1
        //Ligne

        switch section {
        case 0:
            return 5
        case 1:
            return 2
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //IndexPath (section, row)

        let cell = tableView.dequeueReusableCell(withIdentifier: "websiteCell", for: indexPath)

        cell.textLabel?.text = "Apple Developer Portal"
        cell.detailTextLabel?.text = "https://developer.apple.com"

        return cell
    }
}

