package my.com.entity;


import java.time.LocalDate;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name ="People")

public class People {

		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private int IDUser;
		
		@Column(name = "IDRole", columnDefinition = "nvarchar(30)",unique = false, nullable = false)
		private String IDRole;
		
		@Column(name = "Name", columnDefinition = "nvarchar(100)",unique = false, nullable = false)
		private String Name;
		
		@Column(name = "UserName", columnDefinition = "nvarchar(30)",unique = true, nullable = false)
		private String UserName;
		
		@Column(name = "Password", columnDefinition = "nvarchar(max)",unique = false, nullable = false)
		private String Password;
		
		@Column(name = "Sex", columnDefinition = "bit",unique = false, nullable = false)
		private boolean Sex;
		
		@DateTimeFormat(pattern = "yyyy-MM-dd")
	    @Column(name = "BirthDay", columnDefinition = "date", unique = false, nullable = false)
	    private LocalDate birthDay;
		
		@Column(name = "Address", columnDefinition = "nvarchar(max)",unique = false, nullable = false)
		private String Address;
		
		@Column(name = "Gmail", columnDefinition = "nvarchar(100)",unique = true, nullable = false)
		private String Gmail;

		@Column(name = "Phone", columnDefinition = "nvarchar(10)",unique = true, nullable = false)
		private String Phone;
		
		@Column(name = "Member", columnDefinition = "bit",unique = false, nullable = false)
		private boolean Member;

		public People() {
			super();
		}

		@OneToMany(mappedBy = "bills")
		private List<Bill> listbill;
		
		public People(int iDUser, String iDRole, String name, String userName, String password, boolean sex,
				LocalDate birthDay, String address, String gmail, String phone, boolean member) {
			super();
			IDUser = iDUser;
			IDRole = iDRole;
			Name = name;
			UserName = userName;
			Password = password;
			Sex = sex;
			this.birthDay = birthDay;
			Address = address;
			Gmail = gmail;
			Phone = phone;
			Member = member;
		}

		public int getIDUser() {
			return IDUser;
		}

		public void setIDUser(int iDUser) {
			IDUser = iDUser;
		}

		public String getIDRole() {
			return IDRole;
		}

		public void setIDRole(String iDRole) {
			IDRole = iDRole;
		}

		public String getName() {
			return Name;
		}

		public void setName(String name) {
			Name = name;
		}

		public String getUserName() {
			return UserName;
		}

		public void setUserName(String userName) {
			UserName = userName;
		}

		public String getPassword() {
			return Password;
		}

		public void setPassword(String password) {
			Password = password;
		}

		public boolean isSex() {
			return Sex;
		}

		public void setSex(boolean sex) {
			Sex = sex;
		}

		public LocalDate getBirthDay() {
			return birthDay;
		}

		public void setBirthDay(LocalDate birthDay) {
			this.birthDay = birthDay;
		}

		public String getAddress() {
			return Address;
		}

		public void setAddress(String address) {
			Address = address;
		}

		public String getGmail() {
			return Gmail;
		}

		public void setGmail(String gmail) {
			Gmail = gmail;
		}

		public String getPhone() {
			return Phone;
		}

		public void setPhone(String phone) {
			Phone = phone;
		}

		public boolean isMember() {
			return Member;
		}

		public void setMember(boolean member) {
			Member = member;
		}

		@Override
		public String toString() {
			return "People [IDUser=" + IDUser + ", IDRole=" + IDRole + ", Name=" + Name + ", UserName=" + UserName
					+ ", Password=" + Password + ", Sex=" + Sex + ", birthDay=" + birthDay + ", Address=" + Address
					+ ", Gmail=" + Gmail + ", Phone=" + Phone + ", Member=" + Member + "]";
		}

		
	}


