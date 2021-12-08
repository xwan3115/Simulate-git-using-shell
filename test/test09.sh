#! /bin/dash
# Similar test for 2041 girt-* are run in another terminal for comparasion
# However, due to the difference in the internal structures between my code # and 2041 girt, I cannot be 100% sure if the test is effective
# Examination of the internal structure (whether the file is created or 
# removed inside .girt) has been done mannually to help the test
---------------------------------------------------------------------------
# This test is mainly testing for the behavior of girt-*

# Remove other test data
rm .girt 2>/dev/null
./girt-init

# Generate file for test and add them to commit
touch a b c d e f g
echo aa >>a
echo bb >>b
./girt-add a b c d
./girt-commit -m first
rm a
./girt-add a
./girt-show :a
./girt-show :b
./girt-commit -m second
./girt-log
./girt-rm --force a b c
./girt-commit -a -m second
./girt-status

# remove everything and see
rm ./girt
./girt-status
./girt-init
./girt-add a b c d e
echo new>>a
echo old>>g
./girt-commit -a -m third
./girt-log
./girt-rm --cached a
./girt-status
