package com.dstevens.characters.traits.powers.magic.necromancy;

import com.dstevens.characters.traits.changes.ApplicableTraitChange;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("NecromanticRitual")
class SetNecromanticRitual extends ApplicableTraitChange<NecromanticRitual> {

	//Hibernate only
    @Deprecated
    @SuppressWarnings("unused")
    private SetNecromanticRitual() {
    	super();
    }
    
    public SetNecromanticRitual(int ordinal) {
    	super(ordinal);
    }

	@Override
	protected NecromanticRitual trait() {
		return NecromanticRitual.values()[ordinal];
	}
	
}
