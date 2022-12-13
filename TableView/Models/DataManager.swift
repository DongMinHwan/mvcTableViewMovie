//
//  DataManager.swift
//  TableView
//
//  Created by DongMin Hwang on 2022/12/09.
//

import UIKit

class DataManager {
    
    var movieDataArray: [Movie] =  [] // 빈배열로 만들었기때문에 데이터가 하나도 표시가 안된다.
    
    func makeMovieData() {
        movieDataArray  = [
            Movie(movieImage: UIImage(named: "batman.png"),movieName: "배트맨", movieDescrtiption: "배트맨이 출현하는 영화"),
            Movie(movieImage: UIImage(named: "captain.png"),movieName: "캡틴 아메리카", movieDescrtiption: "캡틴 아메리카의 기원. 캡틴 아메리카는 어떻게 탄생하게 되었을까?"),
            Movie(movieImage: UIImage(named: "ironman.png"),movieName: "아이언맨", movieDescrtiption: "토니 스타크가 출현, 아이언맨이 탄생하게된 계기가 재미잇는 영화"),
            Movie(movieImage: UIImage(named: "thor.png"),movieName: "토르", movieDescrtiption: "아스가르드의 후계자 토르가 지구에 오게되는 스토리"),
            Movie(movieImage: UIImage(named: "hulk.png"),movieName: "헐크", movieDescrtiption: "브루스 배너 박사의 실험을 통해 헐크가 탄생하게 되는 영화"),
            Movie(movieImage: UIImage(named: "spiderman.png"),movieName: "스파이더맨", movieDescrtiption: "피터 파커 학생에서 스파이더맨이 되는 과정을 담은 스토리"),
            Movie(movieImage: UIImage(named: "blackpanther.png"),movieName: "블랙팬서", movieDescrtiption: "와칸다의 왕위 계승자 티찰과 블랙팬서가 되다"),
            Movie(movieImage: UIImage(named: "doctorstrange.png"),movieName: "닥터스트레인지", movieDescrtiption: "외과의사 닥터 스트레인지가, 히어로가 되는 과정을 담은 영화"),
            Movie(movieImage: UIImage(named: "guardians.png"),movieName: "가디언즈 오브 갤럭시", movieDescrtiption: "빌런 타노스에 맞서서 세상을 지키려는 가오겔 멤버들")]
    }
    
//vc 요청했을때 배열을 전달해주고
    
    func getMovieData() -> [Movie] {
        //내가 원래 가지고 있는 배열
        return movieDataArray
    }
    
    func updateMovieData() {
        
        let movie =  Movie(movieImage: UIImage(named: "spiderman2.png"),movieName: "스파이더맨2", movieDescrtiption: "스파이더맨 시즌2")
        
        movieDataArray.append(movie)
        
    }
    
    
}
