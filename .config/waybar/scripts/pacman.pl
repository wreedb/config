#!/bin/env perl


while (1) {
  my $updates = `checkupdates | wc -l`;
  print ($updates);
}

