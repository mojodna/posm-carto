@rubble: #ff8692;
@camp: #dac3f4;

// =====================================================================
// SITE
// =====================================================================

#site_poly [class='shelter'] {
  ::shadow [zoom>=17] {
    polygon-fill: #000;
    polygon-opacity: 0.3;
    polygon-geometry-transform: translate(1.5,1.5);
    image-filters: agg-stack-blur(8,8);
    image-filters-inflate: true;
  }
  ::structure {
    [zoom=13] {  
      polygon-fill:lighten(@building,1);
    }
    [zoom=14] {
      polygon-fill:darken(@building,2);
    }
    [zoom=15] {
      polygon-fill:darken(@building,1);
      line-color:darken(@building,35);
      line-width:0.5;
    }
    [zoom>15] {
      polygon-fill:darken(@building, 5);
      line-color:darken(@building,50);
      line-width:0.75;
    }
  }
}

#site_poly {
  ::residential [class='residential'] {
    polygon-fill: #fff;
    polygon-opacity: 0.7;
    line-color: #ffffff;
    line-width: 0.5;
    [zoom>=16] { line-width: 1.5; }
    line-opacity: 0.8;
    line-join: round;
  }
}

#site_poly {
  ::rubble0 [zoom<16]["class"="rubble"] {
    polygon-fill: @rubble;
    polygon-opacity: 0.3;
  }
  ::rubble1 [zoom>=16]["class"="rubble"] {
    ::shape {
      polygon-fill: lighten(@rubble, 18);
      polygon-opacity: 0.5;
    }
    ::pattern {
      polygon-pattern-file: url('img/humanitarian/site/damage-16.png');
      [zoom>=18] { polygon-pattern-file: url('img/humanitarian/site/damage-18.png'); }
      polygon-pattern-alignment: local;
      polygon-pattern-opacity: 0.4;
    }
  }
}

#site_poly {
  ::camp [class='camp'] {
    polygon-fill:@camp;
    polygon-opacity: 0.7;
    line-color:darken(@camp,30);
    line-width: 0;
    [zoom>=16] { 
      line-width: 0.5; 
      polygon-pattern-file: url('img/humanitarian/site/camp.png');
      polygon-pattern-opacity: 0.15;
      polygon-pattern-comp-op: multiply;
      polygon-pattern-alignment: local;
    }
    [zoom>=17] { 
      line-width: 1; 
      polygon-pattern-file: url('img/humanitarian/site/camp.png');
      polygon-pattern-opacity: 0.25;
      polygon-pattern-comp-op: multiply;
      polygon-pattern-alignment: local;
    }  
    [zoom>=18] { 
      line-width: 1.5; 
      polygon-pattern-file: url('img/humanitarian/site/camp.png');
      polygon-pattern-opacity: 0.5;
      polygon-pattern-comp-op: multiply;
      polygon-pattern-alignment: local;
    }
  }
}


// =====================================================================
// BUILDING CONDITION
// =====================================================================

#building_condition {
  ::construction [class='construction'] {
    polygon-fill: #00ff88;
  }
  ::damaged [class='damaged'] {
    polygon-fill: #eb713e;
  }
  ::collapsed [class='collapsed'] {
    polygon-fill: #ab263c;
  }
  ::flooded [class='flooded'] {
    polygon-fill: #0032ff;
  }
  ::construction,
  ::damaged,
  ::collapsed,
  ::flooded {
    polygon-opacity: 0.5;
    comp-op: overlay;
  }
}


// =====================================================================
// ROAD CONDITION
// =====================================================================

// Data is not high enough in quality or consistency to make it worth including on this map.
// Commented out style below is for checking coverage.

/*
#road_condition {
  ::condition [condition!=''] {
    line-width: 3;
    line-color: #00a9ff;
    line-geometry-transform: translate(2,2);
  }
  ::surface [surface!=''] {
    line-width: 3;
    line-color: #2af409;
    line-geometry-transform: translate(-2,-2);
  }
}
*/

#road_condition [class="barrier"][zoom>=18] {
  shield-name: '[barrier]';
  shield-file: url('img/shield/generic-md-5.png');
  shield-face-name: @sans_bold;
  shield-text-transform: uppercase;
}


// =====================================================================
// SANITATION
// =====================================================================

#sanitation_poly [class='waste'] {
  polygon-fill: #647e64;
  [zoom>=17] { 
    polygon-pattern-file: url('img/humanitarian/sanitation/swirls.png');
    line-color: #fff;
    line-width: 2;
  }
  opacity: 0.6;
}


// =====================================================================
// EMERGENCY FACILITY
// =====================================================================

#emergency_poly [class!='helicopter'] {
  polygon-fill: #4a534a;
  line-opacity: 0.4;
  polygon-opacity: 0.3;
}



// =====================================================================
// MEDICAL
// =====================================================================

#medical_poly {
  polygon-fill: #fff;
  polygon-opacity: 0.5;
  polygon-comp-op: soft-light;
  line-width: 0.8;
  [zoom>=17] { line-width: 1.8; }
  line-opacity: 0.7;
  line-color: #ae0011;
  line-join: round;
  line-cap: round;
  line-comp-op: multiply;
}



// =====================================================================
// WATER SOURCE
// =====================================================================
#water_source [zoom>=15] {
  line-opacity: 0.4;
  polygon-opacity: 0.3;
}


// =====================================================================
// COMMUNICATION
// =====================================================================

#communication {
  line-opacity: 0.4;
  polygon-opacity: 0.3;
}



// =====================================================================
// ELECTRIC UTILITY
// =====================================================================

