// LABEL.MSS CONTENTS:
// 1__ Ocean & Marine Labels
// 2__ Place Names
//     2_1__ Countries
//     2_2__ States
//     2_3__ Cities
//     2_4__ Towns
//     2_5__ Villages
//     2_6__ Suburbs
//     2_7__ Neighbourhoods & Hamlets
// 4__ Water Labels 
// 5__ Road Labels

// Font sets are defined in vars.mss

// =====================================================================
// 1__ OCEAN & MARINE LABELS
// =====================================================================


#marine_label["mapnik::geometry_type"=1],
#marine_label["mapnik::geometry_type"=2] {
  ::rank1 [labelrank=1][zoom>=3],
  ::rank2 [labelrank=2][zoom>=4],
  ::rank3 [labelrank=3][zoom>=5],
  ::rank4 [labelrank=4][zoom>=6],
  ::rank5 [labelrank=5][zoom>=7],
  ::rank6 [labelrank=6][zoom>=8] {
    text-name: @name;
    text-face-name: @sans_lt_italic;
    text-size: 15;
    text-transform: uppercase;
    text-character-spacing: 8;
    text-line-spacing: 8;
    text-fill: lighten(@water,30);
    ["mapnik::geometry_type"=1] {
      text-placement: point;
      text-wrap-width: 50;
      text-wrap-before: true;
    }
    ["mapnik::geometry_type"=2] {
      text-placement: line;
      text-avoid-edges: true;
    }
  }
}


// =====================================================================
// 2__ PLACE NAMES
// =====================================================================

// 2_3__ Cities ________________________________________________________

#place_label[type='city'][zoom>=8][zoom<=15] {
  text-name: @name;
  text-face-name: @sans;
  text-placement: point;
  text-fill: @city_text;
  text-halo-fill: #fff;
  text-halo-radius: 2;
  text-halo-rasterizer: fast;
  text-wrap-width: 40;
  text-line-spacing: -4;
  [zoom=8] {
    text-size: 13;
    text-wrap-width: 60;
  }
  [zoom=9] {
    text-size: 14;
    text-wrap-width: 60;
  }
  [zoom=10] {
    text-size: 15;
    text-wrap-width: 70;
  }
  [zoom=11] {
    text-size: 16;
    text-wrap-width: 80;
  }
  [zoom=12] {
    text-size: 17;
    text-wrap-width: 100;
  }
  [zoom=13] {
    text-size: 18;
    text-wrap-width: 200;
  }
  [zoom=14] {
    text-fill: lighten(@city_text,10);
    text-size: 19;
    text-wrap-width: 300;
  }
  [zoom=15] {
    text-fill: lighten(@city_text,10);
    text-size: 20;
    text-wrap-width: 400;
  }
}

// 2_4__ Towns _________________________________________________________

#place_label[type='town'][zoom>=8][zoom<=17] {
  text-name: @name;
  text-face-name: @sans;
  text-placement: point;
  text-fill: @town_text;
  text-halo-fill: @town_halo;
  text-halo-radius: 1.5;
  text-halo-rasterizer: fast;
  text-wrap-width: 75;
  text-wrap-before: true;
  text-line-spacing: -4;
  text-size: 11;
  [zoom>=8] { text-size: 12; }
  [zoom>=10] { text-size: 13; text-halo-radius: 2; }
  [zoom>=11] { text-size: 14; }
  [zoom>=12] { text-size: 15; text-wrap-width: 80; }
  [zoom>=13] { text-size: 16; text-wrap-width: 120; }
  [zoom>=14] { text-size: 18; text-wrap-width: 160; }
  [zoom>=15] { text-size: 20; text-wrap-width: 200; }
  [zoom>=16] { text-size: 22; text-wrap-width: 240; }
}

// 2_5 Villages ______________________________________________________

