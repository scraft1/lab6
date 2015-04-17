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
        with song = "god"
    }
  }

  rule find_hymn is active {
    select when explicit sung song "god";
    always {
      raise explicit event "found_hymn"
    }
  }

}
