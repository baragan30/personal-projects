package ro.tuc.ds2020.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import ro.tuc.ds2020.dtos.authentification.JwtUserResponse;
import ro.tuc.ds2020.dtos.authentification.LoginRequest;
import ro.tuc.ds2020.dtos.authentification.NewUserDTO;
import ro.tuc.ds2020.dtos.UserDTO;
import ro.tuc.ds2020.dtos.builders.UserBuilder;
import ro.tuc.ds2020.entities.UserType;
import ro.tuc.ds2020.security.pwt.JwtUtils;
import ro.tuc.ds2020.security.services.UserDetailsImpl;
import ro.tuc.ds2020.services.UserService;
import java.util.List;


@RestController
@CrossOrigin
@RequestMapping(value = "/user")
public class UserController {
    private  final UserService userService;

    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    JwtUtils jwtUtils;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping()
    public ResponseEntity<List<UserDTO>> getPersons() {
        List<UserDTO> dtos = userService.findUsers();
        return new ResponseEntity<>(dtos, HttpStatus.OK);
    }
    @PostMapping("/login")
    @ResponseBody
    public ResponseEntity<?>  authenticateRestaurant(@RequestBody LoginRequest loginRequest) {
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));

        SecurityContextHolder.getContext().setAuthentication(authentication);
        String jwt = jwtUtils.generateJwtToken(authentication);

        try{
            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
            JwtUserResponse jwtUserResponse = UserBuilder.toUserJwtResponse(userDetails,jwt);
            return ResponseEntity.ok().body(jwtUserResponse);

        }catch (Exception e){
            return ResponseEntity
                    .status(HttpStatus.NOT_FOUND)
                    .body("Wrong username or password");
        }
    }
    @PostMapping("/insert")
    public ResponseEntity<String> registerUser(@RequestBody NewUserDTO userDTO){
        userService.insert(userDTO);
        return ResponseEntity.ok().body("OK");
    }
    @GetMapping("/delete/{id}")
    public ResponseEntity<String> deleteUser(@PathVariable Long id){
        userService.delete(id);
        return ResponseEntity.ok().body("OK");
    }

    @PostMapping("/update")
    public ResponseEntity<String> updateUser(@RequestBody UserDTO user){
        userService.update(user);
        return ResponseEntity.ok().body("OK");
    }
    @GetMapping("/getall")
    public ResponseEntity<List<UserDTO>> getAll(){
        return ResponseEntity.ok().body(userService.findAll());
    }

    @GetMapping("/getAdmins")
    public ResponseEntity<List<UserDTO>> getAdmins(){
        return ResponseEntity.ok().body(userService.findAdmins());
    }
    @GetMapping("/getClients")
    public ResponseEntity<List<UserDTO>> getUsers(){
        return ResponseEntity.ok().body(userService.findClients());
    }

}
