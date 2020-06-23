//
//  ViewController.swift
//  FirstApp
//
//  Created by Ludovic Ollagnier on 23/06/2020.
//

import UIKit

class ViewController: UIViewController {

    var human: Human?

    var completion: ()->() = {

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        var me: Human? = Human(name: "Ludovic")
        var son: Human? = Human(name: "Ludovic's son")

        me?.son = son
        son?.father = me
        human = me
        var otherMe = son

//        me = nil
//        son = nil
//        otherMe = nil

        completion = { [weak self] in
            self?.doSomething(with: "tata")
            self?.download()
        }

    }

    func download() {

        let session = URLSession.shared
        let task = session.dataTask(with: URL(string: "toto")!) { [weak self] (data, response, error) in
            self?.doSomething(with: "tata")
        }

        task.resume()
    }

    func doSomething(with result: String) {

    }

}

class Human {
    var firstName: String

    weak var father: Human?
    var son: Human?

    init(name: String) {
        firstName = name
    }

    deinit {
        print("Deinited \(firstName)")
    }
}
