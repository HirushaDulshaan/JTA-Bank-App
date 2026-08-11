package lk.jiat.ee.bank.ejb.remote;

import jakarta.ejb.Local;
import jakarta.ejb.TransactionAttribute;
import jakarta.ejb.TransactionAttributeType;
import lk.jiat.ee.bank.entity.Account;
import lk.jiat.ee.bank.entity.AccountType;
import lk.jiat.ee.bank.exception.AccountNotFundsException;
import lk.jiat.ee.bank.exception.insufficientFundsException;

import java.math.BigDecimal;
import java.util.List;

@Local
public interface AccountService {
    void creditToAccount(String accountNo ,BigDecimal amount);
    void debitToAccount(String accountNo,BigDecimal amount) throws insufficientFundsException;

    Account findByAccountNo(String accountNo) throws AccountNotFundsException;

    List<Account> findByUserEmail(String email) throws AccountNotFundsException;
    Account createAccount(String email, AccountType type , BigDecimal openingBalance);


    @TransactionAttribute(TransactionAttributeType.NOT_SUPPORTED)
    String generateAccountNumber(AccountType type);
}
