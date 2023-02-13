package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1,"Audi3","50.0","New","Ronny J"));
        productList.add(new Product(2,"Audi4","51.0","Old","Ronny J"));
        productList.add(new Product(3,"Audi5","52.0","New","Ronny J"));
        productList.add(new Product(4,"Audi6","53.0","Old","Ronny J"));
        productList.add(new Product(5,"Audi7","54.0","New","Ronny J"));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void save(Product product) {
        product.setId(productList.size() + 1);
        productList.add(product);
    }
}
