ruleset see_songs {
  meta {
    name "See Songs"
    description <<Lab 6 part 1>>
    author "Spencer Craft"
    logging on
    sharing on
  }

  rule see_songs is active {
    select when echo message input "(.*)" setting(m)
    send_directive("sing") with
      song = m;
  }
 
}
