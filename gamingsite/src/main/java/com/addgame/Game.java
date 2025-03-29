package com.addgame;

public class Game {


	    private int game_id;
	    private String title;
	    private String genre;
	    private String description;
	    private String release_date;
	    private String developer;
	    private String trailer_url;
	    private String cover_image_path;
	    private double medianRating; // New field for median rating

		public Game(int game_id, String title, String genre, String description, String release_date, String developer,
				String trailer_url, String cover_image_path) {
			super();
			this.game_id = game_id;
			this.title = title;
			this.genre = genre;
			this.description = description;
			this.release_date = release_date;
			this.developer = developer;
			this.trailer_url = trailer_url;
			this.cover_image_path = cover_image_path;
		}
		public int getGame_id() {
			return game_id;
		}
		public void setGame_id(int game_id) {
			this.game_id = game_id;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getGenre() {
			return genre;
		}
		public void setGenre(String genre) {
			this.genre = genre;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public String getRelease_date() {
			return release_date;
		}
		public void setRelease_date(String release_date) {
			this.release_date = release_date;
		}
		public String getDeveloper() {
			return developer;
		}
		public void setDeveloper(String developer) {
			this.developer = developer;
		}
		public String getTrailer_url() {
			return trailer_url;
		}
		public void setTrailer_url(String trailer_url) {
			this.trailer_url = trailer_url;
		}
		public String getCover_image_path() {
			return cover_image_path;
		}
		public void setCover_image_path(String cover_image_path) {
			this.cover_image_path = cover_image_path;
		}
		public double getMedianRating() {
	        return medianRating;
	    }

	    public void setMedianRating(double medianRating) {
	        this.medianRating = medianRating;
	    }

	    
	    
}