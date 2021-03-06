# Writedown

[![Travis](https://img.shields.io/travis/adamhollett/writedown.svg)](https://travis-ci.org/adamhollett/writedown)
[![Code Climate](https://img.shields.io/codeclimate/maintainability/adamhollett/writedown.svg)](https://codeclimate.com/github/adamhollett/writedown)
[![Code Climate](https://img.shields.io/codeclimate/c/adamhollett/writedown.svg)](https://codeclimate.com/github/adamhollett/writedown)

**Writedown** is an enhanced renderer for [kramdown](https://github.com/gettalong/kramdown), the pure Ruby markdown converter.

## Installation

Add this line to your application's Gemfile:

``` ruby
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

## Configuration

You can configure Writedown's options using a block:

``` ruby
Writedown.configure do |config|
  config.aside_base_class    = 'aside'
  config.aside_heading_level = 5
end
```

You can find the available options in the [Configuration class](lib/writedown/configuration.rb).

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
<aside class="note">
  <h4>Note</h4>
  <p>Don't forget to turn off the power.</p>
</aside>
```

#### Configurable

With asides, you can configure:

- `aside_headings`      — which words cause asides to render instead of blockquotes
- `aside_base_class`    — the base CSS class added to aside elements
- `aside_heading_level` — the level of the heading element in the aside
- `aside_show_headings` — whether to render a heading element in the aside

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
    <p><input type="checkbox" id="checkbox-1" /><label for "checkbox-1">Buy dog food</label></p>
  </li>
  <li>
    <p><input type="checkbox" id="checkbox-2" /><label for "checkbox-2">Pick up laundry</label></p>
  </li>
  <li>
    <p><input type="checkbox" id="checkbox-3" checked="checked" /><label for "checkbox-3">Pay bills</label></p>
  </li>
</ul>
```

#### Configurable

With checkboxes, you can configure:

- `checkbox_checks`       — which characters in the source cause the rendered checkbox to be checked
- `checkbox_base_id`      — the base HTML ID added to aside elements
- `checkbox_id_separator` — the separator characters between the checkbox's base ID and its number

### Figures

You can convert an image into an HTML5 figure by placing it on its own line without any other text. Passing a title to the image renders the title as a figure caption:

Markdown

``` markdown
![A still life with fruits and flowers](picture.jpg "Still life")
```

HTML

``` html
<figure>
  <img src="picture.jpg" alt="A still life with fruits and flowers" />
  <figcaption>Still life</figcaption>
</figure>
```

#### Configurable

With figures, you can configure:

- `figure_captions`         — whether to render a figure caption instead of a title attribute
- `figure_caption_position` — whether to add the caption below `:below` or above `:above` the image
- `figure_preserve_title`   — when captions are enabled, whether to still assign the image's `title` attribute to the caption text

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
