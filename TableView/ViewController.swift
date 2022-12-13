//
//  ViewController.swift
//  TableView
//
//  Created by DongMin Hwang on 2022/12/08.
//

import UIKit

class ViewController: UIViewController {
    
//    var moviesArray : [Movie] = []
    
    var movieDataManager = DataManager()
   @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 120 // tableView 에서 하나하나의 높이
        tableView.delegate = self
        title = "영화목록입니다."
        // Do any additional setup   after loading the view.
        movieDataManager.makeMovieData() // 데이터를 먼저 생성하기 위해서
        //셀을 등록하는 과정(스토리보드로 구현했으면 필요없다.)
        //tableView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellReuseIdentifier: <#T##String#>)
//       moviesArray = movieDataManager.getMovieData()
    }
    
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        
        movieDataManager.updateMovieData()
        tableView.reloadData()
        tableView.GoToBottom()
    }
    
}
// 확장하는이유 눈에 보이기 편하게
extension ViewController: UITableViewDataSource {
    
    //테이블뷰를 몇개?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
//        return moviesArray.count
        return movieDataManager.getMovieData().count
    }
    // cell을 그리는방식을 알려주는
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        indexPath.section // 테이블뷰를 그룹으로 했을때
//        indexPath.row // 몇번째 줄
        print(#function)
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let array = movieDataManager.getMovieData()
        
        let movie = array[indexPath.row]
//        cell.mainImageView.image = moviesArray[indexPath.row].movieImage
//        cell.movieNameLabel.text = moviesArray[indexPath.row].movieName
//        cell.descriptionLabel.text = moviesArray[indexPath.row].movieDescrtiption
        cell.mainImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.descriptionLabel.text = movie.movieDescrtiption
        cell.selectionStyle = .none
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    //didSelectRowAt 선택이 되었다 언떤 특정한 행이 선택이 되었다.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select_001")
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! DetailViewController
            let array = movieDataManager.getMovieData()
            let indexPath = sender as! IndexPath
            detailVC.movieData = array[indexPath.row]// 우리가 전달하기 원하는 영화 데이터
        }
    }
}

extension UITableView {
    
    func GoToBottom() {
        
        DispatchQueue.main.async {
            
            let section = self.numberOfSections - 1
            let row = self.numberOfRows(inSection: section) - 1
            
            let indexPath = IndexPath(row: row, section: section)
            self.scrollToRow(at: indexPath, at: .bottom, animated: false)
        }
    }
}

