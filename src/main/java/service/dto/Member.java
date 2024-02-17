package service.dto;

public class Member {

   private String id;
   private String password;
   private String name;
   private String phoneNum;
   private String email;
   private String part;
   private String position;
   private String image;
   private int score;
   public String portfolio;
   
   public Member(String id, String password, String name, String phoneNum, String email, String part, String position,
         String image) {
      super();
      this.id = id;
      this.password = password;
      this.name = name;
      this.phoneNum = phoneNum;
      this.email = email;
      this.part = part;
      this.position = position;
      this.image = image;
   }
   
   
   public Member(String id, String password, String name, String phoneNum, String email, String part, String position,
            String image, String portfolio) {
         super();
         this.id = id;
         this.password = password;
         this.name = name;
         this.phoneNum = phoneNum;
         this.email = email;
         this.part = part;
         this.position = position;
         this.image = image;
         this.portfolio = portfolio;
      }


   public Member(String id, String password, String name, String phoneNum, String email, String part,
         String position) {
      super();
      this.id = id;
      this.password = password;
      this.name = name;
      this.phoneNum = phoneNum;
      this.email = email;
      this.part = part;
      this.position = position;
   }

   public Member(String id, String password, String name, String phoneNum, String email, String part,
            String position, int score) {
         super();
         this.id = id;
         this.password = password;
         this.name = name;
         this.phoneNum = phoneNum;
         this.email = email;
         this.part = part;
         this.position = position;
         this.score = score;
      }




   public Member() {
   // TODO Auto-generated constructor stub
}





public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getPassword() {
      return password;
   }
   public void setPassword(String password) {
      this.password = password;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getPhoneNum() {
      return phoneNum;
   }
   public void setPhoneNum(String phoneNum) {
      this.phoneNum = phoneNum;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getPart() {
      return part;
   }
   public void setPart(String part) {
      this.part = part;
   }
   public String getPosition() {
      return position;
   }
   public void setPosition(String position) {
      this.position = position;
   }
   public String getImage() {
      return image;
   }
   public void setImage(String image) {
      this.image = image;
   }
   
   public int getScore() {
         return score;
      }
   public void setScore(int score) {
         this.score = score;
      }
   
   public String getPortfolio() {
   return portfolio;
   }

   public void setPortfolio(String portfolio) {
      this.portfolio = portfolio;
   }





//비밀번호검사
   public boolean matchPassword(String password) {
      if (password == null) {
         return false;
      }
      return this.password.equals(password);
   }
   @Override
   public String toString() {
      return "Member [id=" + id + ", password=" + password + ", name=" + name + ", phoneNum=" + phoneNum
            + ", email=" + email + ", part=" + part + ", position=" + position + ", image=" + image + "]";
   }
   
   
   
}