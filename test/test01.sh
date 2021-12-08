#! /bin/dash
# Similar test for 2041 girt-* are run in another terminal for comparasion
# However, due to the difference in the internal structures between my code # and 2041 girt, I cannot be 100% sure if the test is effective
# Examination of the internal structure (whether the file is created or 
# removed inside .girt) has been done mannually to help the test
---------------------------------------------------------------------------
# This test is mainly testing for the behavior of girt-add and girt-rm
# Some failed test in autotest indicate some unknowing property when using girt-add
# if there is nothing
./girt-add aa

# Remove other test data
rm .girt 2>/dev/null
./girt-init

# Generate file for test and add them to commit
touch a b c d e
./girt-add a b c
./girt-commit -m first

# Remove the file and check the status
rm a
./girt-status

# Checking if girt-add will remove the file in index
./girt-add a
./girt-status
echo haha >>a
./girt-rm a
./girt-rm --force

# This should give error
./girt-add a



