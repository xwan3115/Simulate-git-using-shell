#! /bin/dash
# Similar test for 2041 girt-* are run in another terminal for comparasion
# However, due to the difference in the internal structures between my code # and 2041 girt, I cannot be 100% sure if the test is effective
# Examination of the internal structure (whether the file is created or 
# removed inside .girt) has been done mannually to help the test
---------------------------------------------------------------------------
# This test is mainly testing for the behavior of girt-status

# Remove other test data
rm .girt 2>/dev/null
./girt-init

# Generate file for test and add them to commit
touch a b c d e f g
./girt-add a b c d e
./girt-commit -m first

# Now we can see some file not exist situation
# 1. file exists in current dir but missed in index and commit
touch sth
./girt-status

# 2. file exists in current dir but missed in index and exists in commit
./girt-rm --force --cached a
./girt-status
# 2.1 follow up on 2, if exists in current dir and commit but different
echo aa>>a
./girt-status

# 3. file exists in current dir and index but not in commit
./girt-add f
./girt-status
# 3.1 follow up on 3, if exists in current dir and index but different
echo aa>>f
./girt-status

# 4. file not exists in current dir but exists in index and commit
rm b
./girt-status
# 4.1 follow up on 4, if exists in index and commit but different?
touch b
echo hahahah>>b
./girt-add b
rm b
./girt-status

# 5. file not exists in index and current but exists in commit
./girt-rm --force d
./girt-status

