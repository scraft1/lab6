ruleset see_songs {
  meta {
    name "See Songs"
    description <<Lab 6 part 1>>
    author "Spencer Craft"
    logging on
    sharing on
  }

  rule songs is active {
    select when echo message where event:attr("msg_type").match("song")
      input "(.*)" setting(m)
      send_directive("sing") with
        song = m;
  }
 
}
