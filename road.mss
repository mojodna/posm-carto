// ---------------------------------------------------------------------

// =====================================================================
// ROAD COLORS
// =====================================================================

@caseMotorway:  #40006a;
@fillMotorway:  #903777;

@caseTrunk:     #5f016a;
@fillTrunk:     #b0569e;

@casePrimary:   #78054e;
@fillPrimary:   #b7658b;

@caseSecondary: #7e0c5e;
@fillSecondary: #db96ad;

@caseTertiary:  #5b255c;
@fillTertiary:  #ede0ed;

@caseStreet:    #6a6a6a;
@fillStreet:    #fffdff;

@path_line:     #323232;


#ne-roads {
  line-color: lightgray;
  line-width: 1;
}
#road_area[zoom>=12] {
  polygon-fill: @fillStreet;
  line-color: @caseStreet;
  line-width: 1;
}

#tunnels {
  line-opacity: 0.33;
  line-dasharray: 55, 5;
  comp-op: multiply;
}

#infrastructure,
#tunnels,
#bridges {
  ::casing {
    line-width: 0;
    line-color: #555;
    line-join: round;
    #infrastructure {
      line-cap: round;
    }
  }

  line-width: [width] * 2;
  line-color: #666;
  line-join: round;
  #infrastructure,
  #bridges {
    line-cap: round;
  }

  ::left,
  ::right {
    line-width: 0;
  }

  [zoom >= 13] {
    line-width: [width];
  }

  [feature =~ 'aeroway_.*'] {
    line-cap: butt;
    line-width: [width];
  }

  [zoom > 13][feature =~ 'railway_.*'] {
    ::right {
      line-color: #777;
      line-offset: [width];
      line-width: [width] * 1.5;
      line-dasharray: 1, 6;
    }
  }

  [feature =~ 'highway_.*'] {
    ::casing {
      line-width: [width] + 1.5;
      line-color: @caseStreet;

      #tunnels {
        line-color: transparent;

        [feature = 'highway_service'],
        [feature = 'highway_pedestrian'],
        [feature = 'highway_track'] {
          line-dasharray: 1;
          line-opacity: 0.2;
        }
      }

      [feature =~ 'highway_motorway.*'] {
        line-color: @caseMotorway;
      }

      [feature =~ 'highway_trunk.*'] {
        line-color: @caseTrunk;
      }

      [feature =~ 'highway_primary.*'] {
        line-color: @casePrimary;
      }

      [feature =~ 'highway_secondary.*'] {
        line-color: @caseSecondary;
      }

      [feature =~ 'highway_tertiary.*'] {
        line-color: @caseTertiary;
      }

      [feature = 'highway_steps'] {
        line-color: @path_line;
        line-opacity: 0.7;
        line-dasharray: 1.5, 0.5;

        [zoom >= 15] {
          line-dasharray: 2, 0.75;
        }

        [zoom >= 16] {
          line-dasharray: 3, 1;
        }
      }

      [feature = 'highway_footway'],
      [feature = 'highway_cycleway'],
      [feature = 'highway_path'] {
        line-color: @path_line;
        line-opacity: 0.7;
        line-dasharray: 6, 1.5;

        [zoom >= 15] {
          line-dasharray: 7, 2.5;
        }

        [zoom >= 16] {
          line-dasharray: 8, 3;
        }
      }
    }

    line-color: @fillStreet;

    [feature =~ 'highway_motorway.*'] {
      line-color: @fillMotorway;

      #tunnels {
        line-color: lighten(@fillMotorway, 4);
      }
    }

    [feature =~ 'highway_trunk.*'] {
      line-color: @fillTrunk;

      #tunnels {
        line-color: lighten(@fillTrunk, 4);
      }
    }

    [feature =~ 'highway_primary.*'] {
      line-color: @fillPrimary;

      #tunnels {
        line-color: lighten(@fillPrimary, 10);
      }
    }

    [feature =~ 'highway_secondary.*'] {
      line-color: @fillSecondary;

      #tunnels {
        line-color: lighten(@fillSecondary, 4);
      }
    }

    [feature =~ 'highway_tertiary.*'] {
      line-color: @fillTertiary;

      #tunnels {
        line-color: lighten(@fillTertiary, 4);
      }
    }

    [feature = 'highway_steps'],
    [feature = 'highway_footway'],
    [feature = 'highway_cycleway'],
    [feature = 'highway_path'] {
      line-color: transparent;
    }

    [zoom <= 14],
    [zoom <= 15][prio < 340],
    [prio < 150] {
      ::casing {
        line-width: 0;
      }

      line-color: #888;
    }
  }

  [zoom >= 16][feature = 'highway_track'] {
    ::casing {
      line-width: 0;
    }

    line-width: 0;

    ::left,
    ::right {
      line-width: 0.75;
      line-color: #888;
      line-dasharray: 10, 3;
      line-join: round;
      line-cap: round;

      [access='private'] {
        line-color: lighten(mix(#888, red, 50%), 30%);
      }
    }

    ::left {
      line-offset: [width] / -2;
    }

    ::right {
      line-offset: [width] / 2;
    }
  }
}

#railway {
  line-width: 0.9;
  line-color: #444;
  line-opacity: 0.6;
  // Hatching
  h/line-width: 2.5;
  h/line-color: #444;
  h/line-dasharray: 1,7;
  h/line-opacity: 0.6;
  [tunnel='yes'] {
    line-dasharray: 2,2;
    h/line-width: 2;
  }
  [zoom>=16] {
    line-width: 1.5;
    line-color: #444;
    // Hatching
    h/line-width: 8;
    h/line-color: #444;
    h/line-dasharray: 1,15;
    [tunnel='yes'] {
      line-dasharray: 4,4;
      h/line-width: 6;
    }
  }
}