#electric_utility {
  ::transmission_structures {
    [structure="tower"] {
      [zoom>=13] {
        marker-file: url('img/maki/circle-18.svg');
        marker-width: 2;
      }
      [zoom>=14] { marker-width: 4; }
      [zoom>=15] {
        marker-file: url('img/humanitarian/electric_utility/electric-tower.svg');
        marker-transform: translate(0,5);
        marker-width: 5;
      }
      [zoom>=16] { marker-width: 8; }
      [zoom>=17] { marker-width: 10; }
      [zoom>=18] { marker-width: 14; }
    }
    [structure="pole"][zoom>=15] {
      marker-file: url('img/maki/circle-18.svg');
      marker-fill-opacity: 0.5;
      [zoom>=15] { marker-width: 2; }
      [zoom>=16] { marker-width: 3; }
      [zoom>=18] { marker-width: 4; }
    }
  }
}
#electric_utility_line {
  ::transmission_lines [zoom>=12]{
    [structure='line'] {
      line-color: black;
      line-width: 0.7;
      line-opacity: 0.65;
      [zoom>=15] { 
        line-width: 1.2;
        line-opacity: 0.75;
      }
    }
  }
}
#electric_utility_poly {
  ::stations [zoom>=12]{ 
    line-opacity: 0.4;
    polygon-opacity: 0.2;
    polygon-fill: #000;
    line-color: #000;
  }
}



// =====================================================================
// HDM LABEL
// =====================================================================

#building_condition {
  ::building_condition [layer='building_condition'] {
    [zoom>=18] {
      text-name: '[class]';
      text-face-name: @sans_italic;
      text-size: 12;
      text-fill: darken(@building, 70);
      text-halo-opacity: 0.5;
      text-halo-fill: #fff;
      text-halo-radius: 0.5;
    }
  }
}

// apply the humanitarian icons to points and areas:

#communication,
#electric_utility[class!='transmission'],
#electric_utility_poly,
#emergency,
#emergency_poly,
#medical,
#medical_poly,
#sanitation,
#sanitation_poly,
#site,
#site_poly[class!='residential'],
#water_source,
#water_source_poly {
  ::icon [layer!='sanitation'] [class!='helicopter_potential'] [class!='rubble'] [class!='landslide'] [zoom>=14] {
    [layer = 'water_source'] { marker-file: url('img/maki/water-18.svg'); }
    [layer!= 'water_source'] { marker-file: url('img/humanitarian/[layer]/[class].svg'); }
    marker-fill: #000000;
    marker-line-color: #fff;
    marker-line-width: 0.2;
    marker-line-opacity: 0.5;
    marker-height: 9; 
    [zoom>=15] { 
      marker-height: 14;
    }
    [zoom>=16] { 
      marker-height: 16; 
    }
    [zoom>=20] { 
      marker-height: 18;
      marker-allow-overlap: true; 
    }
  }
  ::sanitation [layer='sanitation'] [zoom>=18]{
    marker-file: url('img/humanitarian/[layer]/[class].svg');
    marker-height: 16;
    text-name: '[class]';
    text-transform: uppercase;
    text-face-name: @sans;
    text-character-spacing: -0.5;
    text-halo-radius: 1.5;
    text-halo-fill: #fff;
    text-halo-rasterizer: fast;
    text-size: 10;
    text-dy: -11;
    //marker-allow-overlap: true;
    text-wrap-width: 13;
   }
  ::label [layer!='building_condition']
          [class!='camp']
          [class!="helicopter_potential"]
          [layer!='sanitation']
          [zoom>=18] {
    text-name: '[class]';
    text-transform: uppercase;
    text-face-name: @sans;
    text-character-spacing: -0.5;
    text-halo-radius: 1.5;
    text-halo-fill: #fff;
    text-halo-rasterizer: fast;
    text-size: 10;
    text-dy: -11;
    text-wrap-width: 26;
    [zoom>=20] { 
      text-allow-overlap: true;
    }
  }
  ::name [zoom>=16] {
    text-name: '[name]';
    text-transform: capitalize;
    text-face-name: @sans_italic;
    text-halo-radius: 1.2;
    text-halo-fill: #fff;
    text-halo-rasterizer: fast;
    text-size: 10;
    text-dy: 11;
    text-wrap-width: 26;
  }
  ::label [class="helicopter_potential"][zoom>=18] {
    text-name: "'¿Potential Helicopter?'";
    text-face-name: @sans;
    text-fill: #333;
    text-opacity: 0.8;
    text-halo-fill: #fff;
    text-halo-radius: 1.2;
    text-halo-opacity: 0.8;
    text-transform: uppercase;
    text-allow-overlap: true;
    text-dy: -13;
    text-wrap-width: 12;
  }
  ::icon [class="helicopter_potential"][zoom>=18] {
    marker-file: url('img/humanitarian/[layer]/helicopter.svg');
    marker-height: 24;
    marker-fill: #333;
    marker-fill-opacity: 0.8;
  }
}

// overrides based on the 'potable' field:

#water_source,
#water_source_poly {
  [class='drinking water'] { marker-file: url('img/humanitarian/water_source/water.svg'); }
  [potable='yes'] { marker-file: url('img/humanitarian/water_source/water-potable.svg'); }
  [potable='no'] { marker-file: url('img/humanitarian/water_source/water-non-potable.svg'); }
}

// additional label for camps

#site[class='camp'][zoom>=17],
#site_poly[class='camp'][zoom>=17] {
  text-name: '';
  [type='idp'] { text-name: 'IDP'; }
  [type='refugee'] { text-name: 'REFUGEE'; }
  text-face-name: @sans_bold;
  text-size: 9;
  text-fill: #480261;
  text-halo-radius: 1.5;
  text-halo-fill: #fff;
  text-halo-opacity: 0.3;
}
