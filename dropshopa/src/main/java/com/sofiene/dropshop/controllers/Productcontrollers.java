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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sofiene.dropshop.models.Category;
import com.sofiene.dropshop.models.Product;
import com.sofiene.dropshop.models.User;
import com.sofiene.dropshop.services.Categoryservice;
import com.sofiene.dropshop.services.Productservice;
import com.sofiene.dropshop.services.Userservice;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class Productcontrollers {
	@Autowired
	private Productservice productService;
	@Autowired
	private Userservice userservice;
	@Autowired
	private Categoryservice categoryservice;

//	@GetMapping("/products/{id}")
//    public String newProduct(@ModelAttribute("product")Product  product, Model model, @PathVariable("id") Long categoryId,HttpSession s) {
//		
//		Long userId = (Long) s.getAttribute("user_id");
////		Long categoryId =(Long) s.getAttribute("category_id");
//		// route guard
//		if(userId == null) {
//			return "redirect:/";
//		}
//		if (categoryId ==null) {
//			return"redirect:/";
//		}
//		String userName = (String) s.getAttribute("userName");
//		
//		List<Product> products = productService.allProducts();
//		model.addAttribute("products",products);
//        return "showall.jsp";
//    }

	@GetMapping("/seller")
	public String create(@ModelAttribute("product") Product product, Model model) {

		List<Category> categorys = categoryservice.allcategorys();
		model.addAttribute("category", categorys);

		return "contactus.jsp";
	}

	@PostMapping("/create/product")
	public String create(@Valid @ModelAttribute("product") Product product, BindingResult result, Model model,
			HttpSession session, HttpServletRequest req, RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			List<Category> categorys = categoryservice.allcategorys();
			model.addAttribute("category", categorys);

			return "redirect:/seller" ;
		} else {

			Long userId = (Long) session.getAttribute("user_id");
			// Find user by ID
			User currentUser = userservice.findUserById(userId);

			Long categoryId = Long.valueOf(req.getParameter("category"));
			// Find user by ID
			Category currentCategory = categoryservice.findCategory(categoryId);

			product.setUser(currentUser);
			product.setCategory(currentCategory);
			// Create a book in the DB
			productService.createProduct(product);
			redirectAttributes.addFlashAttribute("message", "you succcefuly create a product");
			return "redirect:/welcome";
		}
	}

	@GetMapping("/products/show/{id}")
	public String index(Model model, @PathVariable("id") Long id) {
		Product product = productService.findProduct(id);
		model.addAttribute("product", product);

		return "Show-one-product.jsp";
	}

	@GetMapping("/products/edit/{id}")
	public String updatePage(@PathVariable("id") Long productId, Model model) {
		Product product = productService.findProduct(productId);
		model.addAttribute("product", product);
		return "edit.jsp";
	}

	@RequestMapping(value = "/products/{id}", method = RequestMethod.PUT)
	public String update(@Valid @ModelAttribute("product") Product product, BindingResult result) {
		if (result.hasErrors()) {
			return "edit.jsp";
		} else {
			// Fetch the book object from DB
			Product orginalProduct = productService.findProduct(product.getId());
			product.setUser(orginalProduct.getUser());

			productService.updateProduct(product);
			return "redirect:/products";
		}
	}

	@DeleteMapping("/productsdelete/{id}")
	public String destroy(@PathVariable("id") Long id) {
		productService.deleteProduct(id);
		return "redirect:/welcome";
	}

	@GetMapping("/productbycat/{id}")
	public String getprodbycat(Model model, @PathVariable("id") String id) {

		List<Category> categorys = categoryservice.allcategorys();
		model.addAttribute("category", categorys);

		List<Product> prod = productService.getProductByCategorie(Long.parseLong(id));
		System.out.println(prod.get(0));
		model.addAttribute("products", prod);
		return "showall.jsp";
	}
	
	@GetMapping("/productbyuser/{id}")
	public String getprodbyuser(Model model, @PathVariable("id") String id , HttpSession s) {
		 Long userId = (Long) s.getAttribute("user_id");
		List<Category> categorys = categoryservice.allcategorys();
		model.addAttribute("category", categorys);

		List<Product> prodd = productService.getProductByuser(Long.parseLong(id));
		System.out.println(prodd.get(0));
		model.addAttribute("products", prodd);
		return "showyourproduct.jsp";
	}
	
}
