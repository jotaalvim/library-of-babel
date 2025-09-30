
import Data.List.Split
import Data.List

import Data.Hashable (hash)


-- Hash Name : A string representing the unique identifier
type HashNumber   = Integer
--    Wall Number : The wall within the hexagon (1–4).
type   WallNumber = Integer
--   Shelf Number : The shelf on the wall (1–5).
type  ShelfNumber = Integer
--  Volume Number : The volume on the shelf (1–32). 
type VolumeNumber = Integer
type PageNumber   = Integer

data Book = Book HashNumber WallNumber ShelfNumber VolumeNumber PageNumber deriving (Show)

-- Total wall per room = 4
-- Volumes per shelf = 32
-- Number of Pages: 410
-- Lines per Page: 40
-- Characters per Line: 80
-- This results in a total of:
-- 410 pages x 40 lines/page x 80 characters/line=1,312,000 characters/book
-- 410pages x 40lines/page x 80characters/line=1,312,000characters/book

charaterSet =  ['a'..'z'] ++ ". ," 

pages_volume = 410
pages_shelf  = pages_volume  * 32
pages_wall   = pages_shelf   * 5
pages_total  = pages_wall    * 5

str2book :: String -> Book
str2book s = coords $ abs $ toInteger $ hash s
    
coords n = Book n wall shelf volume page
    where newn = mod n pages_total -- adjust n to fit the total pages
          (wall  , rem1) = divMod newn pages_wall
          (shelf , rem2) = divMod rem1 pages_shelf
          (volume, page) = divMod rem2 pages_volume


getHexAdress (Book h w s v p ) = show h ++"-" ++ show w ++ "-" ++ show s ++ "-" ++ show v ++ "-" ++ show p

book  = Book 9876543456789 2 4 16 300
