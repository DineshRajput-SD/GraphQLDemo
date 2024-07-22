//
//  APRatingView.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 06/03/24.
//

import Foundation
import UIKit

@IBDesignable class APRatingView: UIView {
    //MARK: - Properties
    // Set fill color of star
    @IBInspectable open var fillColor: UIColor = .yellow {
        didSet { updateStarView() }
    }
    // Set empty color of star
    @IBInspectable open var emptyColor: UIColor = .lightGray {
        didSet { updateStarView() }
    }
    // Set border color on star
    @IBInspectable open var starBorderColor: UIColor = .clear {
        didSet { updateStarView() }
    }
    // Set number of stars in view
    @IBInspectable open var maxRating: Int = 5 {
        didSet { addStarView() }
    }
    // Set border width of star
    @IBInspectable open var starBorderWidth: CGFloat = 0 {
        didSet { updateStarView() }
    }
    // Set number of given rating
    @IBInspectable open var rating: CGFloat = 0 {
        didSet { refreshRatings() }
    }
    // Set padding between stars
    @IBInspectable open var leftPadding: Int = 1 {
        didSet { addStarView() }
    }
    
    //0 - FULL Start
    //1 - HALF Start
    //2 - FRACTIONAL
    // Select rating type 0 for FULL Start, 1 for HALF Start, 2 for FRACTIONAL
    @IBInspectable open var ratingType: Int = 0 {
        didSet { updateStarView() }
    }
    // Call Back to get selected rating by user
    var callBackToGetUpdatedRating:((CGFloat)->())?
    
    // MARK: Initializations
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    //MARK: - Touches Method
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        toucheslocation(touches)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        toucheslocation(touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        toucheslocation(touches)
    }
    
    //MARK: - Private Method
    private func toucheslocation(_ touches: Set<UITouch>) {
        guard let touch = touches.first else { return }
        updateRatingView(touch)
    }
    
    // Create number of unfill stars which is depend of max rating value
    private func drawEmptyRatingView() {
        drawStarView(100, color: emptyColor, isFillStar: false)
    }
    
    // Create number of fill stars which is depend of max rating value
    private func drawFillRatingView() {
        drawStarView(200, color: fillColor, isFillStar: true)
    }
    
    private func drawStarView(_ starTag: Int, color: UIColor, isFillStar: Bool) {
        var xAxis = 0
        let size = Int(frame.width/CGFloat(maxRating))
        for i in 0..<maxRating  {
            let view = StarView(frame: CGRect(x: xAxis + leftPadding, y: Int(CGFloat(size)/4.0), width: (size - (leftPadding * 2)) , height: (size - (leftPadding * 2))))
            view.backgroundColor = backgroundColor
            xAxis += size
            view.tag = i + starTag
            view.fillColor = color
            view.lineWidth = starBorderWidth
            view.strokeColor = starBorderColor
            if isFillStar { view.isHidden = i >= Int(rating) }
            addSubview(view)
        }
    }
    
    private func addStarView() {
        for view in subviews { view.removeFromSuperview()}
        drawEmptyRatingView()
        drawFillRatingView()
    }
    
    private func updateStarView() {
        var i = 0
        for view in subviews {
            guard let starView = view as? StarView else { continue }
            starView.fillColor =  emptyColor
            starView.lineWidth = starBorderWidth
            starView.strokeColor = starBorderColor
            if view.tag == (i + 200) {
                starView.isHidden = i >= Int(rating)
                starView.fillColor =  fillColor
            }
            i += 1
        }
    }
    
    // Method used to get the updated rating on the location of view
    private func updateRatingView(_ touch: UITouch) {
        guard isUserInteractionEnabled else { return }
        let touchLocation = touch.location(in: self)
        var updatedRating: CGFloat = 0.0
        for i in 0..<maxRating {
            let starView = subviews[i]
            guard touchLocation.x > starView.frame.origin.x else { continue }
            // Find touch point in image view
            let newLocation = starView.convert(touchLocation, from: self)
            //Find decimal value for float or half rating or full rating
            switch ratingType {
            case 1:
                let decimalNum = CGFloat(newLocation.x / starView.frame.size.width)
                updatedRating = CGFloat(i) + (decimalNum > 0.75 ? 1 : (decimalNum > 0.25 ? 0.5 : 0))
            case 2:
                let decimalNum = CGFloat(newLocation.x / starView.frame.size.width)
                updatedRating = CGFloat(i) + decimalNum
            default:
                updatedRating = CGFloat(i) + 1.0
            }
        }
        rating = updatedRating
        callBackToGetUpdatedRating?(rating)
    }
    
