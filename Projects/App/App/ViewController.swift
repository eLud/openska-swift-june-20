//
//  ViewController.swift
//  App
//
//  Created by Ludovic Ollagnier on 23/06/2020.
//

import UIKit
import TotoKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var progressView: UIProgressView!
    
    var websites: [Website] = []

    var odrRequest: NSBundleResourceRequest?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        tableView.dataSource = self
        tableView.delegate = self

        prepareData()

        let toto = Toto(apiKey:"sdfghjk")
        toto.apiKeyIsValid()
        Toto.totoify()
    }

    ///Prepares the data
    private func prepareData() {

        // Get data from disk (from project)
        let bundle = Bundle.main
        guard let url = bundle.url(forResource: "Websites", withExtension: "json") else { return }
        guard let data = try? Data(contentsOf: url) else { return }

        // Parse
        guard let websites = makeWebsites(from: data) else { return }

        //Assign
        self.websites = websites

        prepareORD { (error) in

        }

        tableView.reloadData()
    }

    private func prepareORD(completion: @escaping (Error?)-> ()) {

        odrRequest = NSBundleResourceRequest(tags: ["additional"])

        odrRequest?.loadingPriority = NSBundleResourceRequestLoadingPriorityUrgent
        progressView.observedProgress = odrRequest?.progress

        odrRequest?.beginAccessingResources(completionHandler: { (error) in
            completion(error)
            guard error == nil else {
                print(error)

                return
            }

            // Get data from disk (from project)
            let bundle = Bundle.main
            guard let url = bundle.url(forResource: "AdditionalWebsites", withExtension: "json") else { return }
            guard let data = try? Data(contentsOf: url) else { return }

            // Parse
            guard let websites = self.makeWebsites(from: data) else { return }

            //Assign
            self.websites.append(contentsOf: websites)

            DispatchQueue.main.async {
                self.progressView.isHidden = true
                self.tableView.reloadData()
                self.odrRequest?.endAccessingResources()
                self.odrRequest = nil
            }

            bundle.setPreservationPriority(0.5, forTags: ["additional"])
        })
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "goBrowser" {

            guard let destination = segue.destination as? BrowserViewController else { return }

            guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else { return }

            let website = websites[indexPath.row]
            destination.destinationURL = website.url
        }
    }

    func loop(_ nbOfTime: Int, code: ()->()) {
        for _ in 0...nbOfTime {
            code()
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

///Manage persistence
extension ViewController {

    func makeJson(with websites: [Website]) -> Data? {

        let encoder = JSONEncoder()
        let data = try? encoder.encode(websites)

        return data
    }



    func makeWebsites(from data: Data) -> [Website]? {

        let decoder = JSONDecoder()
        let websites = try? decoder.decode([Website].self, from: data)
        return websites
    }
}

struct Website: Codable {

    let name: String
    let url: URL

//    enum CodingKeys: String, CodingKey {
//        case name = "title"
//        case url = "website_url"
//    }
}
