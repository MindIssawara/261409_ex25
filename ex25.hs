-- show that (,) is a bifunctor by implementing
pairBimap :: (a -> c) -> (b -> d)-> (a, b) -> (c, d)
pairBimap f g (x, y) = (f x, g y)
-- prove that these bifunctor laws hold:

-- pairBimap id id = id
-- show that pairBimap id id = id
--      pairBimap id id (x, y) = (id x, id y) 
--                              = (x, y)      
--                              = id (x, y)   
--  the identity law is satisfied.

-- pairBimap (f . g) (h . i) = pairBimap f h . pairBimap g i
-- show that pairBimap (f . g) (h . i) = pairBimap f h . pairBimap g i
-- LHS :
-- pairBimap (f . g) (h . i) (x, y) = ((f . g) x, (h . i) y)
--                                  = (f (g x), h (i y))
-- RHS :
-- (pairBimap f h . pairBimap g i) (x, y) = pairBimap f h (pairBimap g i (x, y))
--                                        = pairBimap f h ((g x, i y))\
--                                        = (f (g x), h (i y))
-- So, pairBimap (f . g) (h . i) = pairBimap f h . pairBimap g i
--  the composition law holds is satisfied.


--write the following natural transformations
-- Maybe → list
maybeToList :: Maybe a -> [a]
maybeToList Nothing  = []
maybeToList (Just x) = [x]
-- true or false, and why: for any f :: a -> b,  fmap f . maybeToList = maybeToList . fmap f
-- Check if fmap f . maybeToList = maybeToList . fmap f
-- LHS :
-- fmap f (maybeToList Nothing)  = fmap f []      
--                               = []
-- fmap f (maybeToList (Just x)) = fmap f [x]     
--                               = [f x]
-- RHS :
-- maybeToList (fmap f Nothing)  = maybeToList Nothing  
--                               = []
-- maybeToList (fmap f (Just x)) = maybeToList (Just (f x)) 
--                               = [f x]
-- LHS = RHS , it's True.


-- list → Maybe
listToMaybe :: [a] -> Maybe a
listToMaybe []    = Nothing
listToMaybe (x:_) = Just x
-- true or false, and why: for any f :: a -> b, fmap f . listToMaybe = listToMaybe . fmap f
-- Check if fmap f . listToMaybe = listToMaybe . fmap f
-- LHS :
-- fmap f (listToMaybe [])       = fmap f Nothing  
--                               = Nothing
-- fmap f (listToMaybe (x:_))    = fmap f (Just x) 
--                               = Just (f x)
-- RHS :
-- listToMaybe (fmap f [])       = listToMaybe []       
--                               = Nothing
-- listToMaybe (fmap f (x:_))    = listToMaybe (f x : _) 
--                               = Just (f x)
-- LHS = RHS , it's True.
