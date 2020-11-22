# Run using docker LLVM

``` bash
$ > docker build -t llvm . 
$ > docker run -it --rm -v `pwd`/src:/src llvm /clang_11/bin/lli /src/squares.ll
```
