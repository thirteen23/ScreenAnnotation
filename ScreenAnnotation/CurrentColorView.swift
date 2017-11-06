//
//  CurrentColorView.swift
//  ScreenAnnotation
//
//  Created by Marc Vandehey on 11/6/17.
//  Copyright © 2017 SkyVan Labs. All rights reserved.
//

import Cocoa

class CurrentColorView: NSView {
  static func newInstance() -> CurrentColorView{
    let view = CurrentColorView(frame: NSRect(origin: CGPoint(), size: CGSize(width: 15, height: 15)))
    
    view.layer = CALayer()
    view.layer?.backgroundColor = NSColor.red.cgColor
    view.layer?.borderColor = .white
    view.layer?.borderWidth = 2
    
    return view
  }
  
  func setColor(color: NSColor) {
    layer?.backgroundColor = color.cgColor
  }
}
