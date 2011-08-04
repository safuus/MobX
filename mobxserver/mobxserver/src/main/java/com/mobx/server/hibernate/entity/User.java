package com.mobx.server.hibernate.entity;

// Generated Aug 4, 2011 7:58:47 AM by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * User generated by hbm2java
 */
@Entity
@Table(name = "user")
public class User implements java.io.Serializable {
	private static final long serialVersionUID = -4286794803953962091L;
	private Integer id;
	private String username;
	private String location;
	private String iphoneUdid;
	private byte[] photo;
	private String photoPath;
	private Date createdDate;

	public User() {
	}

	public User(Date createdDate) {
		this.createdDate = createdDate;
	}

	public User(String username, String location, String iphoneUdid,
			byte[] photo, String photoPath, Date createdDate) {
		this.username = username;
		this.location = location;
		this.iphoneUdid = iphoneUdid;
		this.photo = photo;
		this.photoPath = photoPath;
		this.createdDate = createdDate;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "username", length = 128)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "location", length = 128)
	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Column(name = "iphone_udid", length = 64)
	public String getIphoneUdid() {
		return this.iphoneUdid;
	}

	public void setIphoneUdid(String iphoneUdid) {
		this.iphoneUdid = iphoneUdid;
	}

	@Column(name = "photo")
	public byte[] getPhoto() {
		return this.photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	@Column(name = "photo_path", length = 256)
	public String getPhotoPath() {
		return this.photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_date", nullable = false, length = 19)
	public Date getCreatedDate() {
		return this.createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

}