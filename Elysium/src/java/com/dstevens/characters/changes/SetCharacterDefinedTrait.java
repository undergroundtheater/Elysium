package com.dstevens.characters.changes;

import java.util.Set;

import com.dstevens.characters.PlayerCharacter;
import com.dstevens.characters.traits.CharacterDefinedTrait;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("CharacterDefinedTrait")
public class SetCharacterDefinedTrait extends SetRatedTrait {

    @Column(name="specialization")
    private final String specialization;
    
    @ElementCollection
    private final Set<String> focuses;

    //Hibernate only
    @Deprecated
    @SuppressWarnings("unused")
    private SetCharacterDefinedTrait() {
        this(null, 0, 0, null, null, null);
    }
    
    public SetCharacterDefinedTrait(TraitChangeStatus status, CharacterDefinedTrait<? extends Enum<?>> trait, TraitFactory factory) {
        this(status, trait.ordinal(), trait.rating(), trait.getSpecialization(), trait.getFocuses(), factory);
    }
    
    protected SetCharacterDefinedTrait(TraitChangeStatus status, int ordinal, int rating, String specialization, Set<String> focuses, TraitFactory factory) {
        super(status, ordinal, rating, factory);
        this.focuses = focuses;
        this.specialization = specialization;
    }

    public String specialization() {
		return specialization;
	}
    
    public Set<String> focuses() {
		return focuses;
	}
    
    public PlayerCharacter apply(PlayerCharacter character) {
        return factory.traitFor(ordinal(), rating(), specialization, focuses).applyTo(character);
    }
    
    @Override
	public PlayerCharacter remove(PlayerCharacter character) {
    	return factory.traitFor(ordinal(), rating(), specialization, focuses).removeFrom(character);
	}
    
    @Override
    public String describe() {
        String displaySpecialization = (isPresent(specialization) ? String.format(" (%1$s)", specialization) : "");
        String displayFocuses = (!focuses.isEmpty() ? String.format(" %1$s", focuses) : "");
        String nextTrait = (hasAssociatedTrait() ? String.format (" and %1$s", associatedTrait().describe()) : "");
        
        return String.format("(%1$s) Set %2$s%3$s to %4$s%5$s%6$s", status(), factory.trait(ordinal()), displaySpecialization, rating(), displayFocuses, nextTrait);
    }

    private boolean isPresent(String specialization) {
        return specialization != null && !specialization.isEmpty();
    }
}
