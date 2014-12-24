package com.dstevens.characters.traits.changes;

import org.hibernate.annotations.ForeignKey;

import com.dstevens.characters.PlayerCharacter;

import javax.persistence.CascadeType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

@SuppressWarnings("deprecation")
@Entity
@DiscriminatorValue("RemoveTrait")
class RemoveTrait extends TraitChange {

	@OneToOne(cascade={CascadeType.ALL})
	@ForeignKey(name="TraitChange_TraitToRemove_FK", inverseName="TraitToRemove_TraitChange_FK")
	private final TraitChange traitToRemove;

	//Hibernate only
    @Deprecated
    @SuppressWarnings("unused")
    private RemoveTrait() {
        this(null);
    }
	
	protected RemoveTrait(TraitChange traitToRemove) {
		super();
		this.traitToRemove = traitToRemove;
	}

	@Override
	public PlayerCharacter apply(PlayerCharacter character) {
		traitToRemove.stream().forEach((TraitChange t) -> t.remove(character));
        return character;
	}
	
	@Override
	public PlayerCharacter remove(PlayerCharacter character) {
		traitToRemove.stream().forEach((TraitChange t) -> t.apply(character));
        return character;
	}

	@Override
	public String describe() {
		return String.format("Removing %1$s", traitToRemove.describe());
	}

}
