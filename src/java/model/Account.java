package model;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class Account {
     private int ID;
     private String userName;
     private String email;
     private String name;
     private String gender;
     private String dateOfBirth;
     private String phoneNumber;
     private String password;
     private int role;
     private String avata;
     private String otp;
     private Date timeEffective;
     private Boolean statusOtp;
    public Account() {
    }
public Account(int ID, String name, String gender, String email, String dateOfBirth, String phoneNumber) {
        this.ID = ID;
        this.name = name;
        this.gender = gender;
        this.email = email;
        this.dateOfBirth = dateOfBirth;
        this.phoneNumber = phoneNumber;
    }
    public Account(String userName, String email, String name, String password, String avata) {
        this.userName = userName;
        this.email = email;
        this.name = name;
        this.password = password;
        this.avata = avata;
    }

    public Account(int ID, String userName, String email, String name, String gender, String dateOfBirth, String phoneNumber, String password, int role, String avata, String otp, Date timeEffective, Boolean statusOtp) {
        this.ID = ID;
        this.userName = userName;
        this.email = email;
        this.name = name;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.phoneNumber = phoneNumber;
        this.password = password;
        this.role = role;
        this.avata = avata;
        this.otp = otp;
        this.timeEffective = timeEffective;
        this.statusOtp = statusOtp;
    }

    public String getOtp() {
        return otp;
    }

    public void setOtp(String otp) {
        this.otp = otp;
    }

    public Date getTimeEffective() {
        return timeEffective;
    }

    public void setTimeEffective(Date timeEffective) {
        this.timeEffective = timeEffective;
    }

    public Boolean getStatusOtp() {
        return statusOtp;
    }

    public void setStatusOtp(Boolean statusOtp) {
        this.statusOtp = statusOtp;
    }
    public boolean isTrangThaiXacThuc() {
		return statusOtp;
	}
    public Account(int ID, String userName, String email, String name, String gender, String dateOfBirth, String phoneNumber, String password, int role, String avata) {
        this.ID = ID;
        this.userName = userName;
        this.email = email;
        this.name =  name;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.phoneNumber = phoneNumber;
        this.password = password;
        this.role = role;
        this.avata = avata;
        
    }
    public Account(int ID, String userName, String email, String name, String gender, String dateOfBirth, String phoneNumber, String password, int role, String avata,boolean statusOtp) {
        this.ID = ID;
        this.userName = userName;
        this.email = email;
        this.name =  name;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.phoneNumber = phoneNumber;
        this.password = password;
        this.role = role;
        this.avata = avata;
        this.statusOtp =  statusOtp;
        
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDayOfBirth(String dayOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getUserName() {
        return userName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getAvata() {
        return avata;
    }

    public void setAvata(String avata) {
        this.avata = avata;
    }

    @Override
    public String toString() {
        return "Account{" + "ID=" + ID + ", userName=" + userName + ", email=" + email + ", name=" + name + ", gender=" + gender + ", dateOfBirth=" + dateOfBirth + ", phoneNumber=" + phoneNumber + ", password=" + password + ", role=" + role + ", avata=" + avata + ", otp=" + otp + ", timeEffective=" + timeEffective + ", statusOtp=" + statusOtp + '}';
    }
     
}