#place_label[type='village'][zoom>=15][zoom<=17] {
  text-name: @name;
  text-face-name: @sans;
  text-placement: point;
  text-fill: @town_text;
  text-size: 11;
  text-halo-fill: @town_halo;
  text-halo-radius: 1.5;
  text-halo-rasterizer: fast;
  text-wrap-width: 60;
  text-wrap-before: true;
  text-line-spacing: -4;
  [zoom>=12] { text-size: 12; }
  [zoom>=13] { text-wrap-width: 80; }
  [zoom>=14] { text-size: 14; text-wrap-width: 100; }
  [zoom>=15] { text-size: 16; text-wrap-width: 120; }
  [zoom>=16] { text-size: 18; text-wrap-width: 160; }
  [zoom=17] { text-size: 20; text-wrap-width: 200; }
}

// 2_6__ Suburbs _______________________________________________________

#place_label[type='suburb'][zoom>=15][zoom<=18] {
  text-name: @name;
  text-face-name: @sans_lt;
  text-placement: point;
  text-fill: @other_text;
  text-size: 11;
  text-halo-fill: @other_halo;
  text-halo-radius: 1.5;
  text-halo-rasterizer: fast;
  text-wrap-width: 60;
  text-wrap-before: true;
  text-line-spacing: -2;
  [zoom>=12] { text-size: 10; text-min-distance: 20; }
  [zoom>=13] { text-size: 12; text-min-distance: 20; }
  [zoom>=14] { text-size: 13; text-wrap-width: 80; }
  [zoom>=15] { text-size: 14; text-wrap-width: 120; }
  [zoom>=16] { text-size: 16; text-wrap-width: 160; }
  [zoom>=17] { text-size: 20; text-wrap-width: 200; }
}

// 2_7__ Neighbourhoods & Hamlets ______________________________________

#place_label[zoom>=15][zoom<=18] {
  [type='hamlet'],
  [type='neighbourhood'] {
    text-name: @name;
    text-face-name: @sans_lt;
    text-placement: point;
    text-fill: @other_text;
    text-size: 11;
    text-halo-fill: @other_halo;
    text-halo-radius: 1.5;
    text-halo-rasterizer: fast;
    text-wrap-width: 60;
    text-wrap-before: true;
    text-line-spacing: -2;
    [zoom>=13] { text-size: 8; text-wrap-width: 60; }
    [zoom>=14] { text-size: 12; text-wrap-width: 80; }
    [zoom>=16] { text-size: 14; text-wrap-width: 100; }
    [zoom>=17] { text-size: 16; text-wrap-width: 130; }
    [zoom>=18] { text-size: 18; text-wrap-width: 160; }
  }
}


// =====================================================================
// 4__ WATER LABELS
// =====================================================================

#water_label {
  [zoom<=15][area>200000],
  [zoom=16][area>50000],
  [zoom=17][area>10000],
  [zoom>=18][area>0]{
    text-name: @name;
    text-halo-radius: 1.5;
    text-halo-rasterizer: fast;
    text-size: 11;
    text-wrap-width: 50;
    text-wrap-before: true;
    text-halo-fill: #fff;
    text-line-spacing: -2;
    text-face-name: @sans_italic;
    text-fill: @water * 0.75;
  }
  [zoom>=14][area>3200000],
  [zoom>=15][area>800000],
  [zoom>=16][area>200000],
  [zoom>=17][area>50000],
  [zoom>=18][area>10000] {
    text-size: 12;
    text-wrap-width: 75;
  }
  [zoom>=15][area>3200000],
  [zoom>=16][area>800000],
  [zoom>=17][area>200000],
  [zoom>=18][area>50000] {
    text-size: 14;
    text-wrap-width: 100;
    text-halo-radius: 2;
  }
  [zoom>=16][area>3200000],
  [zoom>=17][area>800000],
  [zoom>=18][area>200000] {
    text-size: 16;
    text-wrap-width: 125;
  }
  [zoom>=17][area>3200000],
  [zoom>=18][area>800000] {
    text-size: 18;
    text-wrap-width: 150;
  }
}


