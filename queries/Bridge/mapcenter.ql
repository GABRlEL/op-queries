[out:json][timeout:1200];

// Settings
// Radius is in meters.
// {{radius_m=1000}}

// Broad bridge-related candidate scan
// Area: {{radius_m}} m around current Overpass Turbo map center
//
// This is intentionally broad and noisy.
// Manual Wayfarer review is required.

(
  // Any object explicitly tagged as a bridge.
  // Includes bridge=yes, bridge=viaduct, bridge=covered, etc.
  // Excludes explicit bridge=no.
  nwr["bridge"]["bridge"!="no"]
    (around:{{radius_m}},{{center}});

  // Dedicated bridge objects / bridge areas.
  nwr["man_made"="bridge"]
    (around:{{radius_m}},{{center}});

  // Bridge relations, where mapped as grouped bridge structures.
  nwr["type"="bridge"]
    (around:{{radius_m}},{{center}});

  // Named bridges or objects with bridge-specific names.
  nwr["bridge:name"]
    (around:{{radius_m}},{{center}});

  nwr["name"]["bridge"]["bridge"!="no"]
    (around:{{radius_m}},{{center}});

  // Bridge structure/type metadata.
  nwr["bridge:structure"]
    (around:{{radius_m}},{{center}});

  nwr["bridge:movable"]
    (around:{{radius_m}},{{center}});

  nwr["bridge:support"]
    (around:{{radius_m}},{{center}});

  nwr["bridge:ref"]
    (around:{{radius_m}},{{center}});

  // Footbridges / path bridges / cycle bridges via bridge=* on pedestrian-ish ways.
  way["bridge"]["bridge"!="no"]["highway"~"^(footway|path|cycleway|bridleway|steps|pedestrian|track|service|residential|tertiary|secondary|primary)$"]
    (around:{{radius_m}},{{center}});

  // Railway bridges.
  way["bridge"]["bridge"!="no"]["railway"]
    (around:{{radius_m}},{{center}});

  // Aqueducts / water bridges, sometimes bridge-like Wayfarer candidates.
  nwr["historic"="aqueduct"]
    (around:{{radius_m}},{{center}});

  nwr["man_made"="aqueduct"]
    (around:{{radius_m}},{{center}});

  nwr["waterway"="aqueduct"]
    (around:{{radius_m}},{{center}});
);

out body center;
