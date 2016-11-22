Map {
  background-color: @land;
  font-directory: url('fonts/');
}

#water {
  ['mapnik::geometry_type' = polygon] {
    [man_made = null] {
      polygon-fill: @water;
      polygon-pattern-file: url('img/pattern/water.svg');
      polygon-pattern-alignment: global;

      [zoom <= 5] {
        polygon-pattern-gamma: 0.4;
      }

      ::blur {
        polygon-fill: #ffffff;
        comp-op: soft-light;
        image-filters: agg-stack-blur(4, 4);
        image-filters-inflate: true;
        polygon-geometry-transform: translate(2, 2);
        polygon-clip: false;
      }
    }

    [man_made != null] {
      polygon-fill: @land;
    }
  }

  ['mapnik::geometry_type' = linestring] {
    line-color: @water;
    line-width: 0;

    [zoom >= 12] {
      line-cap: round;
      line-join: round;
    }

    [waterway = 'canal'],
    [waterway = 'river'] {
      [zoom = 8] {
        line-width: 0.1;
      }

      [zoom = 9] {
        line-width: 0.2;
      }

      [zoom = 10] {
        line-width: 0.4;
      }

      [zoom = 11] {
        line-width: 0.6;
      }

      [zoom = 12] {
        line-width: 0.8;
      }

      [zoom = 13] {
        line-width: 1;
      }

      [zoom = 14] {
        line-width: 1.5;
      }

      [zoom = 15] {
        line-width: 2;
      }

      [zoom = 16] {
        line-width: 3;
      }

      [zoom = 17] {
        line-width: 4;
      }

      [zoom = 18] {
        line-width: 5;
      }

      [zoom = 19] {
        line-width: 6;
      }

      [zoom >= 20] {
        line-width: 7;
      }
    }

    [waterway = 'stream'],
    [waterway = 'stream_intermittent'] {
      [zoom = 13] {
        line-width: 0.2;
      }

      [zoom = 14] {
        line-width: 0.4;
      }

      [zoom = 15] {
        line-width: 0.6;
      }

      [zoom = 16] {
        line-width: 0.8;
      }

      [zoom = 17] {
        line-width: 1;
      }

      [zoom = 18] {
        line-width: 1.5;
      }

      [zoom = 19] {
        line-width: 2;
      }

      [zoom >= 20] {
        line-width: 2.5;
      }
    }

    [waterway = 'stream_intermittent'] {
      [zoom >= 13] {
        line-dasharray: 20, 3, 2, 3, 2, 3, 2, 3;
      }

      [zoom >= 15] {
        line-dasharray: 30, 6, 4, 6, 4, 6, 4, 6;
      }

      [zoom >= 18] {
        line-dasharray: 40, 9, 6, 9, 6, 9, 6, 9;
      }
    }

    [waterway = 'ditch'],
    [waterway = 'drain'] {
      [zoom = 15] {
        line-width: 0.1;
      }

      [zoom = 16] {
        line-width: 0.3;
      }

      [zoom = 17] {
        line-width: 0.5;
      }

      [zoom = 18] {
        line-width: 0.7;
      }

      [zoom = 19] {
        line-width: 1;
      }

      [zoom >= 20] {
        line-width: 1.5;
      }
    }

    [man_made != null] {
      line-color: @land;
      line-width: 4;
    }
  }
}

#admin {
  ::background {
    line-width: 15;
    opacity: 0.1;
    line-color: #fc0;
    line-join: round;
    line-cap: square;
  }

  line-width: 1;
  line-color: #fff;
  line-dasharray: 15, 15;
  line-join: round;
  line-cap: butt;
}

