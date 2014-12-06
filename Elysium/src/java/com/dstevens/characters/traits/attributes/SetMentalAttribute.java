package com.dstevens.characters.traits.attributes;

import com.dstevens.characters.PlayerCharacter;
import com.dstevens.characters.traits.SetTrait;
import com.dstevens.characters.traits.TraitChangeStatus;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("Mental")
public class SetMentalAttribute extends SetTrait {

    @Column(name="rating")
    private int rating;

    //Hibernate only
    @Deprecated
    @SuppressWarnings("unused")
    private SetMentalAttribute() {
        this(null, 0);
    }
    
    public SetMentalAttribute(TraitChangeStatus status, int rating) {
    	super(status);
    	this.rating = rating;
    }
    
    @Override
    public PlayerCharacter apply(PlayerCharacter character) {
    	return character.withMentalAttribute(rating);
    }
    
    @Override
    public PlayerCharacter remove(PlayerCharacter character) {
    	throw new IllegalStateException("Cannot remove setting an attribute.");
    }
    
    @Override
    public String describe() {
        String nextTrait = (hasAssociatedTrait() ? String.format("with %1$s", associatedTrait().describe()) : "");
        return String.format("(%1$s) Set mental to %2$s %3$s", status(), rating, nextTrait);
    }
}