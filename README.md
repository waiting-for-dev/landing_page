# LandingPage

Rails 4 engine to add a subscription by email form to an application.

There are some other rails landing page solutions out there, so here it is a quick list of what this one offers:

* For Rails 4.
* An engine, so it is mountable into your own application.
* Do not come with any CSS. You have to create it according to your custom design needs.
* Collects optional name and mandatory email.
* Automatically collects the locale used by the user.
* Following subscription, customizable share buttons appear.
* Stores data in your database.
* Optional [Campaign Monitor](http://www.campaignmonitor.com/) (createsend) integration.
* Ready for I18n.
* HTML5 semantic mark-up
* Very easy to override or customize to custom needs.

## Demo

[Follow this link to see how it externally works](http://landing-page-demo.herokuapp.com/).

## Installation

* Add to your Gemfile: `gem 'landing_page', '~> 1.0'`
* Run `bundle install`
* Run `rake landing_page:install:migrations`
* Run `rake db:migrate`

## Configuration of Campaign Monitor

You must add your [Campaign Monitor API key](http://help.campaignmonitor.com/topic.aspx?t=206) and your [list id](http://www.campaignmonitor.com/api/getting-started/#listid). So, in `config/application.rb` you can write something like:

```ruby
LandingPage.campaign_monitor_api_key = 'your_api_key'
LandingPage.campaign_monitor_list_id = 'your_list_id'
```

If you want to use different credentials, for example, in  development environment, just use the same options but instead of `config/application.rb` put them in `config/environments/development.rb`.

### Collecting the locale in Campaign Monitor

Out of the box, you will collect name and email in Campaign Monitor. If you want to also collect the locale, just [create a custom field in Campaign Monitor](http://help.campaignmonitor.com/topic.aspx?t=154) and name it `locale`.

## Overriding and customization

### Models and controllers

Like any other rails engine, [use decorators to extend models and controllers](http://edgeguides.rubyonrails.org/engines.html#overriding-models-and-controllers).

### Views
Like any other rails engine, [you can override views creating them in your application](http://edgeguides.rubyonrails.org/engines.html#overriding-views).

There are three views:

* [`landing_page/users/new.html.slim`](app/views/landing_page/users/new.html.slim): the subscription form
* [`landing_page/users/create.html.slim`](app/views/landing_page/users/create.html.slim): what is displayed when user submit successfully the form
* [`landing_page/users/_share_items.html.slim`](app/views/landing_page/users/_share_items.html.slim): the share buttons showed by default. You can change them easily.

### Texts
Any text displayed is ready for localization under the namespace `landing_page`. For example, if you want to change the `Name` field label, you can put in your `config/locales/en.yml`:

```yaml
en:
  landing_page:
    label_name: Your name
```

You can check all available keys in [`config/locales/en.yml`](config/locales/en.yml).

### CSS
All HTML classes are prepended with `lp-`. You can check them in the [view files](app/views/landing_page/).

An elegant way to style them if you use a CSS preprocessor (like SASS), it is just to extend your own classes. For example:

```sass
.lp-field
  @extend .field
```

## Release Policy
landing_page follows the principles of [semantic versioning](http://semver.org/).

## LICENSE
Copyright 2013 Marc Busqué - <marc@lamarciana.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
