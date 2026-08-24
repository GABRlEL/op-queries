[out:json][timeout:1200];

// Settings
// Radius is in meters.
// {{radius_m=10000}}

// Beach + coastline scanner
// Area: {{radius_m}} m around current Overpass Turbo map center

(
  // Beaches
  nwr["natural"="beach"]
    (around:{{radius_m}},{{center}});

  // Coastlines
  way["natural"="coastline"]
    (around:{{radius_m}},{{center}});
);

out body center;
>;
out skel qt;