#man-made {
  ['mapnik::geometry_type'=polygon] {
    polygon-fill: #74373a;

    [man_made = 'pier'][zoom >= 12] {
      polygon-fill: @land;
    }

    [man_made = 'breakwater'][zoom >= 12],
    [man_made = 'groyne'][zoom >= 12] {
      polygon-fill: @breakwater-color;
    }
  }

  ['mapnik::geometry_type'=linestring] {
    line-width: 1;
    line-color: #74373a;

    [man_made = 'pier'][zoom >= 12] {
      line-width: 1.5;
      line-color: @land;
      [zoom >= 13] { line-width: 3; }
      [zoom >= 16] { line-width: 7; }
    }

    [man_made = 'breakwater'][zoom >= 12],
    [man_made = 'groyne'][zoom >= 12] {
      line-width: 1;
      line-color: @breakwater-color;
      [zoom >= 13] { line-width: 2; }
      [zoom >= 16] { line-width: 4; }
    }
  }
}

/*#routes {
  line-width: 2;
  line-color: #00ff00;
}*/

#utilities {
  ['mapnik::geometry_type' = polygon] {
    polygon-fill: #3f53c1;
  }

  ['mapnik::geometry_type' = linestring] {
    line-width: 1;
    line-color: #3f53c1;
  }
}

// =====================================================================
// LANDUSE
// =====================================================================

#landcover,
#landuse {
  // listed first because it includes a pattern overlay
  [landuse = 'forest'],
  [natural = 'wood'] {
    polygon-fill: @wood;
    polygon-opacity: 0.25;
    ::pattern {
      [zoom >= 15] {
        polygon-pattern-file: url('img/pattern/forest-low.png');
        polygon-pattern-opacity: 0.1;
        polygon-pattern-alignment: global;
        comp-op: darken;
      }
      [zoom >= 16] {
        polygon-pattern-file: url('img/pattern/forest-med.png');
        polygon-pattern-opacity: 0.2;
      }
      [zoom >= 17] {
        polygon-pattern-file: url('img/pattern/forest-high.png');
        polygon-pattern-opacity: 0.25;
      }
    }
  }

  [natural = 'sand'] {
    polygon-fill: @sand;
    ::pattern {
      polygon-pattern-file: url(img/pattern/sand.png);
    }
  }

  [leisure = 'pitch'] {
    polygon-fill: @pitch;

    [zoom>14] {
      line-width: 0.8;
      line-color: lighten(@pitch, 8);
    }

    [zoom=16] { line-width: 1; }
    [zoom=17] { line-width: 1.2; }
    [zoom=18] { line-width: 1.4; }
  }

  [amenity = 'kindergarten'],
  [amenity = 'school'] {
    polygon-fill: @school;
    polygon-opacity: 0.5;
  }

  [landuse = 'cemetery'] {
    polygon-fill: @cemetery;
  }

  [amenity = 'hospital'] {
    polygon-fill: @hospital;
  }

  [amenity = 'parking'] {
    polygon-fill: @parking;
  }

  [natural = 'bare_rock'],
  [natural = 'rock'] {
    polygon-fill: @rock;
  }

  [landuse = 'industrial'] {
    polygon-fill: @industrial;
  }

  [landuse = 'military'] {
    polygon-fill: darken(@industrial, 10);
  }

  [landuse = 'farmland'],
  [landuse = 'farm'],
  [landuse = 'farmyard'],
  [landuse = 'orchard'],
  [landuse = 'aquaculture'] {
    polygon-fill: @agriculture;
  }

  [natural = 'glacier'] {
    polygon-fill: @snow;
  }

  [leisure = 'stadium'],
  [leisure = 'park'],
  [leisure = 'nature_reserve'],
  [leisure = 'garden'],
  [leisure = 'common'],
  [landuse = 'village_green'] {
    polygon-fill: @park;
    polygon-opacity: 0.7;
    [zoom=7] { polygon-opacity: 0.2; }
    [zoom=8] { polygon-opacity: 0.4; }
    [zoom=9] { polygon-opacity: 0.6; }
    [zoom=10]{ polygon-opacity: 0.8; }
    [zoom>=11] {
      line-width: 0.75;
      line-color: darken(@park, 10);
      line-join: round;
    }
  }

  [leisure='common'] [zoom>=15] {
    line-color: #2e5f01;
    line-width: 2;
    line-dasharray: 4,1;
  }

  [landuse = 'grass'],
  [landuse = 'greenfield'],
  [landuse = 'meadow'],
  [natural = 'grass'],
  [natural = 'grassland'] {
    polygon-fill: @grass;
    polygon-opacity: 0.25;
  }

  [natural = 'scrub'] {
    polygon-fill: darken(@grass, 10);
    polygon-opacity:0.25;
  }

  ::overlay {
    [natural = 'wetland'],
    [natural = 'marsh'],
    [natural = 'swamp'],
    [natural = 'bog'],
    [wetland = 'wetland'],
    [wetland = 'marsh'],
    [wetland = 'swamp'],
    [wetland = 'bog'] {
      [zoom>=12] {
        polygon-pattern-alignment: global;
        polygon-pattern-opacity: 0.9;
        polygon-pattern-file: url(img/pattern/wetland-12.png);
      }
      [zoom>=14] { polygon-pattern-file: url(img/pattern/wetland-14.png);}
      [zoom>=15] { polygon-pattern-file: url(img/pattern/wetland-15.png);}
      [zoom>=16] { polygon-pattern-file: url(img/pattern/wetland-16.png);}
      [zoom>=17] { polygon-pattern-file: url(img/pattern/wetland-17.png);}
      [zoom>=18] { polygon-pattern-file: url(img/pattern/wetland-18.png);}
    }

    [natural = 'mud'],
    [natural = 'tidalflat'],
    [wetland = 'mud'],
    [wetland = 'tidalflat'] {
      [zoom>=12] {
        polygon-pattern-opacity: 0.9;
        polygon-pattern-alignment: global;
        polygon-pattern-file:url(img/pattern/wetland-noveg-12.png);
      }
      [zoom>=14] { polygon-pattern-file:url(img/pattern/wetland-noveg-13.png);}
      [zoom>=16] { polygon-pattern-file:url(img/pattern/wetland-noveg-14.png);}
      [zoom>=18] { polygon-pattern-file:url(img/pattern/wetland-noveg-15.png);}
    }
  }
}

