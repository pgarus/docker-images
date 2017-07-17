# putty-builder

Dockerfile for building win32 version of PuTTY (with configfile patch by Jakub Kotrla) on Linux (or any other Docker host). Optionally you can use patch by yumeyao to fix ugly looking Cleartype fonts in bold and italic.

### Building the image

```console
docker build -t putty-builder:latest .
```

### Running the container

Image exposes a compile target volume under `/dist`, so you can mount a host directory to that point to access compiled binary files.

```console
docker run -it --rm -v $PWD/putty-binaries:/dist putty-builder:latest
```

### Credits

PuTTY: Simon Tatham (http://www.chiark.greenend.org.uk/~sgtatham/putty/)  
PuTTY for win32 storing configuration into file: Jakub Kotrla (http://jakub.kotrla.net/putty/)  
Cleartype fix: yumeyao (https://github.com/yumeyao/PuTTY/commit/d00925e62edb71cc09688cfbc7d0894a1e691a41)
