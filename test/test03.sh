#! /bin/dash
# Similar test for 2041 girt-* are run in another terminal for comparasion
# However, due to the difference in the internal structures between my code # and 2041 girt, I cannot be 100% sure if the test is effective
# Examination of the internal structure (whether the file is created or 
# removed inside .girt) has been done mannually to help the test
---------------------------------------------------------------------------
# This test is mainly testing for the behavior of girt-rm (no option on)
# The error output of girt-rm is complicated and need to be investigated
# Remove other test data
rm .girt 2>/dev/null
./girt-init

# This test file is very similar to test 03 but slightly different
# No check if index file exists --->should give error no matter what
# Generate file for test and add them to commit
touch a b c d e f g
./girt-add a b c d e
./girt-commit -m first

#----------- With cached on option
# index diff from file in working dir
# but same as file in commit
echo text>>a
./girt-rm a
# check if there is error report
# also check if the file exists in the ./girt
./girt-show :a
./girt-show 0:a
ls a

# index same from file in working dir
# but different from file in commit
echo txt>>b
./girt-add b
./girt-rm b
# check if there is error report
# also check if the file exists in the ./girt
./girt-show :b
./girt-show 0:b
cat a

# index file different from file in working dir
# also different from file in commit
echo txt>>c
./girt-add c
rm c
touch c
./girt-rm c
# check if there is error report
# also check if the file exists in the ./girt
./girt-show :c
./girt-show 0:c
cat a

# All the situation with existing file has been tested
# Now need to test if file does not exists in commit or index or current dir,
# how will the error report change
#-------------------------------------------
# index file exists but not exists in wk dir
# commit file exists and same
rm e
./girt-rm e

# index file exists but not exists in wk dir
# commit file not same
touch e
echo xx>>e
./girt-add e
rm e
./girt-rm --cached e

# The error are recorded
# not exist situation and different situation does not behave the same
