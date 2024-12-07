package com.coforge.training.get.hibernatedemo;

import jakarta.persistence.Column;                 //new version of J2EE
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

/*
 * Entity Class for Hibernate using Annotation Configuration
 */
@Entity
public class Student {
	
	@Id //primary key field 
	@GeneratedValue(strategy=GenerationType.IDENTITY) //Auto-increment
	private int rollNumber;
	
	private String name,branch;
	
	@Column(name="score")
    private double marks;

	//Generating Getters & Setters
	public int getRollNumber() {
		return rollNumber;
	}

	public void setRollNumber(int rollNumber) {
		this.rollNumber = rollNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public double getMarks() {
		return marks;
	}

	public void setMarks(double marks) {
		this.marks = marks;
	}
}
