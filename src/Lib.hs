module Lib
  ( run,
  )
where

import qualified Data.Time as Time
import qualified Period
import qualified System.Posix.User as User

run :: IO ()
run = greetingNow

greetingNow :: IO ()
greetingNow = do
  currentTimezone <- Time.getCurrentTimeZone
  currentTime <- Time.getCurrentTime
  name <- User.getEffectiveUserName
  putStrLn $ Period.greet (Period.fromTzTime currentTimezone currentTime) ++ " " ++ name
  putStrLn $ "UTC: " ++ show currentTime ++ " Local timezone: GMT" ++ show currentTimezone
