# Author

**ATTN:** This is still **very** alpha. Not everything is working. Use at your own risk.

A simple tool to help you write your next ebook.

I had a major itch and this is what I used to scratch it. I wanted to write an ebook, but
just could not find a toolset that had everything I wanted. Leanpub was too limited on the
styling of the book. Kitabu drove me nuts with the hoops I had to jump through with
nokogiri. Wordsmith didn't do it for me either.

What was I looking for?

- Simple way to write my chapters in Markdown
- Generate PDFs and ePubs that were pretty to look at
- Have better looking codeblocks
- Not have to do a ton of configuration!!!!

Thus, Author was born.

## Installation

Add this line to your application's Gemfile:

    gem 'author'

And then execute:

    $ bundle

Or install it yourself with:

    $ gem install author

## Usage

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

    author build xhtml # Generates the finalized XHTML site used for the other commands
    author build pdf   # Generates a PDF of your book
    author build epub  # Generates a fixed layout ePub that your eyeballs will love
    author build all   # Builds everything in one go

That's it!

Okay, there are a few other things you can do, like add a book cover image and include
images in your book. But, for the most part, that is all there is to it.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
