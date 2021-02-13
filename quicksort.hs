
-- the ord helps with the ordering of the elements 
qsort :: (Ord a) => [a] -> [a]
qsort [] = [] --base case if list is empty, will return an empty list 
qsort (x:xs) = (qsort smaller) ++ [pivot] ++ (qsort bigger) -- adds the smaller array, the pivot and the greater half 
  where pivot = x  --x is first element of list 
        smaller = [a| a <- xs, a <= x] --list of elements less than or equal to pivot
        bigger = [ a| a <- xs, a > x] --list of elements greater than or equal to pivot 


main = do 
        putStrLn "Quicksort"  -- displays the string followed by a newline character 
        print( qsort[4,65,2,-31,0,99,2,83,287,1])  -- prints the sorted array using quick sort 
