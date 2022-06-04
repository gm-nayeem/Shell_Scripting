$ cat text.txt | head -3
$ cat text.txt | tail -2
$ cat text.txt | head -5 | tail -3
sort text.txt | uniq
$ cat text.txt | grep “This is a rose” | tee file2.txt | wc -l