    private func refreshRatings() {
        for index in 0..<maxRating {
            guard let starView = self.viewWithTag(index + 200) as? StarView else {return}
            guard ratingType != 0 else {
                starView.fillColor = index < Int(rating) ? fillColor : emptyColor
                starView.isHidden = !(index < Int(rating))
                continue
            }
            if rating >= CGFloat(index+1) {
                updatedLayerWith(starView: starView, starView.frame.size.width, fillColor, false)
            } else if rating > CGFloat(index) && rating < CGFloat(index+1) {
                updatedLayerWith(starView: starView, CGFloat(rating-CGFloat(index))*starView.frame.size.width, fillColor, false)
            } else {
                updatedLayerWith(starView: starView, starView.frame.size.width, emptyColor, false)
            }
        }
    }
    
    private func updatedLayerWith(starView : StarView,_ width: CGFloat, _ color: UIColor ,_ isHidden: Bool) {
        let maskLayer = CALayer()
        maskLayer.frame = CGRect(x: 0, y: 0, width: width, height: starView.frame.size.height)
        maskLayer.backgroundColor = UIColor.black.cgColor
        starView.layer.mask = maskLayer
        starView.isHidden = isHidden
        starView.fillColor = color
    }
}

//MARK: - Star View
class  StarView: UIView {
    
    private let shapeLayer = CAShapeLayer()
    
    var fillColor: UIColor = .yellow {
        didSet {  shapeLayer.fillColor = fillColor.cgColor }
    }
    
    var lineWidth: CGFloat = 0.0 {
        didSet { shapeLayer.lineWidth = lineWidth }
    }
    
    var strokeColor: UIColor = .clear {
        didSet { shapeLayer.strokeColor = strokeColor.cgColor }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        startView()
    }
    
    private func startView() {
        shapeLayer.frame = CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height)
        shapeLayer.fillColor = fillColor.cgColor
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.backgroundColor = self.backgroundColor?.cgColor
        // Create path for start view
        let starPath = UIBezierPath()
        let center = shapeLayer.position
        let numberOfPoints = CGFloat(5.0)
        let numberOfLineSegments = Int(numberOfPoints * 2.0)
        let theta = .pi / numberOfPoints
        let circumscribedRadius = center.x
        let outerRadius = circumscribedRadius * 1.039
        let excessRadius = outerRadius - circumscribedRadius
        let innerRadius = CGFloat(outerRadius * 0.382)
        let leftEdgePointX = (center.x + cos(4.0 * theta) * outerRadius) + excessRadius
        let horizontalOffset = leftEdgePointX / 2.0
        // Apply a slight horizontal offset so the star appears to be more
        let offsetCenter = CGPoint(x: center.x - horizontalOffset, y: center.y)
        // Alternate between the outer and inner radii while moving evenly along the
        // circumference of the circle, connecting each point with a line segment
        for i in 0..<numberOfLineSegments {
            let radius = i % 2 == 0 ? outerRadius : innerRadius
            let pointX = offsetCenter.x + cos(CGFloat(i) * theta) * radius
            let pointY = offsetCenter.y + sin(CGFloat(i) * theta) * radius
            let point = CGPoint(x: pointX, y: pointY)
            i == 0 ? starPath.move(to: point) : starPath.addLine(to: point)
        }
        starPath.close()
        // Rotate the path so the star points up as expected
        var pathTransform  = CGAffineTransform.identity
        pathTransform = pathTransform.translatedBy(x: center.x, y: center.y)
        pathTransform = pathTransform.rotated(by: CGFloat(-.pi / 2.0))
        pathTransform = pathTransform.translatedBy(x: -center.x, y: -center.y)
        starPath.apply(pathTransform)
        shapeLayer.path = starPath.cgPath
        layer.addSublayer(shapeLayer)
    }
}

