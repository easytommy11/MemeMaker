//
//  ViewController.swift
//  MemeMaker
//
//  Created by Tomiwa Babalola on 12/14/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var topSegmentedControl: UISegmentedControl!
    @IBOutlet var bottomSegmentedControl: UISegmentedControl!
    @IBOutlet var topCaptionLabel: UILabel!
    @IBOutlet var bottomCaptionLabel: UILabel!
    
    
    var topChoices: [CaptionOption] = [CaptionOption(emoji: "🧍‍♂️", caption:"Did we have homework?"), CaptionOption(emoji: "😐", caption:"Lebron is better than Durant."), CaptionOption(emoji: "🙄", caption: "We have to wear blazers tomorrow?")]
    
    var bottomChoices:[CaptionOption] = [CaptionOption(emoji:"😑", caption:"Dont know, Dont care."), CaptionOption(emoji: "🤨", caption: "Are you crazy?"), CaptionOption(emoji: "😪", caption: "Yea not me tho, stay safe tho.")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topSegmentedControl.removeAllSegments()
        
        bottomSegmentedControl.removeAllSegments()
        
        for choice in topChoices {
            topSegmentedControl.insertSegment(withTitle: choice.emoji,at:topChoices.count,animated: false)
        }
        for choice in bottomChoices {
            bottomSegmentedControl.insertSegment(withTitle: choice.emoji,at:bottomChoices.count,animated: false)
        }
        
        topSegmentedControl.selectedSegmentIndex = 0
        bottomSegmentedControl.selectedSegmentIndex = 0
        updateCaptions()
      
       
        // Do any additional setup after loading the view.
    }
    
    
    func  updateCaptions(){
        let topIndex = topSegmentedControl.selectedSegmentIndex
        topCaptionLabel.text = topChoices[topIndex].caption
        let bottomIndex = bottomSegmentedControl.selectedSegmentIndex
        bottomCaptionLabel.text = bottomChoices[bottomIndex].caption
    }
 
    
    @IBAction func options(_ sender: UISegmentedControl) {
        updateCaptions()
       
    }
    
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            topCaptionLabel.center = sender.location(in: view)
        }
    }
    
    @IBAction func dragBottonLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            bottomCaptionLabel.center = sender.location(in: view)
        }
    }
}

