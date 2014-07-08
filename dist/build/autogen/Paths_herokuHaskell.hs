module Paths_herokuHaskell (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/finn/code/haskell/herokuHaskell/.cabal-sandbox/bin"
libdir     = "/Users/finn/code/haskell/herokuHaskell/.cabal-sandbox/lib/x86_64-osx-ghc-7.6.3/herokuHaskell-0.1"
datadir    = "/Users/finn/code/haskell/herokuHaskell/.cabal-sandbox/share/x86_64-osx-ghc-7.6.3/herokuHaskell-0.1"
libexecdir = "/Users/finn/code/haskell/herokuHaskell/.cabal-sandbox/libexec"
sysconfdir = "/Users/finn/code/haskell/herokuHaskell/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "herokuHaskell_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "herokuHaskell_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "herokuHaskell_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "herokuHaskell_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "herokuHaskell_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
