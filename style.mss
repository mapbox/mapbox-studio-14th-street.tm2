// Font //

@sans_bold: 'Source Sans Pro Semibold';

// Basics //

Map { background-color: #fff; }
#water { polygon-fill: #888;}

// Roads //

#road[class=~'motorway|motorway_link|main|street']['mapnik::geometry_type'=2] {
  line-color: #eee;
  line-width: 5;
  [zoom <= 16] { line-width: 3;}

  // Highlight 14 Street line segments 
  [osm_id =~ '50009632|48018651|50009629|130772956|48018648|126303361|203119342|70948803|6053914|120478694|45838763|80216582|71449615|288579361|288579360|288579359|132601117|6053903|87211939|156002607|130788219|6053916|6053918|48018640'] { 
    line-color: #e16363;
  }
}

#road_label[class=~'motorway|motorway_link|main|street'] { 
  text-name: '[name_en]';
  text-avoid-edges: true;
  text-face-name: @sans_bold;
  text-placement: line;
  text-fill: #aaa;
  text-size: 12;
  text-halo-radius: 2;
  text-halo-fill: white;
  [name=~'14th St NW'] {  text-fill: #e16363; }
}

// POIs //

/* 
Only select labels with addresses that include '14th Street N'
Somewhere in their title
*/ 
#poi_label[address=~'.*(14th Street N).*'] { 
  shield-file: url('marker.svg'); 
  shield-unlock-image: true;
  shield-size: 12;
  shield-fill: #e16363;
  shield-halo-radius: 2;
  shield-halo-fill: white;
  shield-name: '[name_en]';
  shield-face-name: @sans_bold;
  shield-text-dx: -8;
  // Odd addresses justified left 
  [address=~'(...)[13579].*'] { 
    [zoom<=16]{shield-dx: 4;}
    shield-text-dx:  8;
  }
  // Even addresses justified right 
  [address=~'(...)[24680].*'] { 
    [zoom<=16]{shield-dx: -4;}
    shield-text-dx: -8;
  }
 }