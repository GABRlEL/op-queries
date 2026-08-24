[out:json][timeout:1200];

// Settings
// Radius is in meters.
// {{radius_m=10000}}
// {{coords=10.000000,20.000000}}

// Broad bench-related candidate scan
// Area: {{radius_m}} m around {{coords}}
//
// This is intentionally broad and noisy.
// Manual Wayfarer review is required.

(
  // Standalone benches
  nwr["amenity"="bench"]
    (around:{{radius_m}},{{coords}});

  // Memorial benches, including cases not tagged as amenity=bench
  nwr["memorial"="bench"]
    (around:{{radius_m}},{{coords}});

  nwr["historic"="memorial"]["memorial"="bench"]
    (around:{{radius_m}},{{coords}});

  // Benches with memorial/inscription/name-style metadata
  // Mostly redundant with amenity=bench, but useful for visually separating likely-interesting benches.
  nwr["amenity"="bench"]["memorial"]
    (around:{{radius_m}},{{coords}});

  nwr["amenity"="bench"]["inscription"]
    (around:{{radius_m}},{{coords}});

  nwr["amenity"="bench"]["inscription:url"]
    (around:{{radius_m}},{{coords}});

  nwr["amenity"="bench"]["openbenches:id"]
    (around:{{radius_m}},{{coords}});

  nwr["amenity"="bench"]["name"]
    (around:{{radius_m}},{{coords}});

  // Features that have an associated bench, e.g. shelters, platforms, bus stops, viewpoints, etc.
  // Excludes explicit bench=no.
  nwr["bench"]["bench"!="no"]
    (around:{{radius_m}},{{coords}});

  // Chat benches / special initiative benches
  nwr["chat_bench"]
    (around:{{radius_m}},{{coords}});

  nwr["initiative"~"bench|chat_bench|plauderbank|mitfahr",i]
    (around:{{radius_m}},{{coords}});

  // Ride-sharing / hitchhiking benches, common in German-speaking areas
  nwr["highway"="hitchhiking"]
    (around:{{radius_m}},{{coords}});

  nwr["highway"="hitchhiking"]["bench"!="no"]
    (around:{{radius_m}},{{coords}});

  // Picnic tables / tables with benches
  nwr["leisure"="picnic_table"]
    (around:{{radius_m}},{{coords}});

  // Features that explicitly say picnic_table=yes, even if not mapped as leisure=picnic_table
  nwr["picnic_table"]["picnic_table"!="no"]
    (around:{{radius_m}},{{coords}});

  // Very broad seating metadata.
  // These can create noise, but may catch bench-like seating that lacks amenity=bench.
  nwr["backrest"]
    (around:{{radius_m}},{{coords}});

  nwr["seats"]
    (around:{{radius_m}},{{coords}});
);

out body center;
>;
out skel qt;
