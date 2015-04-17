ruleset see_songs {
  meta {
    name "See Songs"
    description <<Lab 6 part 1>>
    author "Spencer Craft"
    logging on
    sharing on
  }

  rule songs is active {
    select when echo message msg_type "song" 
    input "(.*)" setting(m)
    send_directive("sing") with
      song = m;
    always {
      raise explicit event "sung"
        attributes song:m
    }
  }

  rule find_hymn is active {
    select when explicit sung where song.match(re/god/i)
    notify();
    always {
      raise explicit event "found_hymn"
    }
  }

}
