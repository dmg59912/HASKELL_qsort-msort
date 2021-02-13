--specifies that the merge function is given two arrays and gets one array back 
merge :: (Ord a)=> [a] -> [a] -> [a]
-- these are both base cases 
merge [] ys = ys -- in the case of the first list being empty, returns back the second list 
merge xs [] = xs  -- in the case of an empty second list, returns back the first list 
merge (x:xs) (y:ys) = if x < y -- asks if x is the smaller element
  then x:( merge (xs)(y:ys) ) -- if so, merge the tail with the remaining y array and x is the new head 
  else y: (merge (x:xs) (ys)) -- else, merge the x array with the tail of the y array and add y as the head of the array 


-- the ord class makes it possible for there to be ordering in the array 
msort :: Ord a => [a] ->[a]
msort [] = []  -- base case: if the list is empty , return an empty list
msort [x] = [x] -- base case for a singleton list: has only one element, will return that element 
msort arr =  merge (msort l ) (msort r) -- merges the sorted left and right halves of the array 
            where (l, r) = splitAt (length arr `div` 2) arr-- obtains those halves from spliting the main array 