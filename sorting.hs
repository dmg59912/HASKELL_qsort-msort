--single element is already sorted 
--then check mnext element to sort 

--Insertion sort
--create an axulary function first
insert :: Int -> [Int]->[Int] --takes and interger returns list of integers who returns the list of sorted integers with element added to the correct location
insert x [] = [x] -- base case: insert a Int into an empty list 
insert x (y:ys)--if there is a value, we look at the values of y and check for the following
    | (x <= y) = x:y:ys-- we look at the first value and check if y comes before or after x, if x is smaller then we put in in the front X:y
    | otherwise y:(insert x ys) --if y is smaller we put y to the front and recursively insert x into the remaining list

isort :: [Int] ->[Int] --takes a list of Ints and returns a list on Ints (sorted)
isort [] = [] --base case, if list is empty we return and empty list 
isort (x:xs) insert x (isort xs) --if none empty then we first insert the tail and so on 
--O(n) recurrence 
--O(n^2) complexity


--using devide and conq.
-- we start looking at the left most element 
        --ex 43 32 22 78 63 57 91 13 
        -- 43 32 22 78    |  63 57 91 13
        --43 32  |  22 78     63 57   | 91 13
        --43 | 32 | 22 | 78 | 63 | 57 | 91 | 13  now since they are now 'sorted' (single element is sorted) we start merging "upwards"
        --32 43  |  22 78  |   57 63  |  13 91
        --22 32 43 78   |   13 57 63 91
        --13 22 32 43 57 63 78 91    all sorted !!

--merge first
merge ::[Int] -> [Int] -> [Int] -- takes 'two' sorted list nad returns the combination of the subsorted list into a complete sorted list
merge [] ys = ys -- base case for first list 
merge xs [] = xs -- base case second list 

merge (x:xs) (y:ys) --otherwise we look at the first element 'x' and 'y' 
    | x <=y     = x :(merge xs (y:ys)) --if x is smaller than y then we merge the tail xs with remaining y's and then we stick x into the front
    | otherwise = y :(merge (x:xs) ys) --else if y is smaller than x we merge the tail xs into y


--now need merge sort
mergesort :: [Int] -> [Int] -- takes list of ints and return a list of ints
mergesort [] = [] --base case on an empty list 
mergesort [x] = [x] --case if only one element otherwise we might end up in an infinate loop
mergesort l = merge (mergesort (front l)) --list of more than 1 element consist of merging the two sub list 
              merge (mergesort (back l))
    where --neeed to define front and back 
    front l : take ((length l) 'div' 2) l 
    back l = drop ((length l) 'div' 2) l
--O(nlogn) 