package lk.jiat.ee.bank.exception;


import jakarta.ejb.ApplicationException;

import java.math.BigDecimal;

@ApplicationException(rollback=true)
public class insufficientFundsException extends Exception {

    public insufficientFundsException(String accountNo , BigDecimal requested, BigDecimal available) {
        super("Insufficient funds for account " + accountNo + ": " + requested + " - " + "but only " + available);
    }
}
