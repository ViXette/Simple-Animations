//
//  ViewController.swift
//  Animations
//
//  Created by VX on 03/09/16.
//  Copyright © 2016 VXette. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var timer = Timer()
    var isAnimating = false
    
    var currentFrame = 0
    let maxFrame = 94
    
    @IBOutlet weak var animateButton_Label: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func nextTapped(_ sender: AnyObject) {
        if isAnimating {
            timer.invalidate()
            isAnimating = false
            animateButton_Label.setTitle("Start", for: [])
            
        } else {
            timer = Timer.scheduledTimer(timeInterval: 0.04, target: self, selector: #selector(animate), userInfo:  nil, repeats: true)
            isAnimating = true
            animateButton_Label.setTitle("Stop", for: [])
        }
    }
    
    func animate() {
        currentFrame += 1
        if currentFrame > maxFrame {
            currentFrame = 1
        }
        
        imageView.image = UIImage(named: "frame_\(currentFrame)_delay-0.04s.gif")
    }

    @IBAction func fadeInTapped(_ sender: AnyObject) {
        imageView.alpha = 0
        
        UIView.animate(withDuration: 2, animations: {
            self.imageView.alpha = 1
        })
    }
    
    @IBAction func slideInTapped(_ sender: AnyObject) {
        imageView.center = CGPoint(x: imageView.center.x - imageView.bounds.width, y: imageView.center.y)
        UIView.animate(withDuration: 2, animations: {
            self.imageView.center = CGPoint(x: self.imageView.center.x + self.imageView.bounds.width, y: self.imageView.center.y)
        })
    }
    
    @IBAction func growTapped(_ sender: AnyObject) {
        let x = self.imageView.center.x - self.imageView.bounds.width / 2
        let y = self.imageView.center.y - self.imageView.bounds.height / 2
        let width = imageView.bounds.width
        let height = imageView.bounds.height
        
        imageView.frame = CGRect(x: x, y: y, width: 0, height: 0)
        
        UIView.animate(withDuration: 2, animations: {
            self.imageView.frame = CGRect(x: x, y: y, width: width, height: height)
        })
    }
    
}

