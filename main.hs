import qualified Data.ByteString.Char8 as B8

import qualified Data.ByteString.Base16 as B16

input   = B8.pack "Hello World."

encoded = B16.encode input


-- Hexagon Name : A base-36 string representing the unique identifier of the hexagon.
type HexagonNumber = String

--    Wall Number : The wall within the hexagon (1–4).
type   WallNumber = Integer 
--   Shelf Number : The shelf on the wall (1–5).
type  ShelfNumber = Integer 
--  Volume Number : The volume on the shelf (1–32).
type VolumeNumber = Integer 



data Book = Book HexagonNumber WallNumber ShelfNumber VolumeNumber  deriving (Show)
    

hexStringcharaterSet = ['0'..'9'] ++ ['a'..'z']


charaterSet =  ['a'..'z'] ++ ". ," 


getHexAdress (Book h w s v) = h ++"-w" ++ show w ++ "-s" ++ show s ++ "-v" ++ show v


-- Number of Pages: 410
-- Lines per Page: 40
-- Characters per Line: 80
-- This results in a total of:
-- 410 pages x 40 lines/page x 80 characters/line=1,312,000 characters/book
-- 410pages x 40lines/page x 80characters/line=1,312,000characters/book

book  = Book "jeb0110jlb" 2 4 16 