// =====================================================================
// AEROWAYS
// =====================================================================

// polygons other than runways/taxiways
/*#aeroway['mapnik::geometry_type' = polygon][zoom>=12] {
  polygon-fill: lighten(@aeroway, 40%);
  line-color: #555;
  line-width: 0.5;
  [type='apron'] {
    polygon-fill: lighten(@parking,20%);
    polygon-opacity: 0.5;
  }
}*/

// lines and polygon runways/taxiways
/*#aeroway[zoom>9] {
    ['mapnik::geometry_type'=polygon][type='runway'],
    ['mapnik::geometry_type'=polygon][type='taxiway'] {
      polygon-fill:darken(@aeroway, 40);
    }
    line-color:darken(@aeroway, 40);
    line-cap:butt;
    line-join:miter;
    ['mapnik::geometry_type'=linestring][type='runway'] {
      [zoom=10]{ line-width:1; }
      [zoom=11]{ line-width:1.5; }
      [zoom=12]{ line-width:2; }
      [zoom=13]{ line-width:3.5; }
      [zoom=14]{ line-width:5.5; }
      [zoom=15]{ line-width:8.5; }
      [zoom=16]{ line-width:10; }
      [zoom>=17]{ line-width:12; }
    }
    ['mapnik::geometry_type'=linestring][type='taxiway'] {
      [zoom<13]{ line-width:0.2; }
      [zoom=13]{ line-width:1; }
      [zoom=14]{ line-width:1.5; }
      [zoom=15]{ line-width:2; }
      [zoom=16]{ line-width:3; }
      [zoom>=17]{ line-width:4; }
    }
}*/

// =====================================================================
// BUILDINGS
// =====================================================================

