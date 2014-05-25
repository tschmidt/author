# Author [![GitHub version](https://badge.fury.io/gh/tschmidt%2Fauthor.svg)](http://badge.fury.io/gh/tschmidt%2Fauthor)

[![Build Status](https://travis-ci.org/tschmidt/author.svg?branch=master)](https://travis-ci.org/tschmidt/author) [![Dependency Status](https://gemnasium.com/tschmidt/author.svg)](https://gemnasium.com/tschmidt/author)

**ATTN:** This is still **very** alpha. Not everything is working. Use at your own risk.

*[imho]: In my humble opinion

A simple tool to help you write your next ebook.

I had a major itch and this is what I used to scratch it. I wanted to write an ebook, but
couldn't find a toolset that had everything I wanted. Leanpub was too limited on the
styling of the book. Kitabu drove me nuts with the hoops I had to jump through with
nokogiri. Wordsmith didn't do it for me either.

What was I looking for?

- A simple way to write my chapters in Markdown
- Generate PDFs and ePubs that were pretty to look at
- Have better looking code blocks
- Not have to do a ton of configuration!!!!

Thus, Author was born.

## Installation

Add this line to your application's Gemfile:

    gem 'author'

And then execute:

    $ bundle

Or install it yourself with:

    $ gem install author

## Quick Start Guide

    $ author new mybook
    $ cd mybook

Add your chapters to the `chapters/` folder. Name them whatever you want. Then, in the
`outline.txt` file, simply list the chapters in the order you want them to appear in the
finished book:

    preface.md
    about-the-author.md
    who-is-this-for.md
    chapter-1.md

Once you've done that, just run one of the following commands:

    author build xhtml
    author build pdf
    author build epub
    author build mobi
    author build all   # Builds everything in one go

That's it!

## Full Tutorial

Coming soon.

## Dependencies

There are a couple of executables that Author requires to do its job.

- [Prince XML](http://www.princexml.com): This is the tool used to create PDFs of your book. The free version of Prince XML is fully functional and adds a small icon to the first page of your PDF. I've looked at other solutions and this - imho - is the best one.
- [KindleGen](http://www.amazon.com/gp/feature.html?docId=1000765211): This is a tool from Amazon that will generate a `.mobi` file.

You can run `author check` to find out if you have these dependencies installed on your system.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
