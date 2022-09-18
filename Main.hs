module Main where

import Euterpea

x1 :: Music Pitch
x1 = c 4 en :+: g 4 en :+: c 5 en :+: g 5 en

x2 :: Music Pitch
x2 = c 2 en :+: d 2 en

m1 :: Music Pitch
m1 = x1 :=: x2

m2 :: Music Pitch
m2 =
  line
    [ times 2 (line [d 5 dqn, e 5 en, d 5 qn, b 4 dhn]),
      a 5 hn,
      a 5 qn,
      fs 5 dhn,
      g 5 hn,
      g 5 qn,
      d 5 dhn,
      times 2 (line [e 5 hn, e 5 qn, g 5 dqn, fs 5 en, e 5 qn, d 5 dqn, e 5 en, d 5 qn, b 4 dhn]),
      a 5 hn,
      a 5 qn,
      c 6 dqn,
      a 5 en,
      fs 5 qn,
      g 5 dhn,
      b 5 hn,
      rest qn,
      g 5 qn,
      d 5 qn,
      b 4 qn,
      d 5 dqn,
      c 5 en,
      a 4 qn,
      g 4 dhn :+: g 4 hn,
      rest qn,
      times 5 (rest wn)
    ]

main :: IO ()
main = writeMidi "test.mid" (scaleDurations 0.75 m2)
