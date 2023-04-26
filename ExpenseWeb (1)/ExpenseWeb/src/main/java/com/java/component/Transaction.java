package com.java.component;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="transaction_tbl")
public class Transaction {
	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	private int id;
	private String description;
	private LocalDate date;
	private String category;
	private String type;
	private int amount ;
	@ManyToOne
	@JoinColumn(name="user_id")
	private RegisterUser regUser;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public LocalDate getDate() {
		return date;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public RegisterUser getRegUser() {
		return regUser;
	}
	public void setRegUser(RegisterUser regUser) {
		this.regUser = regUser;
	}
	
	

}
