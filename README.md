# Author [![Gem Version](https://badge.fury.io/rb/author.svg)](http://badge.fury.io/rb/author)

[![Build Status](https://travis-ci.org/tschmidt/author.svg?branch=master)](https://travis-ci.org/tschmidt/author) [![Dependency Status](https://gemnasium.com/tschmidt/author.svg)](https://gemnasium.com/tschmidt/author)

**ATTN:** Everything should be working, however, I am keeping the gem in alpha for a little while longer. The first official release should be coming soon.

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

    $ gem install author

## Usage  

    $ author new mybook
    $ cd mybook

Add your chapters to the `chapters/` folder. Name them whatever you want. Then, in the
`outline.txt` file, simply list the chapters in the order you want them to appear in the
finished book. Here's an example of what `outline.txt` should look like:

    preface.md
    about-the-author.md
    who-is-this-for.md
    chapter-1.md

In order to create ePubs, you will need to specify a few things. Open up `config.yml` and
modify the settings that are listed.

When you're ready to build your ebook, just run one of the following commands:

    author build xhtml
    author build pdf
    author build epub
    author build mobi
    author build all   # Builds everything in one go

That's it!

## Extras

One of the nice things about using Kramdown is that it provides a way to generate a table
of contents [TOC]. If you would like to add a TOC to your book, simply add a file to the
`chapters/` folder - might I suggest `toc.md` - and include the following:

```
## Table of Contents
{:.no_toc}

* this will be replaced
{:toc}
```

Then, in the `outline.txt` file, just make sure the file with that information is
the first one listed.

For anyone wanting to write books that involve a lot of code, I have built a plugin
called `awesome_codeblock`. You can specify quite a few options that will make your
codeblocks, well, more awesome. Check out `lib/author/plugins/awesome_codeblock.rb`
for all the details.

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
