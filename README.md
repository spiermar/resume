# About

The `friggeri-cv` was originally developed by Adrien Friggeri. This is an updated version compatible with the latest version of LuaLaTeX. Various changes have been made to make it more suitable for academic use, including:

- The default color has been changed to black-and-white.
- The font type has been changed from Helvetica to Garamond for a more academic look.
- The `entrylist` environment has been modified to support page break.
- The bibliography code has been updated so that it can be compiled with the 3.3 and above versions of `biblatex`.
- I also added index numbers to the bibliography.
- Some minor adjustments to font size.

# How to use

This CV template is relatively easy to use.
Download the whole git repo to your computer with `git clone <link>` like usual.
Then, edit the `resume.tex`, `cv.tex` and `experience.tex` files as you wish.
Once you're ready to compile, you can use either `xelatex` or `lualatex`.
Use `biber` to compile bibliography. You would then need to run `lualatex` twice in order to generate proper index numbers.

# Original "About" from Adrien Friggeri

Latest version of my CV, typesetted in Helvetica and using colors inspired by Monokai (there is an `print` option which renders in black and white, and reverts the header to dark on light, if printing on paper is needed).

Uses TikZ for the header, XeTeX and fontspec to use Helvetica Neue, biblatex to print my publications and textpos for the aside.

# License

Copyright (C) 2012, Adrien Friggeri

Copyright (C) 2017-2018, Zhen-Huan Hu

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
