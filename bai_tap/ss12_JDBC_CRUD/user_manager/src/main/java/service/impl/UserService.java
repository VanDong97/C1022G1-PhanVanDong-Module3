package service.impl;

import model.UserManager;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.util.List;

public class UserService implements IUserService {

    IUserRepository iUserRepository = new UserRepository();

    @Override
    public void add(UserManager userManager) {
        iUserRepository.add(userManager);
    }

    @Override
    public UserManager finById(int id) {
        return iUserRepository.findById(id);
    }

    @Override
    public List<UserManager> listAll(String country) {
        if (country == null) {
            country = "";
        }
        return iUserRepository.listAll(country);
    }

    @Override
    public void delete(UserManager userManager) {
        iUserRepository.delete(userManager);
    }

    @Override
    public void update(UserManager userManager) {
        iUserRepository.update(userManager);
    }
}
