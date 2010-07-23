#! /bin/bash
# android-increment-manifest-version:
# increment the version number found in the AndroidManifest.xml file
# (android:versionCode="n") in place and commit it to subversion.
#
# Copyright (C) 2010 Diego Torres Milano - http://dtmilano.blogspot.com
#
# T-Mobile: Modified to increment the build string as well
# Assumes that the build string is in format X.Y.Z where
# Z is the build number that's incremented automatically

usage() {
    echo "usage: $PROGNAME AndroidManifest.xml" >&2
    exit 1
}

PROGNAME=$(basename $0)

if [ "$#" -ne 1 ]
then
    usage
fi

MANIFEST="$1"


my $dir=$MANIFEST
$dir =~ s/'AndroidManifest.xml'//g;

echo $DIR

perl -npi -e 's/^(.*android:versionCode=")(\d+)(".*)$/"$1" . ($2+1) . "$3"/e;' $MANIFEST
perl -npi -e 's/^(.*android:versionName="\d.\d.)(\d+)(".*)$/"$1" . ($2+1) . "$3"/e;' $MANIFEST
