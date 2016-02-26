#!/usr/bin/env perl
use Mojolicious::Lite;

use Plack::Builder;
use lib 'lib';

# Documentation browser under "/perldoc"
plugin 'PODRenderer';

get '/' => sub {
    my $c = shift;
    $c->render( template => 'index' );
};

builder {
    enable 'WOVN',
        settings => {
        user_token => 'IRb6-',
        secret_key => 'dummy',
        };
    app->start;
};

__DATA__

@@ index.html.ep
% layout 'default';
% title 'Welcome';
Welcome to the Mojolicious real-time web framework!

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
