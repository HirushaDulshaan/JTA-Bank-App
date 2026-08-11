package lk.jiat.ee.bank.exception;


import jakarta.ejb.ApplicationException;

import java.math.BigDecimal;

@ApplicationException(rollback=true)
public class AccountNotFundsException extends Exception {

    public AccountNotFundsException(String accountNo) {
        super("Account " + accountNo + " not funded!");
    }
}
