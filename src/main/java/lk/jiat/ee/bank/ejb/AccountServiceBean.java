package lk.jiat.ee.bank.ejb;

import jakarta.ejb.*;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;
import lk.jiat.ee.bank.ejb.remote.AccountService;
import lk.jiat.ee.bank.ejb.remote.LoginService;
import lk.jiat.ee.bank.entity.Account;
import lk.jiat.ee.bank.entity.AccountType;
import lk.jiat.ee.bank.entity.User;
import lk.jiat.ee.bank.exception.AccountNotFundsException;
import lk.jiat.ee.bank.exception.insufficientFundsException;

import java.math.BigDecimal;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;


@Stateless
public class AccountServiceBean implements AccountService {

    @PersistenceContext(unitName = "bankPU")
    private EntityManager em;

    @EJB
    private LoginService loginService;


    @Override
    public void creditToAccount(String accountNo, BigDecimal amount) {

    }

    @Override
    public void debitToAccount(String accountNo, BigDecimal amount) throws insufficientFundsException {

    }

    @Override
    public Account findByAccountNo(String accountNo) throws AccountNotFundsException {
        try{
            return em.createNamedQuery("Account.findByAccountNo", Account.class)
                    .setParameter("accountNo", accountNo)
                    .getSingleResult();

        }catch (NoResultException e){
            throw new AccountNotFundsException(accountNo);
        }
    }

    @Override
    public List<Account> findByUserEmail(String email) throws AccountNotFundsException {
        return em.createNamedQuery("Account.findByUserEmail", Account.class)
                .setParameter("email", email)
                .getResultList();
    }

    @Override
    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public Account createAccount(String email, AccountType type, BigDecimal openingBalance) {
    User user = loginService.findByEmail(email);
    if (user == null) {
        throw new EJBException("Cannot Open Account, No such user");
    }
    Account account = new Account();
    account.setAccountType(type);
    account.setAccNo(generateAccountNumber(AccountType.SAVINGS));
    account.setBalance(openingBalance.doubleValue());
    account.setUser(user);
    em.persist(account);
    return account;


    }

    @TransactionAttribute(TransactionAttributeType.NOT_SUPPORTED)
    @Override
    public String generateAccountNumber(AccountType type) {


        int branCode = ThreadLocalRandom.current().nextInt(0, 9999);
        int typeCode = (type == AccountType.CURRENT) ? 2 : 1;
        long serial = System.currentTimeMillis() % 100_000_000;
        return String.format("%04d%01d%08d", branCode, typeCode, serial);
    }
}
