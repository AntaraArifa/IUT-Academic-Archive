package domain;

public abstract class User {
    public int id;
    public String name;
    public String location;
    public double rating;

    public void updateLocation(String location) {
        this.location = location;
    }

    public void updateRating(double newRating) {
        this.rating = (this.rating + newRating) / 2;
    }
}
