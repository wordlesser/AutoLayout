//
//  CQView.swift
//  CQAutolayout
//
//  Created by Y_CQ on 2017/7/22.
//  Copyright © 2017年 YCQ. All rights reserved.
//

import Foundation
import UIKit

private var xoAssociationKey1: UInt8 = 12
private var xoAssociationKey2: UInt8 = 11

extension UIView {
    /// Add an additional attribute to store some info
    var _model: [String: Any]? {
        get {
            return objc_getAssociatedObject(self, &xoAssociationKey2) as? [String: Any]
        }
        
        set(newValue) {
            objc_setAssociatedObject(self, &xoAssociationKey2, newValue,objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
        }
    }
    
    /// store layout info
    private var _constraints: [String: NSLayoutConstraint]? {
        get {
            return objc_getAssociatedObject(self, &xoAssociationKey1) as? [String: NSLayoutConstraint]
        }
        set(newValue) {
            objc_setAssociatedObject(self, &xoAssociationKey1, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
        }
    }
    
//  MARK: You can also extend other views if needed
    
    /// Add a view
    ///
    /// - Returns: view
    func createSubView()->UIView {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.isOpaque = true
        self.addSubview(v)
        return v
    }
    
    func createSubButton()->UIButton {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.isOpaque = true
        self.addSubview(b)
        return b
    }
    
    func createSubLabel()->UILabel {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.isOpaque = true
        self.addSubview(lb)
        return lb
    }
    
    func createSubImageView()-> UIImageView {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.isOpaque = true
        self.addSubview(iv)
        return iv
    }
    
    func createSubTextView()-> UITextView {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tv)
        return tv
    }
    
    func createSubTextField()-> UITextField {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tf)
        return tf
    }
    
