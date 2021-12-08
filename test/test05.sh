#! /bin/dash
# Similar test for 2041 girt-* are run in another terminal for comparasion
# However, due to the difference in the internal structures between my code # and 2041 girt, I cannot be 100% sure if the test is effective
# Examination of the internal structure (whether the file is created or 
# removed inside .girt) has been done mannually to help the test
---------------------------------------------------------------------------
# This test is mainly testing for the behavior of girt-status (more in test08)

# Remove other test data
rm .girt 2>/dev/null
./girt-init

# Generate file for test and add them to commit
touch a b c d e f g
./girt-add a b c d e
./girt-commit -m first

# this make sure that files exists in all index, commit, current dir
# 1. files are different in all three index
echo changes>>a
./girt-add a
echo changes>>a
./girt-status

# 2. files are same in index and current dir but different in commit
echo changes>>b
./girt-add b
./girt-status

# 3. Files are same in index and commit but different in curr
echo changes>>c
./girt-status

# 4. Files are same in current-dir and commit but not in index
echo changes>>d
./girt-add d
rm d
touch d
./girt-status

# 5. Files exists and same in all commit index current dir
./girt-add f
./girt-commit -m second
./girt-status

#---------------The file exists situation ended-----------
