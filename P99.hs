module P99 where
import Data.List


-- P1

p1 :: [a] -> Maybe a
p1 (x:[]) = (Just x)
p1 (_:xs) = p1 xs
p1 [] = Nothing

-- P2

p2 :: [a] -> Maybe a
p2 (x:_:[]) = (Just x)
p2 (_:xs) = p2 xs
p2 [] = Nothing

-- P3

p3 :: [a] -> Int -> Maybe a
p3 (x:_) 1 = (Just x)
p3 (_:xs) n = p3 xs (n-1)
p3 [] _ = Nothing


-- P4

p4 :: [a] -> Int
p4 [] = 0
p4 (_:xs) = 1 + p4 xs

-- P5

p5 :: [a] -> [a]
p5 [] = []
p5 (x:xs) = (p5 xs) ++ [x]
  
-- P6

p6 :: Eq a => [a] -> Bool
p6 [] = True
p6 [_] = True
p6 xs | (head xs) == (last xs) = p6 ((init . tail) xs)
      | otherwise = False

-- P7

data NestedList a = Elem a | List [NestedList a]

p7 :: NestedList a -> [a]
p7 (Elem a) = [a]
p7 (List (x:[])) = p7 x
p7 (List (x:xs)) = (p7 x) ++ p7 (List xs)
p7 (List []) = []

-- P8

p8 :: Eq a => [a] -> [a]
p8 [] = []
p8 [x] = [x]
p8 (x:xs) | x == (head xs) = (p8 xs)
          | otherwise = x : (p8 xs)

-- P9

p9 :: Eq a => [a] -> [[a]]
p9 = group 

-- P10

p10 :: Eq a => [a] -> [(Int, a)]
p10 = map (\x -> (length x, head x)) . group

p10' :: Eq a => [a] -> [(Int, a)]
p10' = map f . group
  where f xs = (length xs, head xs)

-- P11

data Item a = Single a | Multiple Int a
  deriving (Eq, Show)

p11 :: Eq a => [a] -> [Item a]
p11 = map f . group
  where f x | length x == 1 = Single (head x)
            | otherwise = Multiple (length x) (head x)

-- P12

p12 :: [Item a] -> [a]
p12 = concat . map f 
  where f (Single x) = [x]
        f (Multiple c x) = take c $ repeat x

-- P13


-- P14

p14 :: [a] -> [a]
p14 [] = []
p14 (x:xs) = x : x : p14 xs

-- P15

p15 :: [a] -> Int -> [a]
p15 _ 0 = []
p15 [] _ = []
p15 (x:xs) n = x : (p15 [x] (n-1)) ++ (p15 xs n)

-- P16

p16 :: [a] -> Int -> [a]
p16 xs c | length xs < c = xs
         | otherwise =  take (c-1) xs ++ (p16 (drop c xs) c)

-- P17

p17 :: [a] -> Int -> ([a], [a])
p17 = flip splitAt

-- P18

p18 :: [a] -> Int -> Int -> [a]
p18 xs a b | a == 1 = take b xs
           | a < 1 = []
           | otherwise = take ((b-a)+1) $ drop (a-1) xs

-- P19

p19 :: Int -> [a] -> [a]
p19 a xs | a == 0 = xs
         | a > 0 = drop a xs ++ take a xs
         | a < 0 = drop (length xs + a) xs ++ take (length xs + a) xs

-- P20

p20 :: Int -> [a] -> (a, [a])
p20 a xs = (xs !! (a-1), take (a-1) xs ++ drop a xs)

-- P21

p21 :: a -> [a] -> Int -> [a]
p21 x ys p = take (p-1) ys ++ [x] ++ drop (p-1) ys

-- P22

p22 :: Int -> Int -> [Int]
p22 x y = [x..y]

-- P23

-- pureGen = mkStdGen 137

-- p23 :: [a] -> Int -> [a]
-- p23 _ 0 = []
-- p23 xs y = (xs !! fst (uniformR (0, (y-1)) pureGen)) : p23 xs (y-1)


-- P24

-- P25

-- P26

p26 :: Int -> [a] -> [[a]]
p26 x = filter ((==) x . length) . subsequences

-- P27

p27 :: [Int] -> [a] -> [[[a]]]
p27 = undefined

-- P28

p28 :: [[a]] -> [[a]]
p28 = sortBy (\ x y -> compare (length x) (length y))


-- P31

primes :: [Int]
primes = [x | x <- [1..], p31 x]

p31 :: Int -> Bool
p31 x = not $ any id (map ((==0) . mod x) [2..(x-1)])

-- P32

p32 :: Int -> Int -> Int
p32 = gcd

-- P33

p33 :: Int -> Int -> Bool
p33 x y = (==) 1 $ gcd x y

-- P34

p34 :: Int -> Int
p34 x = sum $ map ((\y -> if y then 1 else 0) . (p33 x)) [1..x]

-- P35

-- P36

-- P37

-- P38

-- P39

p39 :: Int -> Int -> [Int]
p39 x y = filter (p31) [x..y]

-- P40

primesTo :: Int -> [Int]
primesTo x = filter (p31) [1..x]

p40 :: Int -> (Int, Int)
p40 x = f $ find (\ (a,b) -> a+b == x) [(a, b) | a <- primesTo x, b <- primesTo x]
  where f (Just a) = a
        f Nothing = (-1,-1)


-- P41 - P45 are missing

-- P46

p46 :: (Bool -> Bool -> Bool) -> [[Bool]]
p46 p = [[True, True, p True True],
        [True, False, p True False],
        [False, True, p False True],
        [False, False, p False False]]

-- P47

-- the definitions of && || and not suffice for this

-- P48

p48 :: Int -> ([Bool] -> Bool) -> [[Bool]]
p48 x f = [y ++ [f y] | y <- getInputs x]
  where getInputs 1 = [[True], [False]]
        getInputs c = map ((:) True) (getInputs (c-1)) ++ map ((:) False) (getInputs (c-1))

-- P49

p49 :: Int -> [String]
p49 x = map head $ group $ sort $ [take x lstr | lstr <- permutations (zeros ++ ones)]
  where zeros = take x (repeat '0')
        ones = take x (repeat '1')

-- P50
-- huffman trees / code


-- problems here skip to 55

data Tree a = Empty | Branch a (Tree a) (Tree a)
              deriving (Show, Eq)

-- P55

