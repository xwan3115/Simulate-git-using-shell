#! /bin/dash
# Similar test for 2041 girt-* are run in another terminal for comparasion
# However, due to the difference in the internal structures between my code # and 2041 girt, I cannot be 100% sure if the test is effective
# Examination of the internal structure (whether the file is created or 
# removed inside .girt) has been done mannually to help the test
---------------------------------------------------------------------------
# This test is mainly testing for the behavior of girt-commit and girt-log

# Remove other test data
rm .girt 2>/dev/null
./girt-init

# ---------------No -a option
# should pop error
./girt-init

# Generate file for test and add them to commit
touch a b c d e f g
./girt-add a b c d e
./girt-commit -m first

# Try again
./girt-commit -m second
echo text>>b
./girt-commit -m second
./girt-add b
./girt-commit -m second

# what is the message given are the same
echo text>>a
./girt-add a
./girt-commit -m second
./girt-log

# Try the error part
./girt-commit --m second
./girt-commit second
./girt-commit -a second

#-----------Then with the -a option open
echo txt>>c
echo txt>>e
echo rxr>>f
./girt-commit -a -m third
./girt-show 1:a
./girt-show 2:f
./girt-show 3:g

# try rm some file
rm a b c d e f g
./girt-commit -a -m final
./girt-show :a
./girt-show 1:a
./girt-show 2:a
./girt-show 3:a
