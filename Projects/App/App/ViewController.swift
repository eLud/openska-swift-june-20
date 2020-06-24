//
//  ViewController.swift
//  App
//
//  Created by Ludovic Ollagnier on 23/06/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var websites: [Website] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        tableView.dataSource = self

        prepareData()
    }

    ///Prepares the data
    func prepareData() {
        let appleDev = Website(name: "Apple Developer Portal", url: URL(string: "https://developer.apple.com")!)
        let swift = Website(name: "Swift Official Website", url: URL(string: "https://swift.org")!)
        let wwdcVideos = Website(name: "WWDC20 Videos", url: URL(string: "https://developer.apple.com/wwdc20/sessions/")!)

        websites = [appleDev, swift, wwdcVideos]
        tableView.reloadData()
    }
}
extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        //Section 0
        //Ligne
        //Ligne

        //Section 1
        //Ligne

        switch section {
        case 0:
            return websites.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //IndexPath (section, row)

        let cell = tableView.dequeueReusableCell(withIdentifier: "websiteCell", for: indexPath)

        let website = websites[indexPath.row]
        cell.textLabel?.text = website.name
        cell.detailTextLabel?.text = website.url.absoluteString

        return cell
    }
}

struct Website {
    let name: String
    let url: URL
}
