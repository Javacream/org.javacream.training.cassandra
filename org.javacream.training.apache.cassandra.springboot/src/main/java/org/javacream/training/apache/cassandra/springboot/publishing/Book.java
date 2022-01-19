package org.javacream.training.apache.cassandra.springboot.publishing;

import org.springframework.data.cassandra.core.cql.PrimaryKeyType;
import org.springframework.data.cassandra.core.mapping.PrimaryKeyColumn;
import org.springframework.data.cassandra.core.mapping.Table;

@Table("PUBLISHING")
public class Book {

	@PrimaryKeyColumn(name = "publisher_name", ordinal = 0, type = PrimaryKeyType.PARTITIONED)
	private String publisherName;
	@PrimaryKeyColumn(name = "pages", ordinal = 2, type = PrimaryKeyType.CLUSTERED)
	private int pages;
	private double price;
	private String isbn;
	private boolean available;
	@PrimaryKeyColumn(name = "title", ordinal = 1, type = PrimaryKeyType.CLUSTERED)
	private String title;
	public String getPublisherName() {
		return publisherName;
	}
	public void setPublisherName(String publisherName) {
		this.publisherName = publisherName;
	}
	public int getPages() {
		return pages;
	}
	public void setPages(int pages) {
		this.pages = pages;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public boolean isAvailable() {
		return available;
	}
	public void setAvailable(boolean available) {
		this.available = available;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (available ? 1231 : 1237);
		result = prime * result + ((isbn == null) ? 0 : isbn.hashCode());
		result = prime * result + pages;
		long temp;
		temp = Double.doubleToLongBits(price);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((publisherName == null) ? 0 : publisherName.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Book other = (Book) obj;
		if (available != other.available)
			return false;
		if (isbn == null) {
			if (other.isbn != null)
				return false;
		} else if (!isbn.equals(other.isbn))
			return false;
		if (pages != other.pages)
			return false;
		if (Double.doubleToLongBits(price) != Double.doubleToLongBits(other.price))
			return false;
		if (publisherName == null) {
			if (other.publisherName != null)
				return false;
		} else if (!publisherName.equals(other.publisherName))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}
	public Book(String publisherName, int pages, double price, String isbn, boolean available, String title) {
		super();
		this.publisherName = publisherName;
		this.pages = pages;
		this.price = price;
		this.isbn = isbn;
		this.available = available;
		this.title = title;
	}
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Book [publisherName=" + publisherName + ", pages=" + pages + ", price=" + price + ", isbn=" + isbn
				+ ", available=" + available + ", title=" + title + "]";
	}
	
	
}
