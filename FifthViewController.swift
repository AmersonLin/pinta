//
//  FifthViewController.swift
//  Pinta trial
//
//  Created by KT Khoo on 7/11/15.
//  Copyright © 2015 KT Khoo. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {

    @IBOutlet weak var meterImageView: UIImageView!

    @IBOutlet weak var breathlyseButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // Mark: Actions

    @IBAction func randomAnalyse(sender: UIButton) {
        let level = Int(arc4random_uniform(4) + 1)
        switch level {
            case 1:
                meterImageView.image = UIImage(named: "sober-o-meter-1")
            case 2:
                meterImageView.image = UIImage(named: "sober-o-meter-2")
            case 3:
                meterImageView.image = UIImage(named: "sober-o-meter-3")
            case 4:
                meterImageView.image = UIImage(named: "sober-o-meter-4")
            default:
                print("Out of bounds random number")
        }

    }

}
