#! /bin/dash
# Similar test for 2041 girt-* are run in another terminal for comparasion
# However, due to the difference in the internal structures between my code # and 2041 girt, I cannot be 100% sure if the test is effective
# Examination of the internal structure (whether the file is created or 
# removed inside .girt) has been done mannually to help the test
---------------------------------------------------------------------------
# This test is mainly testing for the behavior of girt-show


# Remove other test data
rm .girt 2>/dev/null
./girt-init

# Generate file for test and add them to commit
touch a b c d e f g
./girt-add a b c d e
./girt-commit -m first
./girt-add f
./girt-commit -m seconde

# First check the usage of girt-show
./girt-show :
./girt-show a
./girt-show a:
./girt-show
./girt-show :::
./girt-show 12345:a
./girt-show a:1
./girt-show :a
./girt-show :aaa

# Then we check the usage of girt
./girt-show :a b c d
./girt-show 1:a
./girt-show 0:b

# Making changes
echo abcde>>a
./girt-show :a
./girt-add a
./girt-show :a
rm a
./girt-add a
./girt-show :a
