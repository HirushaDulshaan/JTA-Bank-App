package lk.jiat.ee.bank.ejb.remote;


import jakarta.ejb.Local;
import jdk.jfr.Label;
import lk.jiat.ee.bank.exception.DuplicateEmailException;

import java.rmi.RemoteException;
import java.util.zip.DataFormatException;

@Local
public interface RegisterService {

    void registerUser(String name, String email, String password,double openingBalance) throws DuplicateEmailException;



}
