# Evil Hamster

## A simple playlist sharing app

Create a playlist. Then share it. Or not. Disruption!

### Features

#### From the requirements

1. Made a PR to my pair's repo.
2. Added a way for users to create playlists that can be shared or kept private.
3. A "friendly" page that displays a User's playlists.

#### Bonus features

1. Users can add links to their Github or LinkedIn to their profile.
2. Make URLs nicer by using using a user's email and a playlist's title instead of a BSON id.
3. Ability for users to upload an avatar

#### More bonus features!

1. [Hosted the project in THE CLOUD!](http://evil-hamster.heroku.com/)
2. Implemented [nested resources and shallow nesting](http://edgeguides.rubyonrails.org/routing.html#nested-resources).
3. Users can make their playlists either private or public, and add tracks to them.

### Details

The domain model includes Users, Playlists and Tracks in a hierarchy.

Once a user signs in successfully, they can see all their public and private
playlists as well as their social links. If a user has no playlists, they're presented
a link to create one. Once a playlist is created, they can add tracks to it.
Users, playlists and tracks have all the standard CRUD operations.
Users can also make any of their playlists public, which will make them accessible to anyone
who has the link.
Users can also upload avatars.

### Technicalities
* Used Mongo relations to implement the relationships between the business Model.
* Used a slug gem to create friendly URLs (instead of IDs), which was a little annoying to get
right completely.
* Used env vars to manage private configs such as DB location
* Used different environments to develop (dev, prod, but not test)
* Did not build on my previous project (spaceships and pets (?)). Sharing
  spaceships not as fun to me because I know nothing about it.
* Avatars are saved in and served from GridFS
