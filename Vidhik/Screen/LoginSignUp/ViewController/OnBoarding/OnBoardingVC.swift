//
//  OnBoardingVC.swift
//  Vidhik
//
//  Created by NumeroEins on 21/03/24.
//

import UIKit


class OnBoardingVC: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var onBoardingCollectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    
    var timer: Timer?
    var counter = 0
    let onBoardingVM = OnBoardingVM()
    var checkUserType = ApplicationPreference.getcheckUserType()
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onBoardingCollectionView.delegate = self
        onBoardingCollectionView.dataSource = self
        onBoardingVM.setDataForOnBoardingScreen()
        pageController.numberOfPages = onBoardingVM.onBoardingData?.count ?? 0
        pageController.currentPage = 0
        startTimer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setCollectionViewLayout()
    }
    
    // MARK: - IBActions
    @IBAction func skipButtonAction(_ sender: UIButton) {
        showOnBoarding = true
        ObjAppdelegate.setRootViewController()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(scrollToNextPage), userInfo: nil, repeats: true)
    }
    
    @objc func scrollToNextPage() {
        let currentPage = pageController.currentPage
        
        if currentPage + 1 < onBoardingVM.onBoardingData?.count ?? 0{
            
            let nextPage =  currentPage + 1
            
            let indexPath = IndexPath(item: nextPage, section: 0)
            onBoardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

// MARK: - Supporting Functions
extension OnBoardingVC {
    
    func setCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = .zero
        layout.minimumLineSpacing = .zero
        layout.sectionInset = .zero
        layout.itemSize = onBoardingCollectionView.frame.size
        onBoardingCollectionView.setCollectionViewLayout(layout, animated: true)
        
    }
}

// MARK: - UICollectionView Delegates and DataSource
extension OnBoardingVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onBoardingVM.onBoardingData?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnBoardingCollectionViewCell", for: indexPath) as! OnBoardingCollectionViewCell
        collectionHeight.constant = onBoardingCollectionView.contentSize.height
        let data = onBoardingVM.onBoardingData?[indexPath.row]
        cell.imageView.image = UIImage(named: data?.image ?? "")
        cell.titleLabel.text = data?.title
        cell.subtileLabel.text = data?.description
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / scrollView.frame.width)
        pageController.currentPage = Int(pageIndex)
        
        let visibleItems = onBoardingCollectionView.indexPathsForVisibleItems
        if let lastVisibleItem = visibleItems.last {
            let lastItemIndex = onBoardingCollectionView.numberOfItems(inSection: 0) - 1
            if lastVisibleItem.item == lastItemIndex {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) { // 1 sec delay
                    self.skipButton.setTitle("Get Started", for: .normal)
                }
            }
        }
    }
}

// MARK: - Custom Cell Class
class OnBoardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtileLabel: UILabel!
    
}
