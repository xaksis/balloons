//
//  ViewController.swift
//  99Balloons
//
//  Created by Akshay Anand on 11/15/14.
//  Copyright (c) 2014 CrayonBytes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image_imv: UIImageView!
    @IBOutlet weak var balloon_lbl: UILabel!
    var balloons:[Balloon] = []
    
    func getRandomImage() -> UIImage {
        var total = 4
        var random_num = Int(arc4random_uniform(UInt32(total-1))) + 1
        return UIImage(named: "RedBalloon\(random_num).jpg")
    }
    
    //uitility function
    func initBalloons(total : Int){
        for var i=0; i < total; i++ {
            var balloon = Balloon()
            balloon.num = i
            balloon.image = getRandomImage()
            self.balloons.append(balloon)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //create a hundred balloons
        initBalloons(100)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func next_btn(sender: UIBarButtonItem) {
        var random_num = Int(arc4random_uniform(UInt32(self.balloons.count)))
        balloon_lbl.text = "Balloon \(self.balloons[random_num].num)"
        image_imv.image = self.balloons[random_num].image
    }

}

