package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "Audi3", "50.0", "New", "Ronny J"));
        productList.add(new Product(2, "Audi4", "51.0", "Old", "Ronny J"));
        productList.add(new Product(3, "Audi5", "52.0", "New", "Ronny J"));
        productList.add(new Product(4, "Audi6", "53.0", "Old", "Ronny J"));
        productList.add(new Product(5, "Audi7", "54.0", "New", "Ronny J"));
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

    @Override
    public Product findById(int id) {
        for (Product product : productList) {
            if (id == product.getId()) {
                return product;
            }
        }
        return null;
    }

    @Override
    public void update(Product product) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId() == product.getId()) {
                productList.set(i, productList.get(i));
            }
        }
    }

    @Override
    public void delete(Product product) {
        for (int i = 0; i < productList.size(); i++) {
            if (product.getId() == productList.get(i).getId()) {
                productList.remove(i);
            }
        }
    }

    @Override
    public List<Product> search(String name) {
        List<Product> products = new ArrayList<>();
        for (Product product : productList) {
            if (product.getName().contains(name)) {
                products.add(product);
            }
        }
        return products;
    }
}
