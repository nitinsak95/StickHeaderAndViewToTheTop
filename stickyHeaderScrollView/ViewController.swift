//
//  ViewController.swift
//  stickyHeaderScrollView
//
//  Created by AFFIXUS IMAC1 on 10/1/18.
//  Copyright © 2018 AFFIXUS IMAC1. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UITextViewDelegate {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var stickView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textView: UITextView!
    var navigationBarOriginalOffset : CGFloat?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationBarOriginalOffset = stickView.frame.origin.y
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        stickView.frame.origin.y = max(navigationBarOriginalOffset!, scrollView.contentOffset.y)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let fixedWidth = textView.frame.size.width
        textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        textView.frame = newFrame
    }
    
}

