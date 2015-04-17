ruleset song_store {
  meta {
    name "Store Songs"
    description <<Lab 6 part 3>>
    author "Spencer Craft"
    logging on
    sharing on
    provides songs, hymns
  }

  global {
    songs = function(){
      ent:songs_array;
    };
    hymns = function(){
      ent:hymns_array;
    };
  }

  rule collect_songs is active {
    select when explicit sung;
    always {
      set ent:songs_array ent:songs.append(event:attr("song"))
    }
  }

  rule collect_hymns is active {
    select when explicit found_hymn;
    always {
      set ent:hymns_array ent:hymns_array.append(event:attr("hymn")) 
    }
  }

  rule clear_songs is active {
    select when song reset;
    always {
      clear ent:songs_array;
      clear ent:hymns_array;
    }
  }
  
}