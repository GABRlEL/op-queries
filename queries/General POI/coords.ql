[out:json][timeout:1200];

// Settings
// Radius is in meters.
// {{radius_m=10000}}
// {{coords=10.000000,20.000000}}

// Refined Tier 1 Wayfarer candidate query
// Area: {{radius_m}} m around {{coords}}

(
  // ---------------------------------------------------------------------------
  // Exploration: historic, cultural, religious, educational, art, landmarks
  // ---------------------------------------------------------------------------

  nwr["historic"~"^(wayside_cross|wayside_shrine|memorial|monument|archaeological_site|castle|ruins|city_gate|boundary_stone)$"]
    (around:{{radius_m}},{{coords}});

  nwr["memorial"~"^(plaque|war_memorial)$"]
    (around:{{radius_m}},{{coords}});

  nwr["tourism"~"^(museum|gallery|artwork|attraction|viewpoint|zoo)$"]
    (around:{{radius_m}},{{coords}});

  nwr["tourism"="information"]["information"~"^(board|map|guidepost|route_marker)$"]
    (around:{{radius_m}},{{coords}});

  nwr["amenity"~"^(place_of_worship|library|public_bookcase|arts_centre|theatre|cinema|community_centre|townhall)$"]
    (around:{{radius_m}},{{coords}});

  nwr["building"~"^(church|chapel|cathedral)$"]
    (around:{{radius_m}},{{coords}});

  nwr["man_made"~"^(cross|obelisk|windmill|water_well)$"]
    (around:{{radius_m}},{{coords}});

  nwr["man_made"="tower"]["tower:type"~"^(observation|bell_tower|clock_tower)$"]
    (around:{{radius_m}},{{coords}});

  nwr["natural"="tree"]["denotation"="natural_monument"]
    (around:{{radius_m}},{{coords}});


  // ---------------------------------------------------------------------------
  // Exercise / recreation: parks, sports, trails, minigolf, courses, swimming
  // ---------------------------------------------------------------------------

  nwr["leisure"~"^(park|garden|playground|sports_centre|sports_hall|stadium|pitch|track|fitness_station|miniature_golf|disc_golf_course|golf_course|skate_park|ice_rink|bowling_alley|horse_riding|swimming_area|water_park|bathing_place)$"]
    (around:{{radius_m}},{{coords}});

  // Swimming pools only:
  // Exclude pools explicitly tagged access=private.
  // Pools without access=* are still included.
  nwr["leisure"="swimming_pool"]["access"!="private"]
    (around:{{radius_m}},{{coords}});

  nwr["leisure"~"^(sports_centre|sports_hall)$"]["sport"~"(^|;)(swimming|diving|water_polo)(;|$)"]
    (around:{{radius_m}},{{coords}});

  nwr["amenity"="public_bath"]
    (around:{{radius_m}},{{coords}});

  // Sport catch-all:
  // No exclusions. Reviewers must check suitability manually.
  nwr["sport"]
    (around:{{radius_m}},{{coords}});

  nwr["amenity"="dojo"]
    (around:{{radius_m}},{{coords}});

  nwr["highway"="trailhead"]
    (around:{{radius_m}},{{coords}});


  // ---------------------------------------------------------------------------
  // Social / gathering: pavilions, picnic areas, fountains, markets, post offices
  // ---------------------------------------------------------------------------

  nwr["tourism"="picnic_site"]
    (around:{{radius_m}},{{coords}});

  nwr["amenity"="shelter"]["shelter_type"~"^(pavilion|picnic_shelter)$"]
    (around:{{radius_m}},{{coords}});

  nwr["building"="pavilion"]
    (around:{{radius_m}},{{coords}});

  nwr["amenity"~"^(fountain|marketplace|post_office)$"]
    (around:{{radius_m}},{{coords}});

  nwr["leisure"="bandstand"]
    (around:{{radius_m}},{{coords}});
);

out body center;
>;
out skel qt;
