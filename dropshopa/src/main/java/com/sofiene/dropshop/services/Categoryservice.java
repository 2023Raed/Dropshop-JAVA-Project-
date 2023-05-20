package com.sofiene.dropshop.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.sofiene.dropshop.models.Category;
import com.sofiene.dropshop.repository.Categoryinterface;

@Service
public class Categoryservice {
	private Categoryinterface  categoryinterface;
	 
	 
	 
	 public  Categoryservice(Categoryinterface categoryinterface) {
	        this.categoryinterface = categoryinterface;
	    }
	    
	 public List<Category> allcategorys() {
	        return categoryinterface.findAll();
	    }
	    
	    public Category createCategory(Category b) {
	        return categoryinterface.save(b);
	    }
	    
	    // read one 
	    public Category findCategory(Long id) {
	       /* Optional<Category> optionalShow= categoryinterface.findById(id);
	        if(optionalShow.isPresent()) {
	            return optionalShow.get();
	        } else {
	            return null;
	        }
	        */
	    	System.out.print("============"+id);
	    	Category c = categoryinterface.findById(id).orElse(null);
	    	return c;
	    }
	    
	    
	   public Category updateCategory(Category category) {
			
			return categoryinterface.save(category);
		}
		
		public void deleteCategory(Long id) {
			categoryinterface.deleteById(id);
		}

}
