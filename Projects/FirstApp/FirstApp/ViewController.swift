//
//  ViewController.swift
//  FirstApp
//
//  Created by Ludovic Ollagnier on 23/06/2020.
//

import UIKit

class ViewController: UIViewController {

    var human: Human?

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
