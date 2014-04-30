package com.dstevens.characters;

import com.dstevens.characters.backgrounds.CharacterBackground;
import com.dstevens.characters.changes.SetTrait;
import com.dstevens.characters.merits.*;
import com.dstevens.characters.powers.CharacterDiscipline;
import com.dstevens.characters.powers.magics.*;
import com.dstevens.characters.skills.CharacterSkill;
import com.dstevens.characters.traits.*;

public class PlayerCharacterDisplayer {

    public String display(PlayerCharacter character) {
        StringBuilder builder = new StringBuilder();
        builder.append(String.format("Character:\t%1$s", character.getName())).append("\n").
                append(String.format("Clan:\t\t%1$s", character.getClan().name())).append("\n").
                append(String.format("Bloodline:\t%1$s", character.getBloodline().name())).append("\n").
                append("\n").append("Attributes").append("\n").
                append(String.format("Physical:\t %1$s %2$s", character.getPhysicalAttribute(), character.getPhysicalAttributeFocuses())).append("\n").
                append(String.format("Social:\t\t %1$s %2$s", character.getSocialAttribute(),   character.getSocialAttributeFocuses())).append("\n").
                append(String.format("Mental:\t\t %1$s %2$s", character.getMentalAttribute(),   character.getMentalAttributeFocuses())).append("\n");
        
        builder.append("\n").append("Skills").append("\n");
        character.getSkills().stream().sorted().map(((CharacterSkill t) -> display(t))).forEach((String s) -> builder.append(s).append("\n"));
        builder.append("\n").append("Backgrounds").append("\n");
        character.getBackgrounds().stream().sorted().map(((CharacterBackground t) -> display(t))).forEach((String s) -> builder.append(s).append("\n"));
        builder.append("\n").append("Disciplines").append("\n");
        character.getDisciplines().stream().sorted().map(((CharacterDiscipline t) -> display(t))).forEach((String s) -> builder.append(s).append("\n"));
        character.getThaumaturgicalPaths().stream().sorted().map(((CharacterThaumaturgy t) -> display(t))).forEach((String s) -> builder.append(s).append("\n"));
        character.getNecromanticPaths().stream().sorted().map(((CharacterNecromancy t) -> display(t))).forEach((String s) -> builder.append(s).append("\n"));
        builder.append("\n").append("Merits & Flaws").append("\n");
        character.getMerits().stream().sorted().map(((CharacterMerit t) -> display(t))).forEach((String s) -> builder.append(s).append("\n"));
        character.getFlaws().stream().sorted().map(((CharacterFlaw t) -> display(t))).forEach((String s) -> builder.append(s).append("\n"));
        return builder.toString();
    }
    
    public String displayXpLog(PlayerCharacter character) {
        StringBuilder builder = new StringBuilder();
        builder.append(String.format("XP Log for %1$s", character.getName())).append("\n");
        builder.append(String.format("XP Available: %1$s", character.getXp())).append("\n");
        character.getTraitChangeEvents().stream().map(((SetTrait t) -> t.describe())).forEach((String s) -> builder.append(s).append("\n"));
        return builder.toString();
    }

    private <T extends Enum<?>> String display(CharacterMerit t) {
        if (isPresent(t.getDetails())) {
            return String.format("%1$s (%2$s):\t(%3$s)", t.getMerit().trait(), t.getDetails(), t.getMerit().getPoints());
        }
        return String.format("%1$s:\t\t(%2$s)", t.getMerit().trait(), t.getMerit().getPoints());
    }
    
    private <T extends Enum<?>> String display(CharacterFlaw t) {
        if (isPresent(t.getDetails())) {
            return String.format("%1$s (%2$s):\t(%3$s)", t.getFlaw().trait(), t.getDetails(), -1 * t.getFlaw().getPoints());
        }
        return String.format("%1$s:\t\t(%2$s)", t.getFlaw().trait(), -1 * t.getFlaw().getPoints());
    }

    private <T extends Enum<?>> String display(CharacterDefinedTrait<T> s) {
        if (isPresent(s.getSpecialization())) {
            return String.format("%1$s (%2$s):\t %3$s", s.trait(), s.getSpecialization(), s.rating());
        }
        if (!s.getFocuses().isEmpty()) {
            return String.format("%1$s:\t%2$s %3$s", s.trait(), s.rating(), s.getFocuses());
        }
        return String.format("%1$s:\t%2$s", s.trait(), s.rating());
    }

    private boolean isPresent(String specialization) {
        return specialization != null && !specialization.isEmpty();
    }
    
    private <T extends Enum<?>> String display(RatedTrait<T> s) {
        return String.format("%1$s:\t%2$s", s.trait(), s.rating());
    }
    
}