include('organizer-lib.lua')
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'DT','Stun')


     info.low_nukes = S{"Stone", "Water", "Aero", "Fire", "Blizzard", "Thunder"}
    info.mid_nukes = S{"Stone II", "Water II", "Aero II", "Fire II", "Blizzard II", "Thunder II",
                       "Stone III", "Water III", "Aero III", "Fire III", "Blizzard III", "Thunder III",
                       "Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",}
    info.high_nukes = S{"Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}

    --gear.macc_hagondes = {name="Hagondes Cuffs +1", augments={'Phys. dmg. taken -3%','Mag. Acc.+29'}}
	NukeStaff={ name="Keraunos", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Magic burst mdg.+6%','INT+13',}}
	--gear.default.obi_ring = "Shiva Ring"
	set_macro_page(1, 4)
end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' then
        if spell.element == world.day_element or spell.element == world.weather_element then
            equip(sets.midcast['Elemental Magic'], {waist="Hachirin-No-Obi"})
        end
		if spell.element == world.day_element and spell.element == world.weather_element
		then
		equip(sets.midcast['Elemental Magic'], {waist="Hachirin-No-Obi",ring2="Zodiac Ring"})
		end
		
    end
end

function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets
	-- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Amalric Coif",neck=gear.ElementalGorget,ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Helios Jacket",ring1="Rajas Ring",ring2="Levia. Ring +1",
        waist=gear.ElementalBelt,legs="Hagondes Pants +1"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Myrkr'] = {ammo="Incantor Stone",
        head="Amalric Coif",neck="Sanctity Necklace",ear1="Gifted Earring",ear2="Loquac. Earring",
        body="Helios Jacket",hands="Amalric Gages",ring1="Fenrir Ring",ring2="Sangoma Ring",
        back="Pahtli Cape",waist="Yamabuki-no-Obi",legs="Artsieq Hose",feet="Arbatel Loafers"}

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {legs="Peda. Pants +1"}


    -- Fast cast sets for spells

    sets.precast.FC = {main="Marin Staff +1",ammo="Impatiens",
        head="Amalric Coif",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Helios Jacket",hands="Gende. Gages +1",ring1="Prolix Ring",ring2="Weather. Ring",
        back="Swith Cape",waist="Witful Belt",legs="Artsieq Hose",feet="Peda. Loafers +1"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear2="Crematio Earring",feet="Tutyr Sabots"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Bolelabunga",sub="Genbu's Shield",
	body="Peda. Gown +1",
	back="Pahtli Cape",waist="Acerbic Sash +1"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})
	--sets.precast.Impact = {main="Akademos",sub="Mephitis Grip",range="Aureole",
     --   head=empty,neck="Sanctity Necklace",ear1="Enchntr. Earring +1",ear2="Gwati Earring",
      --  body="Twilight Cloak",hands=gear.macc_hagondes,ring1="Weather. Ring",ring2="Sangoma Ring",
       -- back="Lugh's Cape",waist="Tengu-no-Obi",legs="Artsieq Hose",feet="Amalric Nails"}

    -- Midcast Sets

    sets.midcast.FastRecast = {ammo="Incantor Stone",
        head="Amalric Coif",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Helios Jacket",hands="Gende. Gages +1",ring1="Prolix Ring",ring2="Weather. Ring",
        back="Swith Cape",waist="Witful Belt",legs="Artsieq Hose",feet="Peda. Loafers +1"}

    sets.midcast.Cure = {ammo="Incantor Stone",
        head="Gende. Caubeen",neck="Phalaina Locket",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        body="Kaykaus Bliaut",hands="Bokwus Gloves",ring1="Ephedra Ring",ring2="Haoma's Ring",
        back="Solemnity Cape",waist="Witful Belt",legs="Acad. Pants +1",feet="Peda. Loafers +1"}

    sets.midcast.CureWithLightWeather = {ammo="Incantor Stone",
        head="Gende. Caubeen",neck="Phalaina Locket",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        body="Kaykaus Bliaut",hands="Bokwus Gloves",ring1="Ephedra Ring",ring2="Sirona's Ring",
        back="Solemnity Cape",waist="Cascade Belt",legs="Acad. Pants +1",feet="Peda. Loafers +1"}

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Regen = {main="Bolelabunga",
	head="Arbatel Bonnet",
	body=gear.enhdur_body,hands="Arbatel Bracers",
	back="Lugh's Cape",legs=gear.enhdur_legs}

    sets.midcast.Cursna = {
        neck="Malison Medallion",
        hands="Hieros Mittens",ring1="Ephedra Ring",ring2="Haoma's Ring",
        feet="Peda. Loafers +1"}

    sets.midcast['Enhancing Magic'] = {ammo="Savant's Treatise",
		head="Befouled Crown",neck="Colossus's Torque",ear1="Andoaa Earring",ear2="Gwati Earring",
		body="Peda. Gown +1",hands="Arbatel Bracers +1",ring1="Prolix Ring",ring2="Weatherspoon Ring",
		back="Merciful Cape",waist="Cascade Belt",legs="Acad. Pants +1",feet="Amalric Nails"}

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Stone Gorget",body=gear.enhdur_body,ear1="Earthcry Earring",waist="Siegel Sash",legs="Haven Hose"})
	sets.midcast.Aquaveil = { main="Vadose Rod",body=gear.enhdur_body,legs=gear.enhdur_legs}
    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {body=gear.enhdur_body,legs=gear.enhdur_legs,feet="Peda. Loafers +1"})

    sets.midcast.Protect = {body=gear.enhdur_body,legs=gear.enhdur_legs,ring1="Sheltered Ring"}
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = {body=gear.enhdur_body,legs=gear.enhdur_legs,ring1="Sheltered Ring"}
    sets.midcast.Shellra = sets.midcast.Shell


    -- Custom spell classes
    sets.midcast.MndEnfeebles = {main="akademos",sub="Mephitis Grip",range="Aureole",
        head="Befouled Crown",neck="Imbodla Necklace",ear1="Gwati Earring",ear2="Enchntr. Earring +1",
        body="Merlinic Jubbah",hands="Lurid Mitts",ring1="Sangoma Ring",ring2="Weatherspoon Ring",
        back="Lugh's Cape",waist="Rumination Sash",legs="Artsieq Hose",feet="Amalric Nails"}

    sets.midcast.IntEnfeebles = {main="Akademos",sub="Mephitis Grip",range="Aureole",
        head="Befouled Crown",neck="Imbodla Necklace",ear1="Gwati Earring",ear2="Enchntr. Earring +1",
        body="Merlinic Jubbah",hands="Lurid Mitts",ring1="Shiva Ring",ring2="Shiva Ring",
        back="Lugh's Cape",waist="Rumination Sash",legs="Artsieq Hose",feet="Amalric Nails"}

	
		
    sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles

    --Done
	sets.midcast['Dark Magic'] = {main="Akademos",sub="Mephitis Grip",range="Aureole",
        head="Amalric Coif",neck="Sanctity Necklace",ear1="Gwati Earring",ear2="Enchntr. Earring +1",
        body="Acad. Gown +1",hands="Amalric Gages",ring1="Shiva Ring",ring2="Sangoma Ring",
        back="Lugh's Cape",waist="Fucho-no-Obi",legs="Amalric Slops",feet="Amalric Nails"}

    sets.midcast.Kaustra = sets.midcast.Helix	

	--Done
    sets.midcast.Drain = {main="Akademos",sub="Mephitis Grip",range="Aureole",
        head="Amalric Coif",neck="Sanctity Necklace",ear1="Hirudinea Earring",ear2="Enchntr. Earring +1",
        body="Acad. Gown +1",hands="Amalric Gages",ring1="Shiva Ring",ring2="Sangoma Ring",
        back="Lugh's Cape",waist="Fucho-no-Obi",legs="Peda. Pants +1",feet="Amalric Nails"}

    sets.midcast.Aspir = sets.midcast.Drain

	--Done
    sets.midcast.Stun = {main="akademos",sub="Mephitis Grip",ammo="Incantor Stone",
        head="Amalric Coif",neck="Voltsurge Torque",ear1="Gwati Earring",ear2="Enchntr. Earring +1",
        body="Helios Jacket",hands="Gende. Gages +1",ring1="Prolix Ring",ring2="Weather. Ring",
        back="Lugh's Cape",waist="Witful Belt",legs="Amalric Slops",feet="Analric Nails"}
	--Done
	sets.midcast.Stun.Resistant = {main="akademos",sub="Mephitis Grip",ammo="Incantor Stone",
        head="Amalric Coif",neck="Voltsurge Torque",ear1="Gwati Earring",ear2="Enchntr. Earring +1",
        body="Merlinic Jubbah",hands="Gende. Gages +1",ring1="Sangoma Ring",ring2="Weather. Ring",
        back="Lugh's Cape",waist="Witful Belt",legs="Amalric Slops",feet="Amalric Nails"}
		
		

	--Done
	sets.midcast.Embrava ={ammo="Savant's Treatise",
		head="Befouled Crown",neck="Colossus's Torque",ear1="Gifted Earring",ear2="Mendi. Earring",
		body=gear.enhdur_body,hands="Arbatel Bracers",ring1="Weather. Ring",ring2="Prolix Ring",
		back="Swith Cape",waist="Olympus Sash",legs="Acad. Pants +1",feet="Amalric Nails"}

    -- Elemental Magic sets are default for handling low-tier nukes.
	
    --Done
	sets.midcast['Elemental Magic'] = {	main="akademos",sub="Niobid Strap",ammo="Pemphredo Tathlum",
        head="Merlinic Hood",neck="Saevus Pendant +1",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Amalric Doublet",hands="Amalric Gages",ring1="Shiva Ring",ring2="Shiva Ring",
        back="Lugh's Cape",waist="Yamabuki-no-Obi",legs="Merlinic Shalwar",feet="Amalric Nails"}
	-- sets.midcast['Elemental Magic'].LowTierNuke = {
		-- main="Akademos",sub="Niobid Strap",ammo="Pemphredo Tathlum",
        -- head="Amalric Coif",neck="Saevus Pendant +1",ear1="Crematio Earring",ear2="Friomisi Earring",
        -- body="Amalric Doublet",hands="Amalric Gages",ring1="Shiva Ring",ring2="Shiva Ring",
        -- back="Lugh's Cape",waist="Yamabuki-no-obi",legs="Amalric Slops",feet="Amalric Nails"}
	sets.midcast['Elemental Magic'].Resistant = {
		main="Akademos",sub="Niobid Strap",ammo="Pemphredo Tathlum",
        head="Merlinic Hood",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Merlinic Jubbah",hands="Amalric Gages",ring1="Shiva Ring",ring2="Shiva Ring",
        back="Lugh's Cape",waist="Yamabuki-no-obi",legs="Merlinic Shalwar",feet="Amalric Nails"}
    --Done
	-- sets.midcast['Elemental Magic'].LowTierNuke.Resistant = {
		-- main="Akademos",sub="Niobid Strap",ammo="Pemphredo Tathlum",
        -- head="Amalric Coif",neck="Sanctity Necklace",ear1="Crematio Earring",ear2="Crematio Earring",
        -- body="Merlinic Jubbah",hands="Amalric Gages",ring1="Shiva Ring",ring2="Shiva Ring",
        -- back="Lugh's Cape",waist="Yamabuki-no-obi",legs="Amalric Slops",feet="Amalric Nails"}
		
	sets.midcast['Elemental Magic'].MidTierNuke = sets.midcast['Elemental Magic']
	sets.midcast['Elemental Magic'].MidTierNuke.Resistant = sets.midcast['Elemental Magic'].Resistant
    -- Custom refinements for certain nuke tiers
	--Done
	
    sets.midcast['Elemental Magic'].HighTierNuke = {
		main="Akademos",sub="Niobid Strap",ammo="Pemphredo Tathlum",
        head="Merlinic Hood",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Merlinic Jubbah",hands="Amalric Gages",ring1="Mujin Band",ring2="Shiva Ring",
        back="Lugh's Cape",waist="Yamabuki-no-obi",legs="Merlinic Shalwar",feet="Amalric Nails"}
	--Done
    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = {
		main="Akademos",sub="Niobid Strap",ammo="Pemphredo Tathlum",
        head="Merlinic Hood",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Merlinic Jubbah",hands="Amalric Gages",ring1="Mujin Band",ring2="Shiva Ring",
        back="Lugh's Cape",waist="Yamabuki-no-obi",legs="Merlinic Shalwar",feet="Amalric Nails"}
	
	--Done
	sets.midcast.Helix={
		main="Akademos",sub="Niobid Strap",ammo="Pemphredo Tathlum",
        head="Merlinic Hood",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Merlinic Jubbah",hands="Amalric Gages",ring1="Shiva Ring",ring2="Shiva Ring",
        back="Lugh's Cape",waist="Yamabuki-no-Obi",legs="Merlinic Shalwar",feet="Amalric Nails"}
	
	--Done
    sets.midcast.Impact = {main="Akademos",sub="Niobid Strap",range="Aureole",
        head=empty,neck="Sanctity Necklace",ear1="Enchntr. Earring +1",ear2="Gwati Earring",
        body="Twilight Cloak",hands="Amalric Gages",ring1="Weather. Ring",ring2="Sangoma Ring",
        back="Lugh's Cape",waist="Tengu-no-Obi",legs="Artsieq Hose",feet="Amalric Nails"}
	sets.midcast['Elemental Magic'].Impact = {main="Akademos",sub="Mephitis Grip",range="Aureole",
        head=empty,neck="Sanctity Necklace",ear1="Enchntr. Earring +1",ear2="Gwati Earring",
        body="Twilight Cloak",hands=gear.macc_hagondes,ring1="Sangoma Ring",ring2="Weatherspoon Ring",
        back="Lugh's Cape",waist="Tengu-no-Obi",legs="Artsieq Hose",feet="Amalric Nails"}


    -- Sets to return to when not performing an action.

    -- Resting sets
	--Done
    sets.resting = {main="Snr.Msk. Rod",sub="Legion Scutum",
		head="Spurrina Coif",
		body="Acad. Gown +1",hands="Serpentes Cuffs",ring1="Sheltered Ring",
        waist="Fucho-no-Obi",legs="Assiduity Pants +1",feet="Serpentes Sabots"}


    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	--Done
	sets.idle.Town = {main="Bolelabunga",sub="Genbu's Shield",ammo="Incantor Stone",
		head="Befouled Crown",neck="Loricate torque",ear1="Sanare Earring",ear2="Loquac. Earring",
		body="Amalric Doublet",hands="Serpentes Cuffs",ring1="Defending Ring",ring2="Weatherspoon Ring",
		back="Lugh's Cape",waist="Witful Belt",legs="Assiduity Pants +1",feet="Serpentes Sabots"}

	--Done
	sets.idle.Field = {main="Bolelabunga",sub="Genbu's Shield",ammo="Impatiens",
		head="Befouled Crown",neck="Loricate torque",ear1="Sanare Earring",ear2="Loquac. Earring",
		body="Amalric Doublet",hands="Serpentes Cuffs",ring1="Defending Ring",ring2="Weatherspoon Ring",
		back="Umbra Cape",waist="Fucho-no-Obi",legs="Assiduity Pants +1",feet="Serpentes Sabots"}

	--Done PDT 50 MDT 26 DT 10 BDT 5
	sets.idle.Field.DT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Impatiens",
		head="Hagondes Hat +1",neck="Warder's Charm",ear1="Sanare Earring",ear2="Loquac. Earring",
		body="Amalric Doublet",hands=gear.macc_hagondes,ring1="Dark Ring",ring2="Defending Ring",
		back="Umbra Cape",waist="Flax Sash",legs="Assiduity Pants +1",feet="Iaso Boots"}

	--sets.idle.Field.Stun = {main="Apamajas II",sub="Mephitis Grip",ammo="Incantor Stone",
	--	head="Amalric Coif",neck="Sanctity Necklace",ear1="Enchntr. Earring +1",ear2="Gwati Earring",
	--	body="Helios Jacket",hands="Gende. Gages +1",ring1="Prolix Ring",ring2="Sangoma Ring",
	--	back="Swith Cape",waist="Ninurta's Sash",legs="Artsieq Hose",feet="Acad. Loafers +1"}

	--sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",ammo="Incantor Stone",
	--	head="Acad. Mortar. +1",neck="Loricate torque",ear1="Ethereal Earring",ear2="Loquac. Earring",
	--	body="Acad. Gown +1",hands="Serpentes Cuffs",ring1="Defending Ring",ring2="Dark Ring",
	--	back="Umbra Cape",waist="Fucho-no-Obi",legs="Assiduity Pants +1",feet="Iaso Boots"}

    -- Defense sets

	--sets.defense.PDT = {main="Terra's Staff",sub="Mephitis Grip",ammo="Incantor Stone",
	--	head="Gende. Caubeen",neck="Loricate torque",ear1="Ethereal Earring",ear2="Loquac. Earring",
	--	body="Hagondes Coat +1",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Dark Ring",
	--	back="Umbra Cape",waist="Fucho-no-Obi",legs="Assiduity Pants +1",feet="Hagondes Sabots"}

	--sets.defense.MDT = {main="Chtonic Staff",sub="Mephitis Grip",ammo="Incantor Stone",
	--	head="Amalric Coif",neck="Loricate torque",ear1="Ethereal Earring",ear2="Loquac. Earring",
	--	body="Helios Jacket",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Shadow Ring",
	--	back="Lugh's Cape",waist="Fucho-no-Obi",legs="Artsieq Hose",feet="Hagondes Sabots"}

    sets.Kiting = {feet="Iaso Boots"}

	--Done
	sets.latent_refresh = {
	main="Bolelabunga",sub="Genbu's Shield",
	head="Spurrina Coif",
	body="Acad. Gown +1",hands="Serpentes cuffs",
	waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Serpentes Sabots"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    --sets.engaged = {
    --    head="Zelus Tiara",
    --    body="Helios Jacket",hands="Bokwus Gloves",ring1="Rajas Ring",
    --    waist="Ninurta's Sash",legs="Hagondes Pants +1",feet="Hagondes Sabots"}



    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Arbatel Bonnet"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers"}
    sets.buff['Penury'] = {legs="Arbatel Pants"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants"}
    sets.buff['Celerity'] = {feet="Peda. Loafers +1"}
    sets.buff['Alacrity'] = {feet="Peda. Loafers +1"}

    sets.buff['Klimaform'] = {feet="Arbatel Loafers"}

    sets.buff.FullSublimation = {head="Acad. Mortar. +1",ear1="Savant's Earring",body="Peda. Gown +1"}
    sets.buff.PDTSublimation = {head="Acad. Mortar. +1",ear1="Savant's Earring",body="Peda. Gown +1"}

    --sets.buff['Sandstorm'] = {feet="Desert Boots"}
end