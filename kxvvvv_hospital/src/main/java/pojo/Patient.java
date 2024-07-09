package pojo;

public class Patient {
    String name;//名称
    String patPwd;//密码
    String patAcc;//账号
    String address;//地址
    String phone;//手机号
    String id;//身份证号
    int balance;//余额
    int role;//已默认为2，表示权限，不需要赋值与更改
    int age;//年龄
    public String getName() {
        return name;
    }

    public String getPatPwd() {
        return patPwd;
    }

    public String getPatAcc() {
        return patAcc;
    }

    public String getAddress() {
        return address;
    }

    public String getPhone() {
        return phone;
    }

    public String getId() {
        return id;
    }

    public int getBalance() {
        return balance;
    }

    public int getRole() {
        return role;
    }

    public int getAge() {
        return age;
    }
}
