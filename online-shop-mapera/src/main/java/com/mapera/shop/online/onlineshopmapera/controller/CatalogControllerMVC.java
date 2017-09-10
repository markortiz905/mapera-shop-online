package com.mapera.shop.online.onlineshopmapera.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriComponentsBuilder;

import com.mapera.shop.online.onlineshopmapera.exceptions.CatalogNotFoundException;
import com.mapera.shop.online.onlineshopmapera.model.Catalog;
import com.mapera.shop.online.onlineshopmapera.service.CatalogService;



@Controller
public class CatalogControllerMVC {

	@Autowired
	private CatalogService catalogService;
	
	@RequestMapping("/catalog")
	public String index(Model model) {
		model.addAttribute("catalogList", 
				catalogService.getSetCatalogs());
		return "catalog/index";
	}
	
	@RequestMapping("/catalog/{id}")
	public String viewCatalog(@PathVariable("id") long id, Model model) {
		
		try {
			Catalog cat = catalogService.findCatalogById(id);
			model.addAttribute("catalog", cat);
		} catch (CatalogNotFoundException e) {
			model.addAttribute("exception", new ResponseEntity<Exception>(e, HttpStatus.NOT_FOUND));
			//TODO : logging
			e.printStackTrace();
		}
		
		return "catalog/catalogView";
	}
	
	@RequestMapping(value="/catalog/{id}", method=RequestMethod.DELETE)
	@ResponseBody
	public ResponseEntity<Void> deleteCatalog(@PathVariable("id") long id, Model model) {
		Catalog cat = null;
		try {
			cat = catalogService.findCatalogById(id);
		} catch (CatalogNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (cat != null) {
			boolean deleted = catalogService.deleteCatalog(cat);
			HttpHeaders header = new HttpHeaders();
			header.set("Deleted", deleted + "");
			return new ResponseEntity<Void>(header, HttpStatus.OK);
		}
			
		return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		
	}
	
	@RequestMapping("/catalog/catalogAdd")
	public String catalogAddForm(Model model) {
		
		model.addAttribute("givenId", catalogService.requestNewId());
		
		return "catalog/catalogAdd";
	}
	
	@RequestMapping(value="/catalog/catalogSave", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Void> catalogSave(@RequestBody Catalog catalog, Model model, 
			UriComponentsBuilder ucBuilder) {
		try {
			catalogService.findCatalogById(catalog.getId());
			return new ResponseEntity<Void>(HttpStatus.CONFLICT);
		} catch (CatalogNotFoundException e) {
			//ignore
		}
		if (catalogService.createCatalog(catalog)) {
			HttpHeaders headers = new HttpHeaders();
		    headers.setLocation(ucBuilder.path("/catalog/{id}").buildAndExpand(catalog.getId()).toUri());
			return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
		}
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	}
	
	
}