#buildings {
  ::shadow [zoom>=17] {
    polygon-fill: #000;
    polygon-opacity: 0.3;
    polygon-geometry-transform: translate(1.5,1.5);
    image-filters: agg-stack-blur(8,8);
    image-filters-inflate: true;
  }

  ::structure {
    [zoom=13] {
      polygon-fill:lighten(@building,4);
    }
    [zoom=14] {
      polygon-fill:lighten(@building,2);
    }
    [zoom=15] {
      polygon-fill:lighten(@building,1);
      //line-color:darken(@building,30);
      //line-width:0.5;
    }
    [zoom>15] {
      polygon-fill:@building;
      //line-color:darken(@building,40);
      //line-width:0.75;
    }
  }

  ::outline {
    [zoom >= 15] {
      line-color: darken(@building, 10);
      line-width: 0.5;

      [zoom >= 16] {
        line-color: darken(@building, 20);
        line-width: 0.75;
      }
    }
  }
}


// =====================================================================
// BARRIERS
// =====================================================================

/*#barrier_line[zoom>=17][class='gate'] {
  line-width:2.5;
  line-color:#7e7f88;
}

#barrier_line[zoom>=17][class='wall'],
#barrier_line[zoom>=17][class='fence'] {
  line-color:@building;
  [zoom=17] { line-width:0.6; }
  [zoom=18] { line-width:0.8; }
  [zoom>18] { line-width:1; }
}

#barrier_line[zoom>=16][class='hedge'] {
  line-width:2.4;
  line-color:darken(@park,20);
  [zoom=16] { line-width: 0.6; }
  [zoom=17] { line-width: 1.2; }
  [zoom=18] { line-width: 1.4; }
  [zoom>18] { line-width: 1.6; }
}

#barrier_line[zoom>=14][class='cliff'] {
  line-pattern-file: url(img/pattern/cliff-md.png);
  [zoom>=16] { line-pattern-file: url(img/pattern/cliff-lg.png); }
}

#water_barriers[waterway='dam'],
#water_barriers[waterway!='dam'][zoom>=14] {
  line-color: @dam-line;
  line-width: 2;
  line-join: round;
  line-cap: round;

  ['mapnik::geometry_type'=3] {
    polygon-fill: @dam;
  }
}*/

// =====================================================================
// ADMINISTRATIVE BOUNDARIES
// =====================================================================

