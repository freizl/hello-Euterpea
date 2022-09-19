module Main where

import Data.Ratio ((%))
import Euterpea
import Euterpea.IO.MIDI.ToMidi2
import Codec.Midi
import Text.Pretty.Simple

x1 :: Music Pitch
x1 =
  line
    [ c 4 qn :+: c 4 qn :+: c 4 qn :+: times 2 (c 4 en),
      c 4 qn :+: c 5 qn :+: c 6 qn :+: times 2 (c 4 en),
      c 7 qn :+: c 8 qn :+: c 7 qn :+: times 2 (c 4 en)
    ]

x2 :: Music Pitch
x2 = times 3 (c 2 hn :+: d 2 hn)

m1 :: Music Pitch
m1 = x1 :+: line [c 4 qn, c 4 qn, g 4 qn, g 4 qn, a 4 qn, a 4 qn, g 4 hn]

-- :=: x2

melody :: Music Pitch
melody = line [c 5 qn, c 5 qn, g 5 qn, g 5 qn, a 5 qn, a 5 qn, g 5 hn]

chords :: Music Pitch
chords =
  chord [c 3 wn, e 3 wn, g 3 wn] :+:
  chord [c 3 hn, f 3 hn, a 3 hn] :+:
  chord [e 3 hn, g 3 hn, c 4 hn]

twinkle :: Music Pitch
twinkle = melody :=: chords

m2 :: Music Pitch
m2 =
  -- Modify (Phrase [Tmp $ Ritardando 0.5]) $
  -- Modify (Tempo $ 3 % 2) $
  -- Modify (Instrument Violin) $
    ( line1
        [ d 5 dqn, e 5 en, d 5 qn, b 4 dhn,
          d 5 dqn, e 5 en, d 5 qn, b 4 dhn,
          a 5 hn,
          a 5 qn,
          fs 5 dhn,
          g 5 hn,
          g 5 qn,
          d 5 dhn,
          times 2 (line1 [e 5 hn, e 5 qn, g 5 dqn, fs 5 en, e 5 qn, d 5 dqn, e 5 en, d 5 qn, b 4 dhn]),
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
    )

pprintMidi :: FilePath -> IO ()
pprintMidi file = do
  efile <- importFile file
  case efile of
    Left e -> print e
    Right m -> pPrint (fromMidi m)


main :: IO ()
main = do
  writeMidi2 "test1.mid" m1
  writeMidi2 "twinkle.mid" twinkle
  writeMidi2 "silent-night.mid" m2 -- (scaleDurations 0.75 m2)
  -- pprintMidi "Butterfly-Etude.mid"
  pprintMidi "Silient_Night_from_musescore.mid"
