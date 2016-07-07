include('organizer-lib')
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

    gear.default.weaponskill_waist = "Windbuffet Belt +1"

    select_default_macro_book()
end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' then
        if spell.element == world.day_element or spell.element == world.weather_element then
            equip(sets.midcast['Elemental Magic'], {waist="Hachirin-No-Obi"})
        end
    end
end

function select_default_macro_book()
    set_macro_page(1, 15)
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Precast sets
    --------------------------------------
	sets.collect={body="Amalric Doublet",legs="Azimuth Tights",hands="Azimuth Gloves",feet="Azimuth Gaiters"}
    -- Precast sets to enhance JAs
    sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
    sets.precast.JA['Life cycle'] = {head="Azimuth Hood +1",body="Geo. Tunic"}
	sets.precast.JA['Full Circle']={head="Azimuth Hood +1"}

    -- Fast cast sets for spells

    sets.precast.FC = {ammo="Dunna",
        head="Amalric coif",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Helios Jacket",hands="Hagondes Gloves",ring1="Prolix Ring","Weather. Ring",
        back="Swith Cape",waist="Witful Belt",legs="Artsieq Hose",feet="Amalric Nails"}

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Tamaxchi",sub="Genbu's Shield",back="Pahtli Cape"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {hands="Bagua Mitaines +1"})

    
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Amalric coif",neck=gear.ElementalGorget,ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Helios Jacket",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="Shiva Ring",
        back="Refraction Cape",waist=gear.ElementalBelt,legs="Amalric Slops",feet="Hagondes Sabots"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Flash Nova'] = {ammo="Ghastly Tathlum",
        head="Amalric coif +1",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Helios Jacket",hands="Yaoyotl Gloves",ring1="Shiva Ring ",ring2="Weather. Ring",
        back="Toro Cape",waist="Snow Belt",legs="Amalric Slops",feet="Hagondes Sabots"}

    sets.precast.WS['Starlight'] = {ear2="Moonshade Earring"}

    sets.precast.WS['Moonlight'] = {ear2="Moonshade Earring"}
	
	sets.precast.WS['Exudation']={
	head="Geo. Galero +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
	body="Helios Jacket",hands="Yaoyotl Gloves",ring1="Shiva Ring ",ring2="Shiva Ring",
	back="Refraction Cape",waist="Windbuffet belt +1",legs="Amalric Slops",feet="Hagondes Sabots"}


    --------------------------------------
    -- Midcast sets
    --------------------------------------

    -- Base fast recast for spells
    sets.midcast.FastRecast = {main="Solstice",sub="Genbu Shield",
        head="Amalric coif",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Helios Jacket",hands="Hagondes Gloves",ring1="Prolix Ring","Weather. Ring",
        back="Swith Cape",waist="Witful Belt",legs="Artsieq Hose",feet="Amalric Nails"}

    sets.midcast.Geomancy = {main="Solstice",Sub="Genbu's Shield",range="Dunna",
		head="Azimuth Hood +1",neck="Deceiver's Torque",ear1="Gwati Earring","Loquac. Earring",
		body="Bagua Tunic +1",hands="Geo. Mitaines +1",
		back="Lifestream Cape",waist="Pythia Sash +1",legs="Bagua Pants +1",feet="Medium's Sabots"}
		
    sets.midcast.Geomancy.Indi = {main="Solstice",Sub="Genbu's Shield",range="Dunna",
		head="Azimuth Hood +1",neck="Deceiver's Torque",ear1="Gwati Earring","Loquac. Earring",
		body="Bagua Tunic +1",hands="Geo. Mitaines +1",
		back="Lifestream Cape",waist="Pythia Sash +1",legs="Bagua Pants +1",feet="Medium's Sabots"}

    sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",
        body="Heka's Kalasiris",hands="Bokwus Gloves",ring1="Haoma's Ring",ring2="Ephedra Ring",
        back="Swith Cape",legs="Assiduity Pants +1",feet="Medium's Sabots"}
    
    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Protectra = {body=gear.enhdur_body,legs=gear.enhdur_legs,ring1="Sheltered Ring"}
    sets.midcast.Shellra = {body=gear.enhdur_body,legs=gear.enhdur_legs,ring1="Sheltered Ring"}
    sets.midcast.Stoneskin = {body=gear.enhdur_body,neck="Stone Gorget",ear1="Earthcry Earring",waist="Siegel Sash",legs="Haven Hose"}
	sets.midcast.Aquaveil = {body=gear.enhdur_body,legs=gear.enhdur_legs,main="Vadose Rod"}
	
	sets.midcast['Elemental Magic'] = {main="Grioavolr",sub="Niobid Strap",ammo="Dunna",
		head="Merlinic Hood",neck="Mizukage-no-Kubikazari",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Merlinic Jabbuh",hands="Amalric Gages",ring1="Mujin Ring",ring2="Shiva Ring",
		back="Toro Cape",waist="Yamabuki-no-obi",legs="Merlinic Shalwar",feet="Amalric Nails"}
	sets.midcast['Elemental Magic'].Resistant = {main="Grioavolr",sub="Niobid Strap",ammo="Dunna",
		head="Merlinic Hood",neck="Mizukage-no-Kubikazari",ear1="Gwati Earring",ear2="Enchntr. Earring +1",
		body="Merlinic Jabbuh",hands="Amalric Gages",ring1="Shiva Ring",ring2="Shiva Ring",
		back="Toro Cape",waist="Yamabuki-no-obi",legs="Merlinic Shalwar",feet="Amalric Nails"}		
	sets.midcast['Enfeebling Magic'] = {main="Grioavolr",sub="Mephitis Grip",ammo="Dunna",
		head="Befouled Crown",neck="Imbodla necklace",ear1="Gwati Earring",ear2="Enchntr. Earring +1",
		body="Amalric Doublet",hands="Lurid Mitts",ring1="Shiva Ring",ring2="Shiva Ring",
		back="Ogapepo Cape",waist="Ovate Rope",legs="Merlinic Shalwar",feet="Medium's Sabots"}	
	sets.midcast['Enfeebling Magic'].Resistant ={main="Grioavolr",sub="Mephitis Grip",ammo="Dunna",
		head="Befouled Crown",neck="Imbodla necklace",ear1="Gwati Earring",ear2="Enchntr. Earring +1",
		body="Amalric Doublet",hands="Amalric Gages",ring1="Weather. Ring",ring2="Sangoma Ring",
		back="Ogapepo Cape",waist="Ovate Rope",legs="Merlinic Shalwar",feet="Medium's Sabots"}	
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- Resting sets
    sets.resting = {main="Bolelabunga",sub="Genbu's Shield",range="Dunna",
        head="Befouled Crown",neck="Loricate Torque",ear1="Sanare Earring",ear2="Loquac. Earring",
        body="Amalric Doublet",hands="Serpentes Cuffs",ring1="Defending Ring",ring2="Sheltered Ring",
        back="Swift Cape",waist="Fucho-no-Obi",legs="Assiduity Pants +1 +1",feet="Serpentes Sabots"}


    -- Idle sets

    sets.idle = {main="Solstice",sub="Genbu's Shield",range="Dunna",
        head="Befouled Crown",neck="Loricate Torque",ear1="Sanare Earring",ear2="Loquac. Earring",
        body="Amalric Doublet",hands="Serpentes Cuffs",ring1="Defending Ring",ring2="Sheltered Ring",
        back="Swift Cape",waist="Fucho-no-Obi",legs="Assiduity Pants +1 +1",feet="Serpentes Sabots"}

    sets.idle.PDT = {main="Solstice",sub="Genbu's Shield",range="Dunna",
        head="Befouled Crown",neck="Loricate Torque",ear1="Sanare Earring",ear2="Loquac. Earring",
        body="Amalric Doublet",hands="Amalric Gages",ring1="Defending Ring",ring2="Weatherspoon Ring",
        back="Umbra Cape",waist="Fucho-no-Obi",legs="Amalric Slops",feet="Battlecast Gaiters"}
		
	sets.idle.MDT ={main="Solstice",sub="Genbu's Shield",range="Dunna",
        head="Amalric coif",neck="Loricate Torque",ear1="Sanare Earring",ear2="Loquac. Earring",
        body="Amalric Doublet",hands="Amalric Gages",ring1="Defending Ring",ring2="Weatherspoon Ring",
        back="Umbra Cape",waist="Fucho-no-Obi",legs="Merlinic Shalwar",feet="Battlecast Gaiters"}
		
    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = {main=gear.pet_Nehushtan,sub="Genbu's Shield",range="Dunna",
        head="Befouled Crown",neck="Loricate Torque",ear1="Sanare Earring",ear2="Loquac. Earring",
        body=gear.pet_TelchineBody,hands="Geo. Mitaines +1",ring1="Defending Ring",ring2="Weatherspoon Ring",
        back="Lifestream Cape",waist="Isa Belt",legs=gear.pet_TelchineLegs,feet="Bagua Sandals +1"}

    sets.idle.PDT.Pet = {main=gear.pet_Nehushtan,sub="Genbu's Shield",range="Dunna",
        head="Befouled Crown",neck="Loricate Torque",ear1="Sanare Earring",ear2="Handler's Earring",
        body=gear.pet_TelchineBody,hands="Geo. Mitaines +1",ring1="Defending Ring",ring2="Weatherspoon Ring",
        back="Lifestream Cape",waist="Isa Belt",legs=gear.pet_TelchineLegs,feet="Bagua Sandals"}

    -- .Indi sets are for when an Indi-spell is active.
    sets.idle.Indi = set_combine(sets.idle, {legs="Bagua Pants +1"})
    sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {legs=gear.pet_TelchineLegs,ear2="Handler's Earring"})
    sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {legs="Bagua Pants +1"})
    sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {legs=gear.pet_TelchineLegs,ear2="Handler's Earring"})

    sets.idle.Town = {main="Bolelabunga",sub="Genbu's Shield",range="Dunna",
        head="Bagua Galero +1",neck="Loricate Torque",ear1="Sanare Earring",ear2="Loquac. Earring",
        body="Bagua Tunic",hands="Bagua Mitaines +1",ring1="Defending Ring",ring2="Sheltered Ring",
        back="Umbra Cape",waist="Fucho-no-Obi",legs="Assiduity Pants +1",feet="Geo. Sandals +1"}

    sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",range="Dunna",
        head="Geo. Galero +1",neck="Loricate Torque",ear1="Sanare Earring",ear2="Loquac. Earring",
        body="Geo. Tunic +1",hands="Bagua Mitaines +1",ring1="Defending",ring2="Weatherspoon Ring",
        back="Umbra Cape",waist="Fucho-no-Obi",legs="Geo. Pants +1",feet="Geo. Sandals +1"}

    -- Defense sets

    sets.defense.PDT = {range="Dunna",
        head="Amalric coif +1",neck="Loricate Torque",ear1="Sanare Earring",ear2="Loquac. Earring",
        body="Helios Jacket",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Weatherspoon Ring",
        back="Umbra Cape",waist="Ninurta's Sash",legs="Amalric Slops",feet="Hagondes Sabots"}

    sets.defense.MDT = {range="Dunna",
        head="Amalric coif",neck="Loricate Torque",ear1="Sanare Earring",ear2="Loquac. Earring",
        body="Helios Jacket",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Umbra Cape",waist="Ninurta's Sash",legs="Bokwus Slops",feet="Hagondes Sabots"}

    sets.Kiting = {feet="Geo. Sandals +1"}

    sets.latent_refresh = {head="Befouled Crown",
	body="Amalric Doublet",hands="Bagua Mitaines +1",
	waist="Fucho-no-obi",legs="Assiduity Pants +1"}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {range="Dunna",
        head="Amalric coif",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Espial Gambison",hands="Bokwus Gloves",ring1="Rajas Ring",ring2="Garuda Ring +1",
        back="Repulse Mantle",waist="Ninurta's Sash",legs="Espial Hose",feet="Espial Socks"}

    --------------------------------------
    -- Custom buff sets
    --------------------------------------

end