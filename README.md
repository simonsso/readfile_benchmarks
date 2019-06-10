# readfile_benchmarks
Replicate some benchmarks found on [the internet] 

    $run  bigfile0 
    main_c:

    real	0m3.583s
    user	0m2.439s
    sys	0m1.144s
    main_c11:

    real	0m3.675s
    user	0m2.615s
    sys	0m1.060s
    main_c17:

    real	0m3.574s
    user	0m2.533s
    sys	0m1.041s
    main_gcc:

    real	0m3.583s
    user	0m2.547s
    sys	0m1.036s

[the internet]:https://stackoverflow.com/a/51572325/391691

## Re-replicating benchmarks

First, re-replicating with the given Makefile (= no optimizations).

> N.b. I had to create dirs bin and lib.

About this mac:

```
macOS Mojave 10.14.3
MacBook Pro (Retina 15-inch, Late 2013)
Processor 2,6 GHx Intel Core i&
Memory 16 GB 1600 MHz DDR3
```

```
$ clang++ --version
Apple LLVM version 10.0.1 (clang-1001.0.46.4)
Target: x86_64-apple-darwin18.2.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
```

```
$ otool -L bin/*
bin/main_c:
	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1252.250.1)
bin/main_c11:
	/usr/lib/libc++.1.dylib (compatibility version 1.0.0, current version 400.9.4)
	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1252.250.1)
bin/main_c17:
	/usr/lib/libc++.1.dylib (compatibility version 1.0.0, current version 400.9.4)
	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1252.250.1)
bin/main_gcc:
	/usr/lib/libc++.1.dylib (compatibility version 1.0.0, current version 400.9.4)
	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1252.250.1)
```

### Large binary file

https://dumps.wikimedia.org

```
$ ./run enwiki-latest-pages-articles-multistream.xml.bz2
main_c:

real	0m33.930s
user	0m17.180s
sys	0m9.129s
main_c11:

real	13m23.211s
user	13m9.917s
sys	0m9.909s
main_c17:

real	12m55.723s
user	12m42.796s
sys	0m9.973s
main_gcc:

real	12m53.465s
user	12m40.760s
sys	0m9.752s
```

### Semilarge textfile

http://corpus.canterbury.ac.nz/descriptions/#large

```
$ ls -lh bible.txt
-rw-------@ 1 folkol  staff   3.9M Mar 21  1997 bible.txt
```

```
$ ./run bible.txt
main_c:

real	0m0.021s
user	0m0.008s
sys	0m0.005s
main_c11:

real	0m0.215s
user	0m0.209s
sys	0m0.004s
main_c17:

real	0m0.210s
user	0m0.205s
sys	0m0.003s
main_gcc:

real	0m0.205s
user	0m0.201s
sys	0m0.003s
```

## Re-re-replicating benchmarks

This time with optimizations enabled (changed Makefile: -O0 -> -O3).

```
$ ./run enwiki-latest-pages-articles-multistream.xml.bz2
main_c:

real	0m27.757s
user	0m16.011s
sys	0m8.877s
main_c11:

real	1m47.214s
user	1m34.663s
sys	0m9.628s
main_c17:

real	1m48.985s
user	1m35.462s
sys	0m10.230s
main_gcc:

real	1m45.069s
user	1m32.714s
sys	0m9.813s
```

## Re-re-re-replicating benchmarks

Optimizations enabled, sync with stdio diabled (changed printf to std::cout).

```
$ ./run enwiki-latest-pages-articles-multistream.xml.bz2
main_c:

real	0m29.106s
user	0m15.893s
sys	0m9.382s
main_c11:

real	1m43.139s
user	1m31.461s
sys	0m9.380s
main_c17:

real	1m42.604s
user	1m31.162s
sys	0m9.112s
main_gcc:

real	1m43.270s
user	1m31.598s
sys	0m9.257s
```
