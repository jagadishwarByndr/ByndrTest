//
//  LibraryScreenVC.swift
//  ByndrTest
//
//  Created by Jagdishwar Enagurthi  on 25/01/18.
//  Copyright © 2018 Jaggu Sam. All rights reserved.
//

import UIKit
import XMSegmentedControl

class LibraryScreenVC: UIViewController, XMSegmentedControlDelegate  {
    
    
    
    
    @IBOutlet weak var segmentedControl1: XMSegmentedControl!
    
    
    
    let byndrColor : UIColor = UIColor( red: 224/255, green: 0/255, blue: 115/255, alpha: 1.0 )
    let font = UIFont(name: "Helvetica Light", size: 12.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        segmentedControl1.delegate = self
        segmentedControl1.segmentTitle = ["LIBRARY", "SAVED"]
        
        
        segmentedControl1.selectedItemHighlightStyle = XMSelectedItemHighlightStyle.BottomEdge
        segmentedControl1.backgroundColor = byndrColor
        segmentedControl1.tint = UIColor.white
        segmentedControl1.highlightTint = UIColor.white
        segmentedControl1.highlightColor = UIColor.white
        segmentedControl1.edgeHighlightHeight = 3
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func xmSegmentedControl(xmSegmentedControl: XMSegmentedControl, selectedSegment: Int) {
        if xmSegmentedControl == segmentedControl1 {
            print("SegmentedControl1 Selected Segment: \(selectedSegment)")
        }
    }

}