    func createSubScrollView()-> UIScrollView {
        let scv = UIScrollView()
        scv.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scv)
        return scv
    }
    
    
    /// top layout
    ///
    /// - Parameters:
    ///   - value: distance
    ///   - toItem: distance from the target view
    /// - Returns: self
    @discardableResult
    func top(_ value: CGFloat, toItem: UIView?=nil)->UIView {
        if toItem == nil {
            if !checkAndModify("top", value: value) {
                let constraint = NSLayoutConstraint(
                    item: self,
                    attribute: .top,
                    relatedBy: .equal,
                    toItem: self.superview,
                    attribute: .top,
                    multiplier: 1.0,
                    constant: value
                )
                self._addSaveContraint("top", constraint: constraint)
            }
        } else {
            if !checkAndModify("top:", value: -value) {
                let constraint = NSLayoutConstraint(
                    item: self,
                    attribute: .bottom,
                    relatedBy: .equal,
                    toItem: toItem,
                    attribute: .top,
                    multiplier: 1.0,
                    constant: -value
                )
                self._addSaveContraint("top:", constraint: constraint)
            }
        }
        return self
    }
    
    /// bottom layout
    ///
    /// - Parameters:
    ///   - value: distance
    ///   - toItem: distance from the target view(if 'toItem' is nil, default is superView)
    /// - Returns: self
    @discardableResult
    func bottom(_ value: CGFloat, toItem: UIView?=nil) -> UIView {
        if toItem == nil {
            if !checkAndModify("bottom", value: -value) {
                let constraint = NSLayoutConstraint(
                    item: self,
                    attribute: .bottom,
                    relatedBy: .equal,
                    toItem: self.superview,
                    attribute: .bottom,
                    multiplier: 1.0,
                    constant: -value
                )
                self._addSaveContraint("bottom", constraint: constraint)
            }
        } else {
            if !checkAndModify("bottom:", value: value) {
                let constraint = NSLayoutConstraint(
                    item: self,
                    attribute: .top,
                    relatedBy: .equal,
                    toItem: toItem,
                    attribute: .bottom,
                    multiplier: 1.0,
                    constant: value
                )
                self._addSaveContraint("bottom:", constraint: constraint)
            }
        }
        return self
    }

    /// left layout
    ///
    /// - Parameters:
    ///   - value: distance
    ///   - toItem: distance from the target view
    /// - Returns: self
    @discardableResult
    func left(_ value: CGFloat, toItem: UIView?=nil)->UIView {
        if toItem == nil {
            if !checkAndModify("left", value: value) {
                let constraint = NSLayoutConstraint(
                    item: self,
                    attribute: .left,
                    relatedBy: .equal,
                    toItem: self.superview,
                    attribute: .left,
                    multiplier: 1.0,
                    constant: value
                )
                self._addSaveContraint("left", constraint: constraint)
            }
        } else {
            if !checkAndModify("left:", value: -value) {
                let constraint = NSLayoutConstraint(
                    item: self,
                    attribute: .right,
                    relatedBy: .equal,
                    toItem: toItem,
                    attribute: .left,
                    multiplier: 1.0,
                    constant: -value
                )
                self._addSaveContraint("top:CGFloat", constraint: constraint)
            }
        }
        return self
    }
    
    /// right layout
    ///
    /// - Parameters:
    ///   - value: distance
    ///   - toItem: distance from the target view
    /// - Returns: self
    @discardableResult
    func right(_ value: CGFloat, toItem: UIView?=nil) -> UIView {
        if toItem == nil {
            if !checkAndModify("right", value: -value) {
                let constraint = NSLayoutConstraint(
                    item: self,
                    attribute: .right,
                    relatedBy: .equal,
                    toItem: self.superview,
                    attribute: .right,
                    multiplier: 1.0,
                    constant: -value
                )
                self._addSaveContraint("right", constraint: constraint)
            }
        } else {
            if !checkAndModify("right:", value: value) {
                let constraint = NSLayoutConstraint(
                    item: self,
                    attribute: .left,
                    relatedBy: .equal,
                    toItem: toItem,
                    attribute: .right,
                    multiplier: 1.0,
                    constant: value
                )
                self._addSaveContraint("right:", constraint: constraint)
            }
        }
        return self
    }
    
    /// width layout
    ///
    /// - Parameter width: distance
    /// - Returns: self
    @discardableResult
    func width(_ width: CGFloat)->UIView {
        if !checkAndModify("width", value: width) {
            let constraint = NSLayoutConstraint(
                item: self,
                attribute: .width,
                relatedBy: NSLayoutRelation.equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1.0,
                constant: width
            )
            self._addSaveContraint("width", constraint: constraint)
        }
        return self
    }
    
    /// height layout
    ///
    /// - Parameter width: distance
    /// - Returns: self
    @discardableResult
    func height(_ height: CGFloat) -> UIView {
        if !checkAndModify("height", value: height) {
            let constraint = NSLayoutConstraint(
                item: self,
                attribute: .height,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1.0,
                constant: height
            )
            self._addSaveContraint("height", constraint: constraint)
        }
        return self
    }
    
    
    /// center.x layout
    ///
    /// - Returns: self
    @discardableResult
    func centerX() -> UIView {
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self.superview,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0
        )
        self.addConstraintByType("centerX", constraint: constraint)
        return self
    }
    
    /// center.y layout
    ///
    /// - Returns: self
    @discardableResult
    func centerY() -> UIView {
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: self.superview,
            attribute: .centerY,
            multiplier: 1.0,
            constant: 0
        )
        self.addConstraintByType("centerY", constraint: constraint)
        return self
    }
    
    /// clear layout
    ///
    /// - Parameter type: remove a layout
    fileprivate func _clearSaveContraint(_ type: String) {
        if self._constraints?[type] != nil {
            let con = self._constraints![type]!
            self.superview?.removeConstraint(con)
        }
    }
    
    
    /// add layout
    ///
    /// - Parameters:
    ///   - type: layout of type
    ///   - constraint: layout
    fileprivate func _addSaveContraint(_ type: String, constraint: NSLayoutConstraint) {
        var cons = self._constraints ?? [:]
        cons[type] = constraint
        self._constraints = cons
        constraint.priority = 999
        self.superview?.addConstraint(constraint)
    }
    
    
    /// add a layout
    ///
    /// - Parameters:
    ///   - type: type of layout
    ///   - constraint: layout
    fileprivate func addConstraintByType(_ type: String, constraint: NSLayoutConstraint) {
        //clear first
        self._clearSaveContraint(type)
        // then add
        self._addSaveContraint(type, constraint: constraint)
    }
    
    
    /// check if it's already owned and then if has midify it
    ///
    /// - Parameters:
    ///   - type: type of layout
    ///   - value: modify value
    /// - Returns: Is it already owned
    fileprivate func checkAndModify(_ type: String, value: CGFloat) -> Bool {
        //这里的逻辑是 看看 这个约束是不是已经有了. 如果已经有了, 就只修改const
        //这样的性能会好些
        let con = self._constraints?[type]
        if con != nil {
            con!.constant = value
            return true
        }
        return false
    }
    
    
    /// clear a layout
    ///
    /// - Parameter type: type of clean
    func clear(_ type: String) {
        let constraint = self._constraints?[type]
        if constraint != nil {
            self.superview?.removeConstraint(constraint!)
        }
    }
    
    
    /// clear all layout
    func clearAll() {
        if self._constraints == nil || self._constraints?.count == 0 {
            return
        }
        for (_, value) in self._constraints! {
            self.superview?.removeConstraint(value)
        }
    }

}
