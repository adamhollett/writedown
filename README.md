# Writedown

[![Travis](https://img.shields.io/travis/adamhollett/writedown.svg)](https://travis-ci.org/adamhollett/writedown)
[![Code Climate](https://img.shields.io/codeclimate/maintainability/adamhollett/writedown.svg)](https://codeclimate.com/github/adamhollett/writedown)
[![Code Climate](https://img.shields.io/codeclimate/c/adamhollett/writedown.svg)](https://codeclimate.com/github/adamhollett/writedown)

**Writedown** is an enhanced renderer for [kramdown](https://github.com/gettalong/kramdown), the pure Ruby markdown converter.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'writedown'
```

Then execute:

``` shell
bundle
```

or install it yourself with:

``` shell
gem install writedown
```

## Usage

After installing the gem, replace instances of `Kramdown::Document#to_html` in your code with `Kramdown::Document#to_writedown`.

## Features

### Asides

You can render asides or "margin notes" using an extended blockquote syntax:

Markdown

``` markdown
> Note:
> Don't forget to turn off the power.
```

HTML

``` html
<aside class="aside aside--note">
  <h4>Note</h4>
  <p>Don't forget to turn off the power.</p>
</aside>
```

### Checkboxes

You can render checkboxes in paragraphs or list items by adding a box to the beginning of the item. Fill the box with an `x` to have it pre-checked when the page is rendered:

Markdown

``` markdown
- [ ] Buy dog food
- [ ] Pick up laundry
- [x] Pay bills
```

HTML

``` html
<ul>
  <li>
    <p>
      <input type="checkbox" id="checkbox-1" />
      <label for "checkbox-1">Buy dog food</label>
    </p>
  </li>
  <li>
    <p>
      <input type="checkbox" id="checkbox-2" />
      <label for "checkbox-2">Pick up laundry</label>
    </p>
  </li><li>
    <p>
      <input type="checkbox" id="checkbox-3" checked="checked" />
      <label for "checkbox-3">Pay bills</label>
    </p>
  </li>
</ul>
```

### Figures

You can convert an image into an HTML5 figure by placing it on its own line without any other text. Passing a title to the image renders the title as a figure caption:

Markdown

``` markdown
![A still life with fruits and flowers](picture.jpg "Still life")
```

HTML

``` html
<figure>
  <img src="picture.jpg" alt="A still life with fruits and flowers" title="Still life" />
  <figcaption>Still life</figcaption>
</figure>
```

### Image dimensions

If you embed a local image, Writedown uses [fastimage](https://github.com/sdsykes/fastimage) to check the image's dimensions and pass them to the HTML:

``` markdown
![](picture.jpg)
```

HTML

``` html
<img src="picture.jpg" alt="" width="640" height="480" />
```

## Contributing

Bug reports and pull requests are welcome.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
