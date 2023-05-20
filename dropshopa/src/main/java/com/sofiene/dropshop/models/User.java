package com.sofiene.dropshop.models;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="user")
public class User {
	
	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;
	 
	
	    
	    private String role;
	    
	    @NotEmpty(message="Username is required!")
	    @Size(min=3, max=30, message="Username must be between 3 and 30 characters")
	    private String username;
	    
	    public String getRole() {
			return role;
		}
		public void setRole(String role) {
			this.role = role;
		}

		@NotEmpty(message="image is required!")
	    @Size(min=0, max=300, message="Username must be between 3 and 30 characters")
	    private String image;
	    
	    @NotEmpty(message="Email is required!")
	    @Email(message="Please enter a valid email!")
	    private String email;
	    
	    @NotEmpty(message="Password is required!")
	    @Size(min=8, max=128, message="Password must be between 8 and 128 characters")
	    private String password;
	    
	    @NotEmpty(message="Adress is required!")
	    @Size(min=8, max=128, message="adress must be between 8 and 128 characters")
	    private String adress;
	    
	    @NotEmpty(message="Phone Number is required!")
	    @Size(min=8, max=128, message="Phone Number must be between 8 and 128 characters")
	    private String phonenumber;
	    
	    
	    
	    
	    
	    @Transient
	    @NotEmpty(message="Confirm Password is required!")
	    @Size(min=8, max=128, message="Confirm Password must be between 8 and 128 characters")
	    private String confirm;
	    
	    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
	   	private List<Product> product;
	    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
	   	private List<Delivery> delivery;
	    @Column(updatable=false)
	    @DateTimeFormat(pattern="yyyy-MM-dd")
	    private Date createdAt;
	    @DateTimeFormat(pattern="yyyy-MM-dd")
	    private Date updatedAt;

		public Date getCreatedAt() {
			return createdAt;
		}
		public void setCreatedAt(Date createdAt) {
			this.createdAt = createdAt;
		}
		
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getImage() {
			return image;
		}
		public void setImage(String image) {
			this.image = image;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getConfirm() {
			return confirm;
		}
		public void setConfirm(String confirm) {
			this.confirm = confirm;
		}
		
		
		public String getAdress() {
			return adress;
		}
		public void setAdress(String adress) {
			this.adress = adress;
		}
		public String getPhonenumber() {
			return phonenumber;
		}
		public void setPhonenumber(String phonenumber) {
			this.phonenumber = phonenumber;
		}
		public List<Product> getProduct() {
			return product;
		}
		public void setProduct(List<Product> product) {
			this.product = product;
		}
		public List<Delivery> getDelivery() {
			return delivery;
		}
		public void setDelivery(List<Delivery> delivery) {
			this.delivery = delivery;
		}
		public Date getUpdatedAt() {
			return updatedAt;
		}
		public void setUpdatedAt(Date updatedAt) {
			this.updatedAt = updatedAt;
		}
		@PreUpdate
	    protected void onUpdate(){
	        this.updatedAt = new Date();
	    }
	    @PrePersist
	    protected void onCreate(){
	        this.createdAt = new Date();
	    }
	  
	    public User() {}
		

	

}
