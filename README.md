# About

This is the source code for my resume. It uses `LaTeX` and the `friggeri-cv` template, which was originally developed by Adrien Friggeri and improved by Zhen-Huan Hu.

# Build

You will need `xelatex` and `biber` to build this document from source. Once you have the required packages installed, you can use Make to build the documents.

To build the shorter, resume version:

```
$ make resume
```

To build the longer, curriculum vitae version:

```
$ make cv
```