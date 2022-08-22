package my.com.entity;

import java.io.Serializable;
import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Event")
public class Event implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idEvent;

	@Column(name = "EventName", columnDefinition = "nvarchar(40)", unique = false, nullable = false)
	private String eventName;

	@Column(name = "Discount", columnDefinition = "nvarchar(20)", unique = false, nullable = false)
	private String discount;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "StartDay", columnDefinition = "date", unique = false, nullable = false)
	private LocalDate startDay;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "EndDay", columnDefinition = "date", unique = false, nullable = false)
	private LocalDate endDay;

	@Column(name = "EventDescription", columnDefinition = "nvarchar(400)", unique = false, nullable = false)
	private String eventDescription;

	@Lob
	private byte[] Image;

	public Event() {
	}

	public Event(String eventName, String discount, LocalDate startDay, LocalDate endDay, String eventDescription,
			byte[] image) {
		super();
		this.eventName = eventName;
		this.discount = discount;
		this.startDay = startDay;
		this.endDay = endDay;
		this.eventDescription = eventDescription;
		Image = image;
	}

	public Event(int idEvent, String eventName, String discount, LocalDate startDay, LocalDate endDay,
			String eventDescription, byte[] image) {
		super();
		this.idEvent = idEvent;
		this.eventName = eventName;
		this.discount = discount;
		this.startDay = startDay;
		this.endDay = endDay;
		this.eventDescription = eventDescription;
		Image = image;
	}

	public int getIdEvent() {
		return idEvent;
	}

	public void setIdEvent(int idEvent) {
		this.idEvent = idEvent;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public LocalDate getStartDay() {
		return startDay;
	}

	public void setStartDay(LocalDate startDay) {
		this.startDay = startDay;
	}

	public LocalDate getEndDay() {
		return endDay;
	}

	public void setEndDay(LocalDate endDay) {
		this.endDay = endDay;
	}

	public String getEventDescription() {
		return eventDescription;
	}

	public void setEventDescription(String eventDescription) {
		this.eventDescription = eventDescription;
	}

	public byte[] getImage() {
		return Image;
	}

	public void setImage(byte[] image) {
		Image = image;
	}
	

}
