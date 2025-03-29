package com.reviews;



import java.sql.Timestamp;

public class Review {
    private int reviewId;
    private int userId;
    private int gameId;
    private double rating;
    private String comment;
    private Timestamp createdAt;
    private String userName; // User's name

    // Getters and Setters
    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getGameId() {
        return gameId;
    }

    public void setGameId(int gameId) {
        this.gameId = gameId;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double d) {
        this.rating = d;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp string) {
        this.createdAt = string;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

	public void setCreatedAt(String string) {
		// TODO Auto-generated method stub
		
	}
}


