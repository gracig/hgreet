module Period
  ( greet,
    fromTzTime,
  )
where

import qualified Data.Time as Time

data Period = Morning | Afternoon | Evening | Night deriving (Show)

greet :: Period -> String
greet period = "Good " ++ show period

fromTzTime :: Time.TimeZone -> Time.UTCTime -> Period
fromTzTime tz time =
  case Time.localTimeOfDay $ Time.utcToLocalTime tz time of
    Time.TimeOfDay hour _ _
      | hour >= 5 && hour < 12 -> Morning
      | hour >= 12 && hour < 19 -> Afternoon
      | hour >= 19 && hour < 11 -> Evening
      | otherwise -> Night
