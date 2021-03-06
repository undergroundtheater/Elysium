package com.dstevens.character.trait.status;

import com.dstevens.character.trait.ApplicableTrait;
import com.dstevens.character.trait.Trait;
import com.dstevens.character.trait.TraitQualities;

public enum Status implements Trait {

	AWESOME(0),
	NOT_AWESOME(1);
	
	private final int id;

	private Status(int id) {
		this.id = id;
	}
	
	@Override
	public Integer getId() {
		return id;
	}
	
	@Override
	public ApplicableTrait applyWith(TraitQualities qualities) {
		return new CharacterStatus(this, qualities.specialization);
	};
	
}
