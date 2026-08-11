package lk.jiat.ee.bank.entity;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "transactions")
public class Transaction {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String accountNo;

    public Transaction(String accountNo, String relatedAccountNo, TrasactionType type, double amount, LocalDateTime timestamp) {
        this.accountNo = accountNo;
        this.relatedAccountNo = relatedAccountNo;
        this.type = type;
        this.amount = amount;
        this.timestamp = LocalDateTime.now();
    }

    private String relatedAccountNo;

    @Enumerated(EnumType.STRING)
    private TrasactionType type;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAccountNo() {
        return accountNo;
    }

    public void setAccountNo(String accountNo) {
        this.accountNo = accountNo;
    }

    public String getRelatedAccountNo() {
        return relatedAccountNo;
    }

    public void setRelatedAccountNo(String relatedAccountNo) {
        this.relatedAccountNo = relatedAccountNo;
    }

    public TrasactionType getType() {
        return type;
    }

    public void setType(TrasactionType type) {
        this.type = type;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public LocalDateTime getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(LocalDateTime timestamp) {
        this.timestamp = timestamp;
    }

    public Transaction() {
    }

    private double amount;

    private LocalDateTime timestamp;



}
