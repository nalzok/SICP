# SICP exercise solutions

[![Structure and Interpretation of Computer Programs][banner]][banner]

This is my exercise solutions for _Structure and Interpretation of Computer Programs_ by Harold Abelson and Gerald Jay Sussman with Julie Sussman, which is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License by the MIT Press.

For more information on SICP, please visit [the SICP Web Site][1].

------

## Getting started on macOS

1. Download [mit-scheme-9.2-x86-64.dmg][scheme]

2. Mount the disk image file by double clicking on it

3. Open Launchpad > Others > Terminal.app

4. Run this command in the terminal:

    `sudo ln -s /Applications/MIT\:GNU\ Scheme.app/Contents/Resources /usr/local/lib/mit-scheme-x86-64`
    
5. When prompted, enter your administrator password

6. Run this command:

    `sudo ln -s /usr/local/lib/mit-scheme-x86-64/mit-scheme /usr/local/bin/mit-scheme`
    
7. If `homebrew` is not installed on your machine, install it first:

    `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

8. Install the [readline wrapper][rlwrap]

    `brew install rlwrap`
    
9. Configure `rlwrap` for `mit-scheme`

    `echo "alias mit-scheme='rlwrap -pCyan -r -c mit-scheme'" >> ~/.bash_profile`
    
10. Now you can use MIT Scheme smoothly through the command line by running

    `mit-scheme`
    
[![screenshot][scheme-screenshot]][scheme-screenshot]

Reference:

[How to install MIT Scheme on Mac?](http://stackoverflow.com/a/31601331/5399734)

[mit-scheme REPL with command line history and tab completion](http://stackoverflow.com/a/11916365/5399734)

------

## Environment

    Hardware Overview:

      Model Name:	MacBook Air
      Model Identifier:	MacBookAir7,2
      Processor Name:	Intel Core i5
      Processor Speed:	1.6 GHz
      Number of Processors:	1
      Total Number of Cores:	2
      L2 Cache (per Core):	256 KB
      L3 Cache:	3 MB
      Memory:	4 GB
      Boot ROM Version:	MBA71.0166.B12
      SMC Version (system):	2.27f2
      
    System Software Overview:

      System Version:	macOS 10.12.1 (16B2555)
      Kernel Version:	Darwin 16.1.0
      
------

## Quotations

> I think we're responsible for stretching them(machines), setting them off in new directions, and keeping fun in the house. I hope the field of computer science never loses its sense of fun. [source][quote1]

> Thus, programs must be written for people to read, and only incidentally for machines to execute. [source][quote2]

------

## Q&A

**What can I find in this repository?**

1. Solutions with thoughts(if any) for all exercises in SICP
2. Code snippets I found interesting or instructive

**Why there are no study notes or summaries?**

Here are the reasons: 

1. I personally hate taking notes.
2. You may misunderstand my notes.

I don't think you'll need my notes, because most of my thoughts have been included in the exercise solutions. After all, to have *your* own thoughts, *you* must read SICP *yourself* and get *your* hands dirty.

**What makes this repo different from others?**

1. Everything used in my solutions would has been covered by the textbook by the time the exercise is given, apart from `newline` and `display`, which are for demonstration purpose only.
2. Some solutions are accompanied by my thoughts, and you may found them helpful or even enlightening.
3. I'm a beginner with no prior experience in functional programming and LISP, so the stuff I write is presumably more beginner-friendly than that written by those seasoned programmers.
4. While this repo is written in English, I, the author and owner, am a Chinese native speaker, which means you can open issues in Chinese, and I'll be glad to answer them.
5. Of course, it's written with <3

**Why use English?**

1. To benefit more people
2. To attract a larger audience
3. To make this repo more consistent with SICP
4. To practice my English writing skills

---

Code is licensed under a [MIT license][2].

Text is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License][3].

[banner]: https://mitpress.mit.edu/sicp/graphics/main-banner.gif
[scheme]: http://ftp.gnu.org/gnu/mit-scheme/stable.pkg/9.2/mit-scheme-9.2-x86-64.dmg
[rlwrap]: http://utopia.knoware.nl/~hlub/rlwrap/README.txt
[scheme-screenshot]: assets/scheme-screenshot.png
[quote1]: https://mitpress.mit.edu/sicp/full-text/book/book-Z-H-3.html
[quote2]: https://mitpress.mit.edu/sicp/full-text/book/book-Z-H-7.html
[1]: https://mitpress.mit.edu/sicp/
[2]: https://github.com/sunqingyao/sicp/blob/master/LICENSE
[3]: http://creativecommons.org/licenses/by-sa/4.0/

