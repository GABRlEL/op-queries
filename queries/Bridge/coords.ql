[out:json][timeout:1200];

// Settings
// Radius is in meters.
// {{radius_m=1000}}
// {{coords=10.000000,20.000000}}

// Broad bridge-related candidate scan
// Area: {{radius_m}} m around {{coords}}
//
// This is intentionally broad and noisy.
// Manual Wayfarer review is required.

(
  // Any object explicitly tagged as a bridge.
  // Includes bridge=yes, bridge=viaduct, bridge=covered, etc.
  // Excludes explicit bridge=no.
  nwr["bridge"]["bridge"!="no"]
    (around:{{radius_m}},{{coords}});

  // Dedicated bridge objects / bridge areas.
  nwr["man_made"="bridge"]
    (around:{{radius_m}},{{coords}});

  // Bridge relations, where mapped as grouped bridge structures.
  nwr["type"="bridge"]
    (around:{{radius_m}},{{coords}});

  // Named bridges or objects with bridge-specific names.
  nwr["bridge:name"]
    (around:{{radius_m}},{{coords}});

  nwr["name"]["bridge"]["bridge"!="no"]
    (around:{{radius_m}},{{coords}});

  // Bridge structure/type metadata.
  nwr["bridge:structure"]
    (around:{{radius_m}},{{coords}});

  nwr["bridge:movable"]
    (around:{{radius_m}},{{coords}});

  nwr["bridge:support"]
    (around:{{radius_m}},{{coords}});

  nwr["bridge:ref"]
    (around:{{radius_m}},{{coords}});

  // Footbridges / path bridges / cycle bridges via bridge=* on pedestrian-ish ways.
  way["bridge"]["bridge"!="no"]["highway"~"^(footway|path|cycleway|bridleway|steps|pedestrian|track|service|residential|tertiary|secondary|primary)$"]
    (around:{{radius_m}},{{coords}});

  // Railway bridges.
  way["bridge"]["bridge"!="no"]["railway"]
    (around:{{radius_m}},{{coords}});

  // Aqueducts / water bridges, sometimes bridge-like Wayfarer candidates.
  nwr["historic"="aqueduct"]
    (around:{{radius_m}},{{coords}});

  nwr["man_made"="aqueduct"]
    (around:{{radius_m}},{{coords}});

  nwr["waterway"="aqueduct"]
    (around:{{radius_m}},{{coords}});
);

out body center;
>;
out skel qt;
