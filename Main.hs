{-# LANGUAGE CPP #-}

import CoreSyn(Tickish)

main = do
#if MIN_VERSION_base(4, 14, 3)
  putStrLn "base >= 4.14.3"
#endif
#if MIN_VERSION_ghc(8, 10, 7)
  putStrLn "ghc >= 8.10.7"
#endif
#if MIN_VERSION_ghc(9, 0, 1)
  putStrLn "ghc >= 9.0.1"
#endif
  return ()
