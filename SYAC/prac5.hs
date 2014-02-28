module Picture where
--import Data.List

type Hor = String
type Ver = String
type N = Int
 
data Picture = Hor N N N | Ver N N N | Add Picture Picture deriving (Show)

box :: Picture
box =  Hor 0 0 3  `Add` Hor 2 2 (-3) `Add` Ver 0 0 3 `Add` Ver 2 0 3
line = Hor 0 0 3


count :: Picture-> Int
count (Hor _ _ _) = 1 
count (Ver _ _ _) = 1
count (Add p q)   = count p + count q
 
type Coord = Int
type CoordPair = (Coord, Coord)
type Canvas = [CoordPair]
 
plus :: Canvas
plus = [(0,0),(-1,0),(0,-1),(0,1)]
 
range :: Int -> [Int]
range n | n < 0 = [n+1..0]
        | otherwise = [0..n-1]
 
hor:: CoordPair -> Int -> Canvas
hor (x,y) n = [n + x | i < range n]
 
 
--ver:: CoordPair -> Int -> Canvas
--ver (x,y) n = [? | i < range n]

