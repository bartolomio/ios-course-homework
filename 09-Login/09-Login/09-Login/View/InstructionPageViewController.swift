//
//  InstructionPageViewController.swift
//  06-MVP-CVC
//
//  Created by Роман on 20.06.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import UIKit

class InstructionPageViewController: UIPageViewController {

    //MARK: InstructionPage View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self

        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if  Settings.shared.doSkipInto() {
            self.performSegue(withIdentifier: "skipIntro", sender: self)
        }
    }
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newColoredViewController(header: "Add"),
                self.newColoredViewController(header: "EditDelete"),
                self.newColoredViewController(header: "Favorite")]
    }()
    
    private func newColoredViewController(header: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(header)InstructionView")
    }

}

// MARK: UIPageViewControllerDataSource

extension InstructionPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        if nextIndex >= orderedViewControllersCount {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    
    
}
