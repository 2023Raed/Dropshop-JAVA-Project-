package com.sofiene.dropshop.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sofiene.dropshop.models.Category;
import com.sofiene.dropshop.models.Delivery;
import com.sofiene.dropshop.models.Loginuser;
import com.sofiene.dropshop.models.Product;
import com.sofiene.dropshop.models.User;
import com.sofiene.dropshop.services.Categoryservice;
import com.sofiene.dropshop.services.Deliveryservice;
import com.sofiene.dropshop.services.Productservice;
import com.sofiene.dropshop.services.Userservice;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class Usercontrollers {
	@Autowired
	private Userservice userServ;
	@Autowired
	private Productservice productServ;
	@Autowired
	private Categoryservice categoryservice;
	@Autowired
    private Deliveryservice deliveryServ;
	// Show the authentication page
	@GetMapping("/")
	public String loginPage(
							@ModelAttribute("newLogin") Loginuser newLogin,
							Model model) {
		
	     
	      model.addAttribute("newLogin", new Loginuser());
		return "loginpage.jsp";
	}
	// Register === Process register from === POST
		@PostMapping("/register")
		public String register(@Valid @ModelAttribute("newUser") User newUser, 
	            BindingResult result, Model model, HttpSession session) {
			newUser.setRole("user");
			
			 // call a register method in the service
	        userServ.register(newUser, result);
			
	        if(result.hasErrors()) {
	            // Be sure to send in the empty LoginUser before 
	            // re-rendering the page.
	            model.addAttribute("newLogin", new Loginuser());
	            return "RegistrationPage.jsp";
	        }
	        // No errors! 
	        // Store their ID from the DB in session, 
	        session.setAttribute("user_id", newUser.getId());
	        session.setAttribute("username", newUser.getUsername());
	        return "redirect:/";
	    }
		// === Render the success page ===
		
		// Login === Process login from === POST
		@PostMapping("/")
	    public String login(@Valid @ModelAttribute("newLogin") Loginuser newLogin, 
	            BindingResult result, Model model, HttpSession session) {
	        
	        // Add once service is implemented:
	         User user = userServ.login(newLogin, result);
	    
	        if(result.hasErrors()) {
	            model.addAttribute("newUser", new User());
	            return "loginpage.jsp";
	        }
	    
	        
	        session.setAttribute("user_id", user.getId());
	       
	        session.setAttribute("userName", user.getUsername());
	        if(user.getRole().equals("user"))
	        	return "redirect:/welcome";
	        else
	        	return "redirect:/admins";
	    }
		
		@GetMapping("/logout")
		public String logout(HttpSession sesh) {
			sesh.invalidate();
			return "redirect:/";
		}
	
		@GetMapping("/welcome")
		   public String welcome(@ModelAttribute("user") User  user, Model model,HttpSession s) {

	        Long userId = (Long) s.getAttribute("user_id");
	        
	        User us=userServ.findUser(userId);

	        // route guard
	        if(userId == null) {
	            return "redirect:/";
	        }
	        String username = (String) s.getAttribute("userName");


	        List<User> users=userServ.allusers();
	        model.addAttribute("users",users);
	        List<Category> categorys=categoryservice.allcategorys();
			model.addAttribute("category",categorys);
	        return "welcomepage.jsp";
	    }
      
		
		@GetMapping("/admins")
        public String newUser(@ModelAttribute("user") User  user,@ModelAttribute("delevery") Delivery  delevery, Model model,HttpSession s) {

            Long userId = (Long) s.getAttribute("user_id");
            User us=userServ.findUser(userId);


            // route guard
            if(userId == null || !us.getRole().equals("admin")) {
                return "redirect:/";
            }
            String username = (String) s.getAttribute("userName");

            List<Delivery> deliverys=deliveryServ.alldeliverys();
            model.addAttribute("deliverys",deliverys);

            List<Category> categorys=categoryservice.allcategorys();
            model.addAttribute("category",categorys);

            List<User> users=userServ.allusers();
            model.addAttribute("users",users);
            return "admin-dashboard.jsp";
        }
		@GetMapping("/register")
        public String register(HttpSession sesh,@ModelAttribute("newUser") User newUser,Model model) {
			model.addAttribute("newUser", new User());
            return "RegistrationPage.jsp";
        }
		
	
		
		 @DeleteMapping("/user/{id}")
		    public String destroy(@PathVariable("id") Long id) {
		        userServ.deleteUser(id);
		        return "redirect:/admins";
		    }
		 @GetMapping("/user/{id}")
			public String index(Model model,@PathVariable("id") Long id ,HttpSession s) {
				User user =userServ.findUser(id);
				 Long userId = (Long) s.getAttribute("user_id");
				model.addAttribute("user", user);
				
				  List<Category> categorys=categoryservice.allcategorys();
					model.addAttribute("category",categorys);
				
				 List<Product> products=productServ.allProducts();
			        model.addAttribute("products",products);

				return "profile.jsp";
}
		 @GetMapping("/user/edit/{id}")
         public String updatePage(@PathVariable("id") Long userId, Model model) {
             User user= userServ.findUser(userId);
             model.addAttribute("user",user);
             return "edituser.jsp";
         }
		 
		 @RequestMapping(value="/edit/{id}", method=RequestMethod.PUT)
         public String update(@PathVariable("id") Long userId ,@Valid @ModelAttribute("user") User user, BindingResult result) {
             if (result.hasErrors()) {
                 System.out.println(userId);


                 return "profile.jsp";
             } else {
                 System.out.println(result);

                 // Fetch the book object from DB
                 User orginalUser = userServ.findUser(userId);
                 orginalUser.setUsername(user.getUsername());
                 orginalUser.setEmail(user.getEmail());
                 orginalUser.setImage(user.getImage());
                 orginalUser.setAdress(user.getAdress());
                 orginalUser.setPhonenumber(user.getPhonenumber());
                 userServ.updateUser(orginalUser);

                 return "redirect:/user/"+userId.toString();
             }
         }
}
