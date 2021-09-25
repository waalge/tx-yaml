{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric  #-}

module MyLib (buildTx) where

import           Data.Aeson
import qualified Data.ByteString.Char8 as BS
import qualified Data.Yaml             as Y
import           GHC.Generics

data TxIn = TxIn {
              hash          :: String,
              id            :: Int,
              scriptFile    :: String,
              datumValue    :: String,
              redeemerValue :: String
} deriving (Show, Generic, FromJSON)

data Tx = Tx {
             era           :: String,
             net           :: String,
             ins           :: [Maybe TxIn],
             changeAddress :: String
             }
        deriving (Show, Generic, FromJSON)


fakeParse :: String 
fakeParse = "cardano-cli transaction build \\ \n \
\   --alonzo-era \\ \n \
\   --testnet-magic 1097911063 \\ \n \
\    --tx-in null \\ \n \
\   --tx-in-script-file ./resources/hw-literal-bytstring-reedemer.plutus \\ \n \
\   --tx-in-datum-value "" \\ \n \
\   --tx-in-redeemer-value "" \\ \n \
\   --change-address addr_test1qpxfv7jx3tutncrlkwfq72l36cquzhcuytl9twuk0uvqrq0fq3tfee5cne5dcznhuyy7a5yug6mnpjnhqfpf6nj097as25py8a \\ \n \
\   --tx-in-collateral f9cb907135f5c3f88803bb405b512e62cac3f88d201586a320ef727de65e0585#0 \\ \n \
\   --protocol-params-file out/testnet/pparams.json \\ \n \
\   --out-file out/testnet/tx/hw-literal-bytstring-reedemer/raw"


buildTx :: String -> IO ()
buildTx fp = do
    content <- BS.readFile fp
    let parsedContent = Y.decodeThrow content :: Maybe Tx
    case parsedContent of
        Nothing -> error "Could not parse config file."
        (Just (_)) -> putStrLn fakeParse 

