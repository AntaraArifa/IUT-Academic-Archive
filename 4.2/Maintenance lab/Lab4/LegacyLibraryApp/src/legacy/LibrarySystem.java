package legacy;

import java.util.ArrayList;
import java.util.List;

class Book {
    public int id;
    public String title;
    public String author;
    public boolean available;

    public Book(int id, String title, String author) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.available = true;
    }
}

public class LibrarySystem {
    private List<Book> books = new ArrayList<>();

    public void addBook(int id, String title, String author) {
        Book b = new Book(id, title, author);
        books.add(b);
        System.out.println("Book added: " + title);
    }

    public void issueBook(int id) {
        for (Book b : books) {
            if (b.id == id) {
                if (b.available == true) {
                    b.available = false;
                    System.out.println("Book issued: " + b.title);
                } else {
                    System.out.println("Book is not available");
                }
            }
        }
    }

    public void returnBook(int id) {
        for (Book b : books) {
            if (b.id == id) {
                b.available = true;
                System.out.println("Book returned: " + b.title);
            }
        }
    }

    public void searchBookByTitle(String title) {
        for (Book b : books) {
            if (b.title.equalsIgnoreCase(title)) {
                System.out.println("Found book: " + b.title + " by " + b.author);
            }
        }
    }

    public void showAllBooks() {
        for (Book b : books) {
            System.out.println(
                    b.id + " | " + b.title + " | " + b.author + " | Available: " + b.available
            );
        }
    }

    public static void main(String[] args) {
        LibrarySystem ls = new LibrarySystem();

        ls.addBook(1, "Software Maintenance", "Ian Sommerville");
        ls.addBook(2, "Reverse Engineering", "Elliot Chikofsky");
        ls.addBook(3, "Clean Code", "Robert Martin");

        ls.issueBook(1);
        ls.returnBook(1);
        ls.searchBookByTitle("Clean Code");
        ls.showAllBooks();
    }
}