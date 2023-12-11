package ro.tuc.ds2020.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import ro.tuc.ds2020.controllers.handlers.exceptions.model.ResourceNotFoundException;
import ro.tuc.ds2020.dtos.authentification.NewUserDTO;
import ro.tuc.ds2020.dtos.UserDTO;
import ro.tuc.ds2020.dtos.builders.UserBuilder;
import ro.tuc.ds2020.entities.User;
import ro.tuc.ds2020.entities.UserType;
import ro.tuc.ds2020.repositories.UserRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;


@Service
public class UserService {
    private static final Logger LOGGER = LoggerFactory.getLogger(UserService.class);
    @Autowired
    private final UserRepository userRepository;

    @Autowired
    private PasswordEncoder encoder;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }


    public List<UserDTO> findUsers() {
        List<User> personList = new ArrayList<>();
        personList.addAll(userRepository.findAll());
        return personList.stream()
                .map(UserBuilder::toUserDTO)
                .collect(Collectors.toList());
    }
    public List<UserDTO> findAdmins() {
        List<User> personList = new ArrayList<>();
        personList.addAll(userRepository.findAll());
        return personList.stream()
                .map(UserBuilder::toUserDTO)
                .filter(userDTO -> userDTO.getType() == UserType.ADMINISTRATOR)
                .collect(Collectors.toList());
    }
    public List<UserDTO> findClients() {
        List<User> personList = new ArrayList<>();
        personList.addAll(userRepository.findAll());
        return personList.stream()
                .map(UserBuilder::toUserDTO)
                .filter(userDTO -> userDTO.getType() == UserType.CLIENT)
                .collect(Collectors.toList());
    }

    public UserDTO findUserById(Long id) {
        Optional<User> clientOptional = userRepository.findById(id);
        if (clientOptional.isPresent()) {
            LOGGER.info("User with id {} was found in db", id);
            return UserBuilder.toUserDTO(clientOptional.get()) ;
        }
        LOGGER.error("User with id {} was not found in db", id);
        throw new ResourceNotFoundException(User.class.getSimpleName() + " with id: " + id);
    }
    public List<UserDTO> findAll() {
        try{
            List<UserDTO> users = userRepository.findAll()
                    .stream().map(UserBuilder::toUserDTO)
                    .collect(Collectors.toList());
            LOGGER.info(users.size() + " users were get from database");
            return users;
        }catch (Exception e){
            LOGGER.error(e.toString());
            return new ArrayList<UserDTO>();
        }

    }
    public UserDTO getByUsername(String username) throws Exception {
        try{
            List<User> users = userRepository.findUserByUsername(username);
            if(users.size() == 0)
                throw new Exception("User not found");
            User user = users.get(0);
            LOGGER.info("User with id {} was found in db", user.getId());
            return UserBuilder.toUserDTO(user);
        } catch (Exception e) {
            LOGGER.error(e.toString());
            throw e;
        }
    }
    public void insert(NewUserDTO newUser){
        try{
            User user = UserBuilder.toUser(newUser);
            user.setPassword(encoder.encode(user.getPassword()));
            userRepository.save(user);
            LOGGER.info("User " + user.getUsername() + " was created");
        }catch (Exception e){
            LOGGER.error(e.toString());

        }
    }
    public void update(UserDTO userDTO){
        try{
            Optional<User> userOptional = userRepository.findById(userDTO.getId());
            if (userOptional.isPresent()) {
                User user = userOptional.get();
                UserBuilder.updateUser(user,userDTO);
                userRepository.save(user);
                LOGGER.info("User with id {} was update in db", userDTO.getId());
            }else{
                LOGGER.error("User with id {} was not found in db", userDTO.getId());
            }

        }catch (Exception e){
            LOGGER.error(e.toString());

        }
    }
    public void deleteAll(){
        try{
            userRepository.deleteAll();
        }catch (Exception e){
            LOGGER.error(e.toString());
            throw e;
        }

    }
    public void delete(Long id){
        try{
            userRepository.deleteById(id);
            LOGGER.info("User " + id + " was deleted");
        }catch (Exception e){
            LOGGER.error(e.toString());

        }
    }

}
