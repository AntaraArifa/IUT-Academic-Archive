using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_Task_1_of_DBMS
{
    internal class admin
    {
        public List<student> students = new List<student>();
        public string gradepath = @"C:\Users\USER\OneDrive\Documents\2.1\DBMS LAB TASK\Lab task 1\grades.txt";
        string student_path = @"C:\Users\USER\OneDrive\Documents\2.1\DBMS LAB TASK\Lab task 1\studentInfo.txt";
        public void load_students()
        {
            
            try
            {
                StreamReader studentRead = new StreamReader(student_path);
                string stu = studentRead.ReadLine();
                while (stu != null)
                {
                    string[] studentFrag = stu.Split(';');

                    
                    int id = Convert.ToInt32(studentFrag[0]);
                    string name = studentFrag[1];
                    int age = Convert.ToInt32(studentFrag[2]);
                    string blood_grp = studentFrag[3];
                    string dept = studentFrag[4];

                    
                    student student = new student(id, name, age, blood_grp, dept);
                    students.Add(student);
                    stu = studentRead.ReadLine();
                }

                studentRead.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        public void load_grade()
        {
            

            try
            {
                StreamReader gradeRead = new StreamReader(gradepath);
                string grade = gradeRead.ReadLine();
                while (grade != null)
                {
                    string[] gradeFrag = grade.Split(';');

                    
                    int id = Convert.ToInt32(gradeFrag[0]);
                    double gpa = Convert.ToDouble(gradeFrag[1]);
                    int sem = Convert.ToInt32(gradeFrag[2]);

                    
                    grades g = new grades(id, gpa, sem);

                    foreach (student s in students)
                    {
                        if (s.id == id)
                        {
                            s.add_grade(g);
                        }
                    }
                    grade = gradeRead.ReadLine();
                }
                gradeRead.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        public void show_avg_gpa()
        {
            string q = "id\tname\tage\tb_G\tdept\tavg_gpa";
            string w = "--\t----\t---\t---\t----\t-------\n";
            Console.WriteLine(q);
            Console.WriteLine(w);
            foreach (student student in students)
            {
                string s = $"{student.id}\t{student.name}\t{student.age}\t{student.blood_group}\t{student.department}\t{student.avg_gpa()}";
                Console.WriteLine(s);
            }
        }

        public void lowest_gpa(int id)
        {
            bool flag = false;
            foreach (student s in students)
            {
                if (s.id == id)
                {
                    flag = true;
                    grades g = s.low_gpa();
                    Console.WriteLine($"\tStudent ID\t\t\t: {s.id}");
                    Console.WriteLine($"\tStudent Name\t\t\t: {s.name}");
                    Console.WriteLine($"\tLowest gpa on semester \t\t: {g.semester}");
                    Console.WriteLine($"\tLowest gpa \t\t\t: {g.gpa}");
                }
            }

            if (!flag)
            {
                Console.WriteLine("Student Not found");
            }

        }

        public void add_grade(grades g)
        {
            bool flag = false;
            foreach (student student in students)
            {
                if (student.id == g.id)
                {
                    student.add_grade(g);
                    flag = true;
                    break;
                }
            }

            if (flag)
            {
                StreamWriter sw = File.AppendText(gradepath);
                sw.WriteLine($"{g.id};{g.gpa};{g.semester}");
                sw.Close();
                Console.WriteLine("Grade Added Successfully");
            }
        }

        public bool exist(int id)
        {
            foreach (student student in students)
            {
                if (student.id == id)
                {
                    return true;
                }
            }
            return false;
        }
    }
}
