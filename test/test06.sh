#! /bin/dash
# Similar test for 2041 girt-* are run in another terminal for comparasion
# However, due to the difference in the internal structures between my code # and 2041 girt, I cannot be 100% sure if the test is effective
# Examination of the internal structure (whether the file is created or 
# removed inside .girt) has been done mannually to help the test
---------------------------------------------------------------------------
# This test is mainly testing for the --force option and usage of girt-rm

# Remove other test data
rm .girt 2>/dev/null
./girt-init

# Generate file for test and add them to commit
touch a b c d e f g h
./girt-add a b c d e
./girt-commit -m first
./girt-add f
./girt-commit -m seconde

# Checking the usage
./girt-rm -cached f
./girt-rm -force f
./girt-rm --force -cached f
./girt-rm -force -cached f
./girt-rm --cached
./girt-rm --cached ffffff

# Check the force option
./girt-rm --force a b c d
./girt-rm --force a b c d
./girt-show :a
ls
./girt-rm --cached g
./girt-rm --force h
