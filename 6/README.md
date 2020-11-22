# Run using docker LLVM

``` bash
$ > docker build -t llvm . && docker run -it --rm -v `pwd`/src:/src llvm bash
$ root > lli /src/squares.ll
```