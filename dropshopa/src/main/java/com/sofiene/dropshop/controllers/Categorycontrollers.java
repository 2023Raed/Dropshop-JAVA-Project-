package com.sofiene.dropshop.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;



import com.sofiene.dropshop.models.Category;

import com.sofiene.dropshop.services.Categoryservice;

import jakarta.servlet.http.HttpSession;


@Controller
public class Categorycontrollers {
	@Autowired
	private Categoryservice categoryservice;
	
	
	
	@GetMapping("/category")
    public String newCategory(@ModelAttribute("category") Category  category, Model model,HttpSession s) {
		
		  return "showsall.jsp";
		
		}
		
      
   
	
	
	
	@GetMapping("/categories/new")
	public String create(@ModelAttribute("category") Category category,Model model) {
		
		return "form.jsp";
	}
	
	
    
	 @GetMapping("/categories/{id}")
		public String index(Model model,@PathVariable("id") Long id) {
			Category category =categoryservice.findCategory(id);
			model.addAttribute("category", category);

			return "Showone.jsp";
		}
	 @GetMapping("/categories/edit/{id}")
		public String updateCategory(@PathVariable("id") Long categoryId, Model model) {
			Category category= categoryservice.findCategory(categoryId);
			model.addAttribute("category", category);
			return "edit.jsp";
		}
	
	    
	 @DeleteMapping("/categories/{id}")
	    public String destroy(@PathVariable("id") Long id) {
	        categoryservice.deleteCategory(id);
	        return "redirect:/home";
	    }
	

}
