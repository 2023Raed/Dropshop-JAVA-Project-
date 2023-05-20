package com.sofiene.dropshop.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sofiene.dropshop.models.Product;
import com.sofiene.dropshop.repository.Categoryinterface;
import com.sofiene.dropshop.repository.Productinterface;

@Service
public class Productservice {private final Productinterface  productRepository;


@Autowired
private Categoryinterface categoryinterface;

public Productservice(Productinterface productRepository) {
       this.productRepository = productRepository;
   }
   
public List<Product> allProducts() {
       return productRepository.findAll();
   }
   
   public Product createProduct(Product b) {
       return productRepository.save(b);
   }
   
   // read one 
   public Product findProduct(Long id) {
       Optional<Product> optionalProduct= productRepository.findById(id);
       if(optionalProduct.isPresent()) {
           return optionalProduct.get();
       } else {
           return null;
       }
   }
   
  public Product updateProduct(Product product) {
		
		return productRepository.save(product);
	}
	
	public void deleteProduct(Long id) {
		productRepository.deleteById(id);
	}
	
	public List<Product> getProductByCategorie(long id){
		List<Product> prod=new ArrayList<>();
		List<Product> pro=productRepository.findAll();
		for (Product product : pro) {
			if(product.getCategory().getId()==id) {
				prod.add(product);
			}
		}
		return prod;
	}
	public List<Product> getProductByuser(long id){
		List<Product> prodd=new ArrayList<>();
		List<Product> proo=productRepository.findAll();
		for (Product product : proo) {
			if(product.getUser().getId()==id) {
				prodd.add(product);
			}
		}
		return prodd;
	}
}
