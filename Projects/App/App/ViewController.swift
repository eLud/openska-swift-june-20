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
        tableView.delegate = self

        prepareData()
    }

    ///Prepares the data
    func prepareData() {
        let appleDev = Website(name: "Apple Developer Portal", url: URL(string: "https://developer.apple.com")!)
        let swift = Website(name: "Swift Official Website", url: URL(string: "https://www.swift.org")!)
        let wwdcVideos = Website(name: "WWDC20 Videos", url: URL(string: "https://developer.apple.com/wwdc20/sessions/")!)

        websites = [appleDev, swift, wwdcVideos]
        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "goBrowser" {

            guard let destination = segue.destination as? BrowserViewController else { return }

            guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else { return }

            let website = websites[indexPath.row]
            destination.destinationURL = website.url
        }
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

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Available websites"
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Nothing else"
    }
}

struct Website {
    let name: String
    let url: URL
}
