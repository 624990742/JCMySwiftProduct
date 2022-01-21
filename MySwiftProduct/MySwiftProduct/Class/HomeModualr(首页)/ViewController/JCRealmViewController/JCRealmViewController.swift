//
//  JCRealmViewController.swift
//  MySwiftProduct
//
//  Created by jiachen on 2021/5/27.
//  Copyright © 2021 jiachen. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift


class JCRealmViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.testInsertManyStudent()
//        self.testInsertStudentWithPhotoBook()
//        JCTXTTestTool.defalutTest()
//        JCTXTTestTool.addTxtData()
        
        JCRealmSwiftTestTool.createJosnData()
//        JCRealmSwiftTestTool.getTxtData()
    }
    
    

    
    
  
}


extension JCRealmViewController {
    
          // MARK: - 增
          //测试在数据库中插入多个拥有多本书并且有头像的学生对象
          func testInsertManyStudent() {
              var stus = [Student]()
      
              for i in 100...144 {
                  let stu = Student()
                  stu.name = "码农晨仔\(i)"
                  stu.weight = 151
                  stu.age = 26
                  stu.id = i
      
                  // 头像
                  stu.setPhotoWitName("cat")
                  let birthdayStr = "1993-06-10"
                  let dateFormatter = DateFormatter()
                  dateFormatter.dateFormat = "YYYY-MM-dd"
                  stu.birthday = dateFormatter.date(from: birthdayStr)! as NSDate
                  stus.append(stu)
              }
      
              JCRealmTestTool.insertStudents(by: stus)
          }
      
      
      
      //测试在数据库中插入一个拥有多本书并且有头像的学生对象
      func testInsertStudentWithPhotoBook() {
          let stu = Student()
          stu.name = "极客学伟_有头像_有书"
          stu.weight = 151;
          stu.age = 26
          stu.id = 3;
          // 头像
          stu.setPhotoWitName("cat")

          let bookFubaba = Book.init(name: "富爸爸穷爸爸", author: "[美]罗伯特.T.清崎")
          let bookShengmingbuxi = Book.init(name: "生命不息, 折腾不止", author: "罗永浩")
          let bookDianfuzhe = Book(value: ["颠覆着: 周鸿祎自传","周鸿祎"])
          stu.books.append(bookFubaba);
          stu.books.append(bookShengmingbuxi);
          stu.books.append(bookDianfuzhe);

          JCRealmTestTool.insertStudent(by: stu)
      }

      
      /// 保存头像数据
      func testInsterPhotoStudent() {
          let stu = Student()
          stu.name = "码农晨仔的头像"
          stu.age = 26
          stu.id = 2;
          stu.setPhotoWitName("cat")
          JCRealmTestTool.insertStudent(by: stu)
      }


      func testInsterStudent() {
          let stu = Student()
          stu.name = "码农晨仔"
          stu.age = 26
          stu.id = 2;

          let birthdayStr = "1993-06-10"
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "YYYY-MM-dd"
          stu.birthday = dateFormatter.date(from: birthdayStr)! as NSDate

          stu.weight = 160
          stu.address = "北京市海淀区"

          JCRealmTestTool.insertStudent(by: stu)
      }


      // MARK: - 查
      // 通过主键查询
      func testSearchStudentByID(){
          let student = JCRealmTestTool.getStudent(from: 110)
          if let studentL = student {
              print(studentL.name)
          }
      }

      // 条件查询
      func testSearchTermStudent()  {
          let students = JCRealmTestTool.getStudentByTerm("name = '码农晨仔_110'")
          if students.count == 0 {
              print("未查询到任何数据")
              return
          }
          for student in students {
              print(student.name,student.weight)
          }
      }

      /// 排序查询
      func testGetStudentByIdSorted() {
          let stus = JCRealmTestTool.getStudentByIdSorted(false)
          for stu in stus {
              print(stu.id)
          }
      }


      // MARK: - 改
      /// 批量更改
      func testUpdateStudents() {
          var stus = [Student]()
          for i in 100...144 {
              let stu = Student()
              stu.name = "极客学伟改名_\(i)"
              stu.weight = 148;
              stu.age = 27
              stu.id = i;
              stus.append(stu)
          }
          JCRealmTestTool.updateStudent(students: stus)
      }

      /// 批量更改年龄
      func testUpdateStudentsAge() {
          JCRealmTestTool.updateStudentAge(age: 18)
      }

      // MARK: - 删
      /// 删除id 为 3 的学生
      func testDeleteOneStudent() {
          let stu = JCRealmTestTool.getStudent(from: 3)
          if stu != nil {
              JCRealmTestTool.deleteStudent(student: stu!)
          }
      }

      /// 删除所有
      func testDeleteAllStudent() {
          let stus = JCRealmTestTool.getStudents()
          JCRealmTestTool.deleteStudent(students: stus)
      }
      
      
}