#waterway_label {
  ::river [class='river'][zoom>=13],
  ::canal [class='canal'][zoom>=15],
  ::stream [class='stream'][zoom>=17],
  ::intermittent [class='stream_intermittent'][zoom>=17] {
    text-avoid-edges: true;
    text-name: @name;
    text-face-name: @sans_italic;
    text-fill: @water * 0.75;
    text-halo-fill: fadeout(#fff,80%);
    text-halo-radius: 1.5;
    text-halo-rasterizer: fast;
    text-placement: line;
    text-size: 10;
    text-character-spacing: 1;
  }
}


// =====================================================================
// 5__ ROAD LABELS
// =====================================================================

// highway shield
#roads-text-ref {
  shield-name: "[refs]";
  shield-size: 9;
  shield-file: url('img/shield/generic-sm-[reflen].png');
  shield-face-name: @sans_bold;
  shield-fill: #555;
  shield-spacing: 200;
  shield-avoid-edges: true;
  // Workaround for Mapnik bug where shields are placed slightly over the
  // edge even when avoid-edges is true:
  shield-min-padding: 5;
  shield-min-distance: 40;
  [zoom>=12] { shield-min-distance: 50; }
  [zoom>=14] {
    shield-spacing: 400;
    shield-min-distance: 80;
    shield-size: 11;
    shield-file: url('img/shield/generic-md-[reflen].png');
  }
}

// regular labels
#road_label['mapnik::geometry_type'=2] {
  ::motorway [class='motorway'][zoom>=12],
  ::main [class='main'][zoom>=12],
  ::streetFar [class='street'][zoom<=14][len>2500],
  ::streetNear [class='street'][zoom>=15],
  ::street_limited [class='street_limited'] {
    text-avoid-edges: true;
    text-transform: uppercase;
    text-name: @name;
    text-character-spacing: 0.25;
    text-placement: line;
    text-face-name: @sans;
    text-fill: #444;
    text-size: 8;
    text-halo-fill: @road_halo;
    text-halo-radius: 1.5;
    text-halo-rasterizer: fast;
    text-min-distance: 200; // only for labels w/ the same name
    [zoom>=14] { text-size: 9; }
    [zoom>=16] { text-size: 11; }
    [zoom>=18] { text-size: 12; }
    [class='motorway'],
    [class='main'] {
      [zoom>=14] { text-size: 10; }
      [zoom>=16] { text-size: 11; text-face-name: @sans_bold; }
      [zoom>=17] { text-size: 12; }
      [zoom>=18] { text-size: 14; }
    }
  }
}

// less prominent labels for all other types, by length
#road_label {
  ::0 [len>10000][zoom>=12],
  ::1 [len>5000][zoom>=13],
  ::2 [len>2500][zoom>=14],
  ::3 [len>1200][zoom>=15],
  ::4 [len>0][zoom>=16] {
    ['mapnik::geometry_type'=2]
    [class!='motorway']
    [class!='main']
    [class!='street']
    [class!='street_limited'] {
      text-avoid-edges: true;
      text-name: @name;
      text-character-spacing: 0.25;
      text-placement: line;
      text-face-name: @sans;
      text-fill: #666;
      text-size: 9;
      text-halo-fill: @road_halo;
      text-halo-radius: 1.5;
      text-min-distance: 200; // only for labels w/ the same name
      [zoom>=17] { text-size: 10; }
      [zoom>=18] { text-size: 11; }
    }
  }
}

// =====================================================================
// ADDRESS LABELS
// =====================================================================

#housenum_label[zoom>=18] {
  text-name:'[house_num]';
  text-face-name: @sans_lt_italic;
  text-fill: darken(@building, 50%);
  text-wrap-width: 50;
  text-wrap-before: true;
  text-placement:point;
  text-size: 9;
  [zoom>=19] {
    text-size: 11;
    text-character-spacing: -0.5;
  }
}
