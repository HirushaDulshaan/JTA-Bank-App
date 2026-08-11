package lk.jiat.ee.bank.entity;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "accounts")
@NamedQueries({
        @NamedQuery(
                name = "Account.findByAccountNo",
                query = "SELECT a FROM Account a WHERE a.accNo = :accountNo"
        ),
        @NamedQuery(
                name = "Account.findByUserEmail",
                query = "SELECT a FROM Account a WHERE a.user.email = :email ORDER BY a.id"
        )
})
public class Account {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(unique = true, nullable = false)
    private String accNo;

    private LocalDateTime openDate;

    private double balance;

    @Enumerated(EnumType.STRING)
    private AccountType accountType;

    @JoinColumn(name = "user_id")
    @ManyToOne
    private User user;

    public Account() {
    }

    public Account(String accNo, LocalDateTime openDate, double balance, AccountType accountType) {
        this.accNo = accNo;
        this.openDate = openDate;
        this.balance = balance;
        this.accountType = accountType;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccNo() {
        return accNo;
    }

    public void setAccNo(String accNo) {
        this.accNo = accNo;
    }

    public LocalDateTime getOpenDate() {
        return openDate;
    }

    public void setOpenDate(LocalDateTime openDate) {
        this.openDate = openDate;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public AccountType getAccountType() {
        return accountType;
    }

    public void setAccountType(AccountType accountType) {
        this.accountType = accountType;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}