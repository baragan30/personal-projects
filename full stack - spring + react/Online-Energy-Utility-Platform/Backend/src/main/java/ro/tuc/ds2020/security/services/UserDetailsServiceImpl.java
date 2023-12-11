package ro.tuc.ds2020.security.services;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ro.tuc.ds2020.entities.User;
import ro.tuc.ds2020.repositories.UserRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    private static final Logger logger = LogManager.getLogger(UserDetailsServiceImpl.class);
    @Autowired
    UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = null;
        try{
            user = userRepository.findUserByUsername(username).get(0);
            logger.info("User " + username + " has been found");
            return new UserDetailsImpl(user);
        }catch (Exception e){
            String error = "User Not Found with username: " + username;
            e.printStackTrace();
            logger.error(error);
            throw new UsernameNotFoundException(error);

        }

    }
}
