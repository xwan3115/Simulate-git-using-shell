#! /bin/dash
# Similar test for 2041 girt-* are run in another terminal for comparasion
# However, due to the difference in the internal structures between my code # and 2041 girt, I cannot be 100% sure if the test is effective
# Examination of the internal structure (whether the file is created or 
# removed inside .girt) has been done mannually to help the test
---------------------------------------------------------------------------
# This test is mainly testing for the behavior of girt-add

# Remove other test data
rm .girt 2>/dev/null
./girt-init

# Generate file for test and add them to commit
touch a b c d e f g
./girt-add a b c d e
./girt-commit -m first

# If FILE already exists in the index
./girt-add a
echo aa>>a.txt
./girt-commit -a -m second
./girt-show :a
./girt-add a
./girt-show :a

# If the file does not exist in the current dir
./girt-add notFile

# Not exist in current dir but in index
./girt-add g
rm g
./girt-add g
./girt-status

