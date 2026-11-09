using System;
using System.Linq;
using Lab_Task_09_01;


class Program
{
    static void Main()
    {
        MyList<Person> personList = new MyList<Person>();
        MyList<Student> studentList = new MyList<Student>();

   
        personList.AddItem(new Person("Antara", "BashbariRoad", 21));
        personList.AddItem(new Person("Farhan", "IqbalRoad", 23));
        personList.AddItem(new Person("Labibah", "Khulshi", 21));

       
        studentList.AddItem(new Student("Antara", "BashbariRoad", 21,"IUT"));
        studentList.AddItem(new Student("Farhan", "IqbalRoad", 23, "AUST"));

       
        Console.WriteLine("Persons:");
        foreach (Person person in personList.ToArray())
        {
            Console.WriteLine($"{person.Name}, Age: {person.Age}, Address: {person.Address}");
        }

        Console.WriteLine("\nStudents:");
        foreach (Student student in studentList.ToArray())
        {
            Console.WriteLine($"{student.Name}, Age: {student.Age}, Address: {student.Address}, University: {student.UniversityName}");
            student.Study();
        }
    }
}