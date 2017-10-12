//
//  ViewController.swift
//  ScreenAnnotation
//
//  Created by Marc Vandehey on 9/5/17.
//  Copyright © 2017 SkyVan Labs. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
  let lineWeight: CGFloat = 10
  let strokeColor: NSColor = .red

  var currentPath: NSBezierPath?
  var currentShape: CAShapeLayer?

  private let offText = "Disable Drawing"
  private let onText = "Enable Drawing"

  @IBOutlet weak var clearButton: NSMenuItem!
  @IBOutlet weak var toggleButton: NSMenuItem!
  @IBOutlet var optionsMenu: NSMenu!

  @IBAction func clearButtonClicked(_ sender: Any) {
    view.layer?.sublayers?.removeAll()
  }

  @IBAction func toggleButtonClicked(_ sender: Any) {
    view.window!.ignoresMouseEvents = !view.window!.ignoresMouseEvents

    toggleButton.title = view.window!.ignoresMouseEvents ? onText : offText
  }

  let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

  override func awakeFromNib() {
    statusItem.menu = optionsMenu
    let icon = NSImage(named: NSImage.Name(rawValue: "pencil"))
    icon?.isTemplate = true // best for dark mode
    statusItem.image = icon

    toggleButton.title = offText
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    view.frame = CGRect(origin: CGPoint(), size: NSScreen.main!.visibleFrame.size)
  }

  func startDrawing(at point: NSPoint) {
    currentPath = NSBezierPath()
    currentShape = CAShapeLayer()

    currentShape?.lineWidth = lineWeight
    currentShape?.strokeColor = strokeColor.cgColor
    currentShape?.fillColor = NSColor.clear.cgColor

    currentShape?.lineJoin = kCALineJoinRound
    currentShape?.lineCap = kCALineCapRound

    currentPath?.move(to: point)
    currentPath?.line(to: point)

    currentShape?.path = currentPath?.cgPath

    view.layer?.addSublayer(currentShape!)
  }

  func continueDrawing(at point: NSPoint) {
    currentPath?.line(to: point)

    if let shape = currentShape {
      shape.path = currentPath?.cgPath
    }
  }

  func endDrawing(at point: NSPoint) {
    currentPath?.line(to: point)

    if let shape = currentShape {
      shape.path = currentPath?.cgPath
    }

    currentPath = nil
    currentShape = nil
  }
}

