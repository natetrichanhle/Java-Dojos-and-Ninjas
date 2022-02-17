package com.nate.dojosandninjas.services;

import java.util.List;
import java.util.Optional;

import com.nate.dojosandninjas.models.Dojo;
import com.nate.dojosandninjas.repositories.DojoRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DojoService {

	@Autowired
	DojoRepository dojoRepository;

	// returns all the dojos
	public List<Dojo> allDojos() {
		return dojoRepository.findAll();
	}

	// creates a dojo
	public Dojo createDojo(Dojo b) {
		return dojoRepository.save(b);
	}

	// retrieves a dojo
	public Dojo findDojo(Long id) {
		Optional<Dojo> optionalDojo = dojoRepository.findById(id);
		if (optionalDojo.isPresent()) {
			return optionalDojo.get();
		} else {
			return null;
		}
	}

	public Dojo updateDojo(Dojo dojo, Long id) {
		Optional<Dojo> optionalDojo = dojoRepository.findById(id);
		if(optionalDojo.isPresent()) {
			return dojoRepository.save(dojo);
		} else {
			return null;
		}
	}

	public void deleteDojo(Long id) {
		Optional<Dojo> optionalDojo = dojoRepository.findById(id);
		if(optionalDojo.isPresent()) {
			dojoRepository.deleteById(id);			
		}
	}
}

