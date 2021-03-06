/datum/species/monkey
	name = "Monkey"
	name_plural = "Monkeys"
	blurb = "Ook."

	icobase = 'icons/mob/human_races/monkeys/r_monkey.dmi'
	deform = 'icons/mob/human_races/monkeys/r_monkey.dmi'
	damage_overlays = 'icons/mob/human_races/masks/dam_monkey.dmi'
	damage_mask = 'icons/mob/human_races/masks/dam_mask_monkey.dmi'
	blood_mask = 'icons/mob/human_races/masks/blood_monkey.dmi'
	language = null
	default_language = "Chimpanzee"
	species_traits = list(NO_EXAMINE)
	skinned_type = /obj/item/stack/sheet/animalhide/monkey
	greater_form = /datum/species/human
	is_small = 1
	has_fine_manipulation = 0
	ventcrawler = 1
	show_ssd = 0
	eyes = "blank_eyes"
	death_message = "lets out a faint chimper as it collapses and stops moving..."

	scream_verb = "screeches"
	male_scream_sound = 'sound/goonstation/voice/monkey_scream.ogg'
	female_scream_sound = 'sound/goonstation/voice/monkey_scream.ogg'

	tail = "chimptail"
	bodyflags = HAS_TAIL
	reagent_tag = PROCESS_ORG
	//Has standard darksight of 2.

	unarmed_type = /datum/unarmed_attack/bite

	total_health = 75
	brute_mod = 1.5
	burn_mod = 1.5

/datum/species/monkey/handle_npc(mob/living/carbon/human/H)
	if(H.stat != CONSCIOUS)
		return
	if(prob(33) && H.canmove && isturf(H.loc) && !H.pulledby) //won't move if being pulled
		step(H, pick(cardinal))
	if(prob(1))
		H.emote(pick("scratch","jump","roll","tail"))

/datum/species/monkey/get_random_name()
	return "[lowertext(name)] ([rand(100,999)])"

/datum/species/monkey/on_species_gain(mob/living/carbon/human/H)
	..()
	H.real_name = "[lowertext(name)] ([rand(100,999)])"
	H.name = H.real_name
	H.butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/monkey = 5)

/datum/species/monkey/handle_dna(mob/living/carbon/human/H, remove)
	..()
	if(!remove)
		H.dna.SetSEState(MONKEYBLOCK, TRUE)
		genemutcheck(H, MONKEYBLOCK, null, MUTCHK_FORCED)

/datum/species/monkey/handle_can_equip(obj/item/I, slot, disable_warning = 0, mob/living/carbon/human/user)
	switch(slot)
		if(slot_l_hand)
			if(user.l_hand)
				return 2
			return 1
		if(slot_r_hand)
			if(user.r_hand)
				return 2
			return 1
		if(slot_wear_mask)
			if(user.wear_mask)
				return 2
			if(!(I.slot_flags & SLOT_MASK))
				return 2
			return 1
		if(slot_back)
			if(user.back)
				return 2
			if(!(I.slot_flags & SLOT_BACK))
				return 2
			return 1
		if(slot_handcuffed)
			if(user.handcuffed)
				return 2
			if(!istype(I, /obj/item/restraints/handcuffs))
				return 2
			return 1
		if(slot_in_backpack)
			if(user.back && istype(user.back, /obj/item/storage/backpack))
				var/obj/item/storage/backpack/B = user.back
				if(B.contents.len < B.storage_slots && I.w_class <= B.max_w_class)
					return 1
			return 2
	return 2

/datum/species/monkey/tajaran
	name = "Farwa"
	name_plural = "Farwa"

	icobase = 'icons/mob/human_races/monkeys/r_farwa.dmi'
	deform = 'icons/mob/human_races/monkeys/r_farwa.dmi'

	greater_form = /datum/species/tajaran
	default_language = "Farwa"
	flesh_color = "#AFA59E"
	base_color = "#000000"
	tail = "farwatail"
	reagent_tag = PROCESS_ORG
	has_organ = list(
		"heart" =    /obj/item/organ/internal/heart,
		"lungs" =    /obj/item/organ/internal/lungs,
		"liver" =    /obj/item/organ/internal/liver/tajaran,
		"kidneys" =  /obj/item/organ/internal/kidneys,
		"brain" =    /obj/item/organ/internal/brain,
		"appendix" = /obj/item/organ/internal/appendix,
		"eyes" =     /obj/item/organ/internal/eyes/tajaran/farwa //Tajara monkey-forms are uniquely colourblind and have excellent darksight, which is why they need a subtype of their greater-form's organ..
		)


/datum/species/monkey/vulpkanin
	name = "Wolpin"
	name_plural = "Wolpin"

	icobase = 'icons/mob/human_races/monkeys/r_wolpin.dmi'
	deform = 'icons/mob/human_races/monkeys/r_wolpin.dmi'

	greater_form = /datum/species/vulpkanin
	default_language = "Wolpin"
	flesh_color = "#966464"
	base_color = "#000000"
	tail = "wolpintail"
	reagent_tag = PROCESS_ORG
	has_organ = list(
		"heart" =    /obj/item/organ/internal/heart,
		"lungs" =    /obj/item/organ/internal/lungs,
		"liver" =    /obj/item/organ/internal/liver/vulpkanin,
		"kidneys" =  /obj/item/organ/internal/kidneys,
		"brain" =    /obj/item/organ/internal/brain,
		"appendix" = /obj/item/organ/internal/appendix,
		"eyes" =     /obj/item/organ/internal/eyes/vulpkanin/wolpin //Vulpkanin monkey-forms are uniquely colourblind and have excellent darksight, which is why they need a subtype of their greater-form's organ..
		)


/datum/species/monkey/skrell
	name = "Neara"
	name_plural = "Neara"

	icobase = 'icons/mob/human_races/monkeys/r_neara.dmi'
	deform = 'icons/mob/human_races/monkeys/r_neara.dmi'

	greater_form = /datum/species/skrell
	default_language = "Neara"
	flesh_color = "#8CD7A3"
	blood_color = "#1D2CBF"
	reagent_tag = PROCESS_ORG
	tail = null

/datum/species/monkey/unathi
	name = "Stok"
	name_plural = "Stok"

	icobase = 'icons/mob/human_races/monkeys/r_stok.dmi'
	deform = 'icons/mob/human_races/monkeys/r_stok.dmi'

	tail = "stoktail"
	greater_form = /datum/species/unathi
	default_language = "Stok"
	flesh_color = "#34AF10"
	base_color = "#000000"
	reagent_tag = PROCESS_ORG

	bodyflags = HAS_TAIL
