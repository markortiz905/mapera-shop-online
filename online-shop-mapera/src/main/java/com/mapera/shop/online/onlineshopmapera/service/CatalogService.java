package com.mapera.shop.online.onlineshopmapera.service;

import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.mapera.shop.online.onlineshopmapera.exceptions.CatalogNotFoundException;
import com.mapera.shop.online.onlineshopmapera.model.Catalog;

@Component
public class CatalogService {
	private AtomicInteger aInt = new AtomicInteger();
	private Set<Catalog> setCatalog = new HashSet<>();
	
	@PostConstruct
	public void init() {
		Catalog cat1 = new Catalog("CAT1-2017","The next Big Thing!", 5, 10.5, "Product xyz", "Home/Lifestyle"
				, "Toilet Freshener", "Brand xyz", 8.0
				, 8.0, 8.0, "CODE101"
				, 5, 5, 5, 5, 2, "{color:red}", "http://ssl-product-images.www8-hp.com/digmedialib/prodimg/lowres/c05149188.png," + 
				"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0RgvtM4apSORcTf6wCtdXNe5BONs_x270_NvFWE4hnnQ_PoRE");
		cat1.setId(aInt.incrementAndGet());
		setCatalog.add(cat1);
		Catalog cat2 = new Catalog("CAT2-2017","The next Big Thing2", 5, 10.5, "Product xyz", "Home/Lifestyle"
				, "Toilet Freshener", "Brand xyz", 8.0
				, 8.0, 8.0, "CODE101"
				, 5, 5, 5, 5, 2, "{color:red}", "http://challengeforsustainability.org/wp-content/uploads/2014/07/energystar-laptop1.png," +
				"https://img.classistatic.com/crop/200x150/i.ebayimg.com/00/s/NjgwWDgwMA==/z/THwAAOSww9xZMHpZ/$_19.jpg");
		
		cat2.setId(aInt.incrementAndGet());
		setCatalog.add(cat2);
	}
	
	public boolean createCatalog(Catalog catalog) {
		catalog.setId(aInt.incrementAndGet());
		return setCatalog.add(catalog);
	}
	
	public boolean updateCatalog(Catalog c) {
		if (setCatalog.contains(c)) {
			Catalog updatedCatalog = setCatalog.parallelStream()
			.filter(cat -> cat.getSku().equals(c.getSku()))
			.map(cat->c).findFirst().get();
			return updatedCatalog.equals(c);
		}
		return false;
	}
	
	public boolean deleteCatalog(Catalog c) {
		return setCatalog.remove(c);
	}

	public Set<Catalog> getSetCatalogs() {
		return setCatalog;
	}

	public Catalog findCatalogById(long id) throws CatalogNotFoundException {
		return setCatalog.parallelStream().filter(c->c.getId()==id).findFirst()
				.orElseThrow(() -> new CatalogNotFoundException("Catalog id of " + id + " not found"));
	}

	public long requestNewId() {
		return aInt.get() + 1;
	}
}