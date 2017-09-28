//
//  ClearWindow.swift
//  ScreenAnnotation
//
//  Created by Marc Vandehey on 9/5/17.
//  Copyright © 2017 SkyVan Labs. All rights reserved.
//

import Cocoa

class ClearWindow : NSWindow {
  override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
    super.init(contentRect: contentRect, styleMask: StyleMask.borderless, backing: backingStoreType, defer: flag)

    level = NSWindow.Level.statusBar

    backgroundColor = NSColor(calibratedRed: 1, green: 1, blue: 1, alpha: 0.001)
  }

  override func mouseDown(with event: NSEvent) {
    (contentViewController as? ViewController)?.startDrawing(at: event.locationInWindow)
  }

  override func mouseDragged(with event: NSEvent) {
    (contentViewController as? ViewController)?.continueDrawing(at: event.locationInWindow)
  }

  override func mouseUp(with event: NSEvent) {
    (contentViewController as? ViewController)?.endDrawing(at: event.locationInWindow)
  }
}
