//
//  ListViewModel.swift
//  ApsiyonCaseStudyDevFurkan
//
//  Created by Furkan Yıldız on 19.12.2021.
//

import UIKit

class ListViewModel: NSObject{
    var popularMoviesCompletion: (()->())!
    var tapCellCompletion: ((_ movieId: Int?)->())!
    var willDisplayCompletion: (()->())!
    var popOverDidDismissCompletion: (()->())!
    var isLoading = false
    var counterPage = 2
    
    
    private var popularMoviesDataSource: [Movie]?{
        didSet{
            popularMoviesCompletion()
        }
    }
    
    override init(){
        super.init()
        fetchpopularData()
    }
    
    
    
    private func fetchpopularData(){
        APIService.shared.fetchPopularMoviesData(page: 1) {[weak self] (myFav, error) in
            if error == nil {
                guard  let movies = myFav?.results else {return}
                print("Current Page : 1")
                self?.popularMoviesDataSource = movies
            }else{
                
            }
        }
    }
    
}

extension ListViewModel: UITableViewDelegate,UITableViewDataSource {
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.frame.height/3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popularMoviesDataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell") as!
        MovieListTableViewCell
        cell.viewModel.dataSource = popularMoviesDataSource?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tapCellCompletion(popularMoviesDataSource?[indexPath.row].id)
    }
  
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height - 100
        let frameSize = scrollView.frame.size.height

        if(offsetY > contentHeight - frameSize) && !isLoading {
            self.isLoading = true
            APIService.shared.fetchPopularMoviesData(page: counterPage) {[weak self] (myFav,error) in
                if error == nil {
                    DispatchQueue.main.async {
                        sleep(2)
                        let start = self!.popularMoviesDataSource?.count
                        let end = start!
                        if end < 100 {
                            guard  let newData = myFav?.results else {return}
                            print("Current Page : \(self!.counterPage)")
                            self?.popularMoviesDataSource?.append(contentsOf: newData)
                            self?.counterPage += 1
                                            DispatchQueue.main.async {
                                                self!.isLoading = false
                                            }
                                        }
                        
                    }
                }else{
                }
                        }
            }
    }
    
    
}
//MARK: Another item upload func
//extension ListViewModel: UITableViewDataSourcePrefetching {
//    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
//        for index in indexPaths {
//            if index.row >= popularMoviesDataSource!.count - 1 {
//                fetchpopularData()
//                break
//            }
//        }
//    }
//}
