return{
  s(
    {
      -- trigger: two character, an optional character (0 or 1 occurence) and an optional comma
      trig = "(...?,?)",
      dscr = "For the sake of formatting assembly",
      regTrig = true,
      priority = 10     -- default priority is 1000
    },
    {
      f(function(args, snip)
        local cap = snip.captures[1]  -- the first capture group
        local length = string.len(cap)  -- apply right padding
        local res = ""
        -- for in lua is inclusive on both sides. 
        for i = length, 11 do -- apply right padding, so that the total offset is 12 spaces
          res = " " .. res
        end
        return cap..res end, {}),
      i(0),
    }
  ),

  s(
    {
      trig = "(sysc?a?l?)",
      dscr = "syscall shortcut",
      regTrig = true,
      priority = 1000,
    },
    {
      t({"syscall", ""}),  -- input syscall and new line
      i(0),
    }
  ),
}
