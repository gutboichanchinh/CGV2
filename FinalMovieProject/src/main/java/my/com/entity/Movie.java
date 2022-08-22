package my.com.entity;

import java.time.LocalDate;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;

import org.springframework.format.annotation.DateTimeFormat;

@Entity(name = "Movie")
public class Movie {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "IDMovie", columnDefinition = "int")
	private int id;
	@Column(name = "MovieName", columnDefinition = "nvarchar(255)")
	private String name;
	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "movieTypes", joinColumns = {
			@JoinColumn(name = "movie_id", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "type_id", nullable = false, updatable = false) })
	private Set<TypeMovie> movieTypes;
	@Column(name = "Country", columnDefinition = "nvarchar(40)")
	private String country;
	@Column(name = "Year", columnDefinition = "nvarchar(4)")
	private String year;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "DateOpen", columnDefinition = "date")
	private LocalDate dateOpen;
	@Column(name = "Time", columnDefinition = "nvarchar(5)")
	private String time;
	@Column(name = "Language", columnDefinition = "nvarchar(20)")
	private String language;
	@Column(name = "Director", columnDefinition = "nvarchar(20)")
	private String director;
	@Column(name = "MainActor", columnDefinition = "nvarchar(max)")
	private String actor;
	@Column(name = "Description", columnDefinition = "nvarchar(max)")
	private String description;

	@Lob
	private byte[] poster;

	@Lob
	private byte[] banner;

	@Column(name = "Category", columnDefinition = "int")
	private int category;
	
	@Column(name = "tralier", columnDefinition = "nvarchar(max)")
	private String tralier;

	public Movie() {
		super();
	}

	public Movie(int id, String name, Set<TypeMovie> movieTypes, String country, String year, LocalDate dateOpen,
			String time, String language, String director, String actor, String description, byte[] poster,
			byte[] banner, int category,String tralier) {
		super();
		this.id = id;
		this.name = name;
		this.movieTypes = movieTypes;
		this.country = country;
		this.year = year;
		this.dateOpen = dateOpen;
		this.time = time;
		this.language = language;
		this.director = director;
		this.actor = actor;
		this.description = description;
		this.poster = poster;
		this.banner = banner;
		this.category = category;
		this.tralier = tralier;
	}
	public Movie(String name, Set<TypeMovie> movieTypes, String country, String year, LocalDate dateOpen,
			String time, String language, String director, String actor, String description, byte[] poster,
			byte[] banner, int category,String tralier) {
		super();
		this.name = name;
		this.movieTypes = movieTypes;
		this.country = country;
		this.year = year;
		this.dateOpen = dateOpen;
		this.time = time;
		this.language = language;
		this.director = director;
		this.actor = actor;
		this.description = description;
		this.poster = poster;
		this.banner = banner;
		this.category = category;
		this.tralier = tralier;
	}


	public Movie(int id, int category) {
		super();
		this.id = id;
		this.category = category;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<TypeMovie> getMovieTypes() {
		return movieTypes;
	}

	public void setMovieTypes(Set<TypeMovie> movieTypes) {
		this.movieTypes = movieTypes;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public LocalDate getDateOpen() {
		return dateOpen;
	}

	public void setDateOpen(LocalDate dateOpen) {
		this.dateOpen = dateOpen;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public byte[] getPoster() {
		return poster;
	}

	public void setPoster(byte[] poster) {
		this.poster = poster;
	}

	public byte[] getBanner() {
		return banner;
	}

	public void setBanner(byte[] banner) {
		this.banner = banner;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}
	
	public String getTralier() {
		return tralier;
	}

	public void setTralier(String tralier) {
		this.tralier = tralier;
	}

	@Override
	public String toString() {
		return "Movie [id=" + id + ", name=" + name + ", movieTypes=" + movieTypes + ", country=" + country + ", year="
				+ year + ", dateOpen=" + dateOpen + ", time=" + time + ", language=" + language + ", director="
				+ director + ", actor=" + actor + ", description=" + description + ", poster=" + poster + ", banner="
				+ banner + ", category=" + category + "]";
	}

}
