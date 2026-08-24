[out:json][timeout:1200];

// Settings
// Radius is in meters.
// {{radius_m=10000}}
// {{coords=10.000000,20.000000}}

// Beach + coastline scanner
// Area: {{radius_m}} m around {{coords}}

(
  // Beaches
  nwr["natural"="beach"]
    (around:{{radius_m}},{{coords}});

  // Coastlines
  way["natural"="coastline"]
    (around:{{radius_m}},{{coords}});
);

out body center;
>;
out skel qt;