/*#ne_10m_admin_0_boundary_lines_land {
    outline/opacity: 0.7;
    outline/line-join: round;
    outline/line-cap: round;
    outline/line-color: #fff;
    [zoom>=2][zoom<=3] { outline/line-width: 0.4 + 2; outline/opacity:0.7; }
    [zoom>=4][zoom<=5] { outline/line-width: 0.8 + 2; outline/opacity:0.7; }
    [zoom>=6][zoom<=7] { outline/line-width: 1.2 + 3; outline/opacity:0.5; }
    [zoom>=8][zoom<=9] { outline/line-width: 1.8 + 3; outline/opacity:0.3; }
    opacity: 0.75;
    line-join: round;
    line-color: @admin_2;
    [zoom>=2][zoom<=3] { line-width: 1.4; opacity:0.75; }
    [zoom>=4][zoom<=5] { line-width: 1.8; opacity:0.75; }
    [zoom>=6][zoom<=7] { line-width: 2.2; opacity:0.6; }
    [zoom>=8][zoom<=9] { line-width: 2.8; opacity:0.4; }
}*/
/*#ne_10m_admin_1_states_provinces_lines[zoom>=4][scalerank<=2],
#ne_10m_admin_1_states_provinces_lines[zoom>=6] {
    outline/opacity: 0.7;
    outline/line-join: round;
    outline/line-cap: round;
    outline/line-color: #fff;
    [zoom>=4][zoom<=5] { outline/line-width: 0.4 + 2; outline/opacity:0.7; }
    [zoom>=6][zoom<=7] { outline/line-width: 0.8 + 2; outline/opacity:0.7; }
    [zoom>=8][zoom<=9] { outline/line-width: 1.2 + 3; outline/opacity:0.5; }
    opacity: 0.75;
    line-join: round;
    line-color: @admin_4;
    //line-color: lighten(@admin_2,10%);
    [zoom>=4][zoom<=5] { line-width: 1.4; opacity:0.75; }
    [zoom>=6][zoom<=7] { line-width: 1.8; opacity:0.75; }
    [zoom>=8][zoom<=9] { line-width: 2.2; opacity:0.6; }
}*/
/*#admin[zoom>=2][admin_level<=2],
#admin[zoom>=6][admin_level<=4],
#admin[zoom>=8][admin_level<=6],
#admin[zoom>=10][admin_level<=8],
#admin[zoom>=12] {
  [admin_level=2] {
    outline/opacity: 0.7;
    outline/line-join: round;
    outline/line-cap: round;
    outline/line-color: #fff;
    [zoom>=2][zoom<=3] { outline/line-width: 0.4 + 2; }
    [zoom>=4][zoom<=5] { outline/line-width: 0.8 + 2; }
    [zoom>=6][zoom<=7] { outline/line-width: 1.2 + 3; }
    [zoom>=8][zoom<=9] { outline/line-width: 1.8 + 3; }
    [zoom>=10][zoom<=11] { outline/line-width: 2.2 + 3; }
    [zoom>=12][zoom<=13] { outline/line-width: 2.6 + 3; }
    [zoom>=14][zoom<=15] { outline/line-width: 3.0 + 3; }
    [zoom>=16] { outline/line-width: 4.0 + 3; }
    opacity: 0.75;
    line-join: round;
    line-color: @admin_2;
    [zoom>=2][zoom<=3] { line-width: 1.4; }
    [zoom>=4][zoom<=5] { line-width: 1.8; }
    [zoom>=6][zoom<=7] { line-width: 2.2; }
    [zoom>=8][zoom<=9] { line-width: 2.8; }
    [zoom>=10][zoom<=11] { line-width: 3.2; }
    [zoom>=12][zoom<=13] { line-width: 3.6; }
    [zoom>=14][zoom<=15] { line-width: 4.0; }
    [zoom>=16] { line-width: 5.0; }
  }
  [admin_level>=3][admin_level<=8] {
    outline/opacity: 0.8;
    outline/line-join: round;
    outline/line-cap: round;
    outline/line-color: #fff;
    outline/line-opacity: 0.75;
    [zoom=5] { outline/line-width: 0.4 + 2; }
    [zoom>=6][zoom<=7] { outline/line-width: 0.8 + 3; }
    [zoom>=8][zoom<=9] { outline/line-width: 1.2 + 3; }
    [zoom>=10][zoom<=11] { outline/line-width: 1.6 + 3; }
    [zoom>=12][zoom<=13] { outline/line-width: 2.0 + 3; }
    [zoom>=14][zoom<=15] { outline/line-width: 2.4 + 3; }
    [zoom>=16] { outline/line-width: 2.8 + 2; }
    [admin_level=3] {
      line-color: @admin_3;
      line-opacity: 0.65;
      line-dasharray: 12, 3;
    }
    [admin_level>=4][admin_level<=8] {
      line-color: @admin_4;
      line-opacity: 0.7;
      line-dasharray: 10, 2;
    }
    [zoom>=2][zoom<=3] { line-width: 1.2; }
    [zoom>=4][zoom<=5] { line-width: 1.4; }
    [zoom>=6][zoom<=7] { line-width: 1.8; }
    [zoom>=8][zoom<=9] { line-width: 2.2; }
    [zoom>=10][zoom<=11] { line-width: 2.6; }
    [zoom>=12][zoom<=13] { line-width: 3.0; }
    [zoom>=14][zoom<=15] { line-width: 3.4; }
    [zoom>=16] { line-width: 2.8; }
  }*/
  /*
  The following code prevents admin boundaries from being rendered on top of
  each other. Comp-op works on the entire attachment, not on the individual
  border. Therefore, this code generates an attachment containing a set of
  @admin-boundaries/white dashed lines (of which only the top one is visible),
  and with `comp-op: darken` the white part is ignored, while the
  @admin-boundaries colored part is rendered (as long as the background is not
  darker than @admin-boundaries).
  The SQL has `ORDER BY admin_level`, so the boundary with the lowest
  admin_level is rendered on top, and therefore the only visible boundary.
  opacity: 0.4;
  comp-op: darken;
}
  */
