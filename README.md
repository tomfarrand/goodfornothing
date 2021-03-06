Good for Nothing Web Hive
=========================

An embryonic platform to support and amplify the Good for Nothing communities' efforts.

## Extra useful stuff

#### Mailchimp/Devise integration

User accounts are tied to a Mailchimp subscriber lists. Users can edit their preferences on their profile page. 

Set your API key and list name in `config/mailchimp.yml`

#### Uploader storage

By default the application uses carrierwave and S3 for image storage. You'll need to pop your AWS credential in `config/carrierwave.yml`

#### Check for life

You can check your `bookmark` URLs for life by running `rake bookmarks:ping` daily. Every time a bookmark fails to respond it'll be given a strike, two strikes and it'll be automatically unpublished. A strike is deducted for every active response.

#### Facebook Events

Gigs can be published to Facebook as 'Events'.

## Datum factories

#### Wordpress

You can import posts from standard Wordpress eXtended RSS formatted files to the Conversation::Posts and Conversation::Category models using the following rake task:

    rake migrate:wordpress filename

Images referenced in posts will be downloaded and stored locally, image tags will be updated to reference these local files.

Post and category relationships will be maintained.  

#### Bookmarks 

The Netscape Bookmark format, surprisingly, is still rather common (Read it Later, Chrome, Firefox). Use this task to import bookmarks and tags into the Library::Bookmark and Conversation::Tag models.

    rake migrate:bookmarks filename

Bookmark and tag relationships will be maintained.

#### Ning user

Used to import a CSV Ning user list to a NingProfile model and map it to a core Devise User model.

    rake migrate:ning filename

## Installation:

    rake goodfornothing:install

You'll need to ensure sendmail is enabled on your server, for Engine Yard follow these instructions:

https://support.cloud.engineyard.com/entries/21016513-set-up-ssmtp-for-mail-relay-to-authsmtp    

## License

GPL License
Copyright © 2012 Good for Nothing, http://goodfornothing.com

